from flask import Flask, render_template, request, jsonify
from db_queries import DatabaseQueries

app = Flask(__name__)
db = DatabaseQueries()

# Route to serve the homepage
@app.route("/")
def home():
    return render_template("about.html")

# API endpoint to fetch products
@app.route("/api/products", methods=["GET"])
def get_products():
    try:
        products = db.get_all_products()  # Fetch data from the database
        return jsonify(products)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

#API endpoint to fetch product details
@app.route("/api/products/<int:product_id>/<int:brand_id>", methods=["GET"])
def get_product_details(product_id, brand_id):
    try:
        product = db.get_product_by_id(product_id, brand_id)
        if product:
            return jsonify(product)
        else:
            return jsonify({"error": "Product not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

#API endpoint to fetch sizes for a specific product
@app.route("/api/products/<int:product_id>/sizes", methods=["GET"])
def get_available_sizes(product_id):
    """API endpoint to fetch available sizes for a product."""
    try:
        sizes = db.get_available_sizes(product_id)
        if sizes:
            return jsonify({"sizes": sizes})
        else:
            return jsonify({"error": "Sizes not found for the specified product"}), 404
    except Exception as e:
        app.logger.error(f"Error in /api/products/<product_id>/sizes: {str(e)}")
        return jsonify({"error": str(e)}), 500




#API endpoint for user creation
@app.route("/api/users", methods=["POST"])
def add_user():
    data = request.json
    try:
        user_id = db.create_user(
            email=data["email"],
            password=data["password"],
            first_name=data.get("first_name"),
            last_name=data.get("last_name"),
            phone_number=data.get("phone_number"),
            user_type=data.get("user_type"),
            dob=data.get("dob"),
            total_spent=data.get("total_spent", 0.0),
        )
        return jsonify({"user_id": user_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
#API Endpoint to fetch user profile
@app.route("/api/profile/<int:user_id>", methods=["GET"])
def get_profile(user_id):
    try:
        user = db.get_user_profile(user_id)
        if user:
            return jsonify(user), 200
        else:
            return jsonify({"error": "User not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
#API Endpoint to update user profile
@app.route("/api/profile/<int:user_id>", methods=["POST"])
def update_profile(user_id):
    data = request.json
    first_name = data.get("first_name")
    last_name = data.get("last_name")
    phone_number = data.get("phone_number")
    dob = data.get("dob")

    if not first_name or not last_name or not phone_number or not dob:
        return jsonify({"error": "All fields are required"}), 400

    try:
        success = db.update_user_profile(user_id, first_name, last_name, phone_number, dob)
        if success:
            return jsonify({"message": "Profile updated successfully"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

#FETCH USER VIA EMAIL
@app.route("/api/profile/<email>", methods=["GET"])
def get_profile_via_email(email):
    try:
        user = db.get_user_profile_by_email(email)
        if user:
            return jsonify(user), 200
        else:
            return jsonify({"error": "User not found"}), 404
    except Exception as e:
        return jsonify({"error": str(e)}), 500

#UPDATE USER VIA EMAIL 
@app.route("/api/profile/<email>", methods=["POST"])
def update_profile_via_email(email):
    data = request.json
    first_name = data.get("first_name")
    last_name = data.get("last_name")
    phone_number = data.get("phone_number")
    dob = data.get("dob")

    if not first_name or not last_name or not phone_number or not dob:
        return jsonify({"error": "All fields are required"}), 400

    try:
        success = db.update_user_profile_by_email(email, first_name, last_name, phone_number, dob)
        if success:
            return jsonify({"message": "Profile updated successfully"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500



#API endpoint to handle search queries
@app.route("/api/search", methods=["GET"])
def search_products():
    query = request.args.get("q", "")  # Get query parameter
    try:
        products = db.search_products(query)  # Use your backend's search function
        return jsonify(products)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

#API endpoints to manage cart
@app.route("/api/cart", methods=["GET"])
def get_cart():
    user_id = request.args.get("user_id")  # Assume user ID is passed
    try:
        cart = db.get_user_cart(int(user_id))
        return jsonify(cart)
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route("/api/cart", methods=["POST"])
def add_to_cart():
    data = request.json
    try:
        success = db.add_to_cart(
            cart_id=data["cart_id"],
            product_id=data["product_id"],
            brand_id=data["brand_id"],
            quantity=data.get("quantity", 1),
        )
        return jsonify({"success": success})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/api/cart", methods=["DELETE"])
def remove_from_cart():
    data = request.json
    app.logger.info(f"Received DELETE request with data: {data}")
    try:
        cart_id = data.get("cart_id")
        product_id = data.get("product_id")
        if not cart_id or not product_id:
            return jsonify({"error": "Invalid cart_id or product_id"}), 400
        # Proceed with deletion logic
        success = db.remove_from_cart(cart_id, product_id)
        return jsonify({"success": success})
    except Exception as e:
        app.logger.error(f"Error in deletion: {str(e)}")
        return jsonify({"error": str(e)}), 500

#API Endpoint to handle new user registration
@app.route("/api/register", methods=["POST"])
def register_user():
    data = request.json
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"error": "Both email and password are required"}), 400

    try:
        success = db.create_user(email, password)
        if success:
            return jsonify({"message": "User registered successfully"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/api/products", methods=["POST"])
def create_product_endpoint():
    data = request.json

    # Extract required fields
    product_id = data.get("product_id")
    brand_id = data.get("brand_id")
    name = data.get("name")
    image_url = data.get("image_url")

    # Ensure required fields are present
    if not product_id or not brand_id or not name:
        return jsonify({"error": "Missing required fields: product_id, brand_id, and name"}), 400

    try:
        # Call the create_product function directly
        success = db.create_product(
            product_id=product_id,
            brand_id=brand_id,
            name=name,
            description=data.get("description", ""),
            price=data.get("price", 0.0),
            material=data.get("material", ""),
            stock_quantity=data.get("stock_quantity", 0),
            ref_category=data.get("ref_category", ""),
            image_url=image_url,
        )
        if success:
            return jsonify({"message": "Product created successfully"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500

#API endpoint to handle sorting requests
@app.route("/api/products", methods=["GET"])
def get_sorted_products():
    sort_by = request.args.get("sort", "default")

    try:
        if sort_by == "price_asc":
            products = db.get_products_sorted_by_price_asc()
        elif sort_by == "price_desc":
            products = db.get_products_sorted_by_price_desc()
        elif sort_by == "rating":
            products = db.get_products_sorted_by_rating()
        else:
            products = db.get_products_sorted_by_default()

        return jsonify([dict(product) for product in products]), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


#API Endpoint to verify user credential during login
@app.route("/api/login", methods=["POST"])
def login_user():
    data = request.json
    email = data.get("email")
    password = data.get("password")

    if not email or not password:
        return jsonify({"error": "Both email and password are required"}), 400

    try:
        user = db.get_user_by_email_and_password(email, password)
        if user:
            # Return user_id in the response
            return jsonify({"message": "Login successful", "user_id": user["id"]}), 200
        else:
            return jsonify({"error": "Invalid email or password"}), 401
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route("/api/users/<int:user_id>", methods=["DELETE"])
def delete_user_endpoint(user_id):
    try:
        with db.get_connection() as conn:
            cursor = conn.cursor()
            db.delete_user(cursor, user_id)
            conn.commit()
        return jsonify({"message": "User deleted successfully"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500



@app.route("/api/products/<int:product_id>/<int:brand_id>", methods=["PUT"])
def update_product_endpoint(product_id, brand_id):
    data = request.json
    try:
        with db.get_connection() as conn:
            cursor = conn.cursor()
            db.update_product(cursor, product_id, brand_id, data)
            conn.commit()
        return jsonify({"message": "Product updated successfully"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route("/api/products/<int:product_id>/<int:brand_id>", methods=["DELETE"])
def delete_product_endpoint(product_id, brand_id):
    try:
        with db.get_connection() as conn:
            cursor = conn.cursor()
            db.delete_product(cursor, product_id, brand_id)
            conn.commit()
        return jsonify({"message": "Product deleted successfully"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500



# Serve other HTML pages
@app.route("/<path:path>")
def serve_page(path):
    return render_template(path)

if __name__ == "__main__":
    app.run(debug=True)
