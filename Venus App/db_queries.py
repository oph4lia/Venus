import pypyodbc as odbc
from typing import List, Dict, Any, Optional
from datetime import date
import logging

class DatabaseConnection:
    def __init__(self):
        self.DRIVER_NAME = 'SQL SERVER'
        self.SERVER_NAME = 'DESKTOP-SGL6GV3\\SQLEXPRESS'
        self.DATABASE_NAME = 'TEST'
        
        self.connection_string = f"""
            DRIVER={{{self.DRIVER_NAME}}};
            SERVER={self.SERVER_NAME};
            DATABASE={self.DATABASE_NAME};
            Trust_Connection=yes;
        """
    
    def get_connection(self):
        return odbc.connect(self.connection_string)

class DatabaseQueries:
    def __init__(self):
        self.db = DatabaseConnection()




    def update_product(self, product_id: int, brand_id: int, updates: dict) -> bool:
        """Update product details."""
        fields = ", ".join(f"{key} = ?" for key in updates.keys())
        query = f"UPDATE Product SET {fields} WHERE ProductID = ? AND BrandID = ?;"
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (*updates.values(), product_id, brand_id))
                conn.commit()
                return True
        except Exception as e:
            raise Exception(f"Error updating product: {str(e)}")


    def delete_product(self, product_id: int, brand_id: int) -> bool:
        """Delete a product by its ProductID and BrandID."""
        query = "DELETE FROM Product WHERE ProductID = ? AND BrandID = ?;"
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (product_id, brand_id))
                conn.commit()
                return True
        except Exception as e:
            raise Exception(f"Error deleting product: {str(e)}")
        


    # User-related queries
    def delete_user(self, user_id: int) -> bool:
        """Delete a user by UserID."""
        query = 'DELETE FROM "User" WHERE UserID = ?;'
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (user_id,))
                conn.commit()
                return True
        except Exception as e:
            raise Exception(f"Error deleting user: {str(e)}")


    def get_user_by_id(self, user_id: int) -> Optional[Dict]:
        """Get user by ID"""
        with self.db.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("""
                SELECT * FROM "User" WHERE UserID = ?
            """, (user_id,))
            columns = [column[0] for column in cursor.description]
            result = cursor.fetchone()
            return dict(zip(columns, result)) if result else None

    def get_all_users(self) -> List[Dict]:
        """Get all users"""
        with self.db.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute('SELECT * FROM "User"')
            columns = [column[0] for column in cursor.description]
            return [dict(zip(columns, row)) for row in cursor.fetchall()]
    
    def create_user(self, email: str, password: str) -> bool:
        """Create a new user with email and password."""
        query = """
            INSERT INTO "User" (Email, Password)
            VALUES (?, ?)
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (email, password))
                conn.commit()
                return True
        except Exception as e:
            raise Exception(f"Error creating user: {str(e)}")

    def create_product(self, product_id: int, brand_id: int, name: str, description: str = "",
                    price: float = 0.0, material: str = "", stock_quantity: int = 0,
                    ref_category: str = "", image_url: str = "") -> bool:
        """Create a new product with optional fields."""
        query = """
            INSERT INTO Product (ProductID, BrandID, Name, Description, Price, Material, StockQuantity, RefCategory, ImageURL)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (product_id, brand_id, name, description, price,
                                    material, stock_quantity, ref_category, image_url))
                conn.commit()
                return True
        except Exception as e:
            raise Exception(f"Error creating product: {str(e)}")

    
    def get_user_by_email_and_password(self, email: str, password: str) -> dict:
        """Fetch user details by email and password."""
        query = """
            SELECT UserID, Email
            FROM "User"
            WHERE Email = ? AND Password = ?
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (email, password))
                user = cursor.fetchone()
                if user:
                    return {"id": user[0], "email": user[1]}
                return None
        except Exception as e:
            raise Exception(f"Error verifying user: {str(e)}")
        
    def get_user_profile_by_email(self, email: str) -> dict:
        """Fetch user profile details using email."""
        query = """
            SELECT UserID, FirstName, LastName, Email, PhoneNumber, DOB
            FROM "User"
            WHERE Email = ?
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (email,))
                result = cursor.fetchone()
                if result:
                    return {
                        "user_id": result[0],
                        "first_name": result[1],
                        "last_name": result[2],
                        "email": result[3],
                        "phone_number": result[4],
                        "dob": result[5],
                    }
                return None
        except Exception as e:
            raise Exception(f"Error fetching user profile: {str(e)}")
        
    def update_user_profile_by_email(self, email: str, first_name: str, last_name: str, phone_number: str, dob: str) -> bool:
        """Update user profile details using email."""
        query = """
            UPDATE "User"
            SET FirstName = ?, LastName = ?, PhoneNumber = ?, DOB = ?
            WHERE Email = ?
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (first_name, last_name, phone_number, dob, email))
                conn.commit()
                return True
        except Exception as e:
            raise Exception(f"Error updating user profile: {str(e)}")



    def get_user_profile(self, user_id: int) -> dict:
        """Fetch user profile details."""
        query = """
            SELECT UserID, FirstName, LastName, Email, PhoneNumber, DOB
            FROM "User"
            WHERE UserID = ?
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (user_id,))
                result = cursor.fetchone()
                if result:
                    return {
                        "user_id": result[0],
                        "first_name": result[1],
                        "last_name": result[2],
                        "email": result[3],
                        "phone_number": result[4],
                        "dob": result[5],
                    }
                return None
        except Exception as e:
            raise Exception(f"Error fetching user profile: {str(e)}")
        
    def update_user_profile(self, user_id: int, first_name: str, last_name: str, phone_number: str, dob: str) -> bool:
        """Update user profile details."""
        query = """
            UPDATE "User"
            SET FirstName = ?, LastName = ?, PhoneNumber = ?, DOB = ?
            WHERE UserID = ?
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (first_name, last_name, phone_number, dob, user_id))
                conn.commit()
                return True
        except Exception as e:
            raise Exception(f"Error updating user profile: {str(e)}")
        
    def get_user_by_email_and_password(self, email: str, password: str) -> dict:
        """Fetch user details by email and password."""
        query = """
            SELECT UserID, Email
            FROM "User"
            WHERE Email = ? AND Password = ?
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (email, password))
                result = cursor.fetchone()
                if result:
                    return {"id": result[0], "email": result[1]}
                return None
        except Exception as e:
            raise Exception(f"Error verifying user: {str(e)}")




    
    def get_product_by_id(self, product_id: int, brand_id: int) -> Optional[Dict]:
        """Get product by ID and brand ID"""
        with self.db.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("""
                SELECT * FROM Product WHERE ProductID = ? AND BrandID = ?
            """, (product_id, brand_id))
            columns = [column[0] for column in cursor.description]
            result = cursor.fetchone()
            return dict(zip(columns, result)) if result else None

    def get_all_products(self) -> List[Dict]:
        """Get all products"""
        with self.db.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("""
                SELECT 
                    p.ProductID AS product_id,
                    p.BrandID AS brand_id,
                    p.Name AS name,
                    p.Description AS description,
                    p.Price AS price,
                    p.Material AS material,
                    p.StockQuantity AS stock_quantity,
                    p.DateAdded AS date_added,
                    p.LastUpdated AS last_updated,
                    p.AverageRating AS average_rating,
                    p.Weight AS weight,
                    p.RefCategory AS category,
                    COALESCE(p.ImageURL, '/static/images/default.jpg') AS image_url,
                    b.Name AS brand_name
                FROM Product p
                JOIN Brand b ON p.BrandID = b.BrandID
            """)
            # Fetch column names for dynamic key mapping
            columns = [column[0] for column in cursor.description]
            return [dict(zip(columns, row)) for row in cursor.fetchall()]


    def search_products(self, query: str) -> list[dict]:
        """Search for products by name or description and return a list of dictionaries with frontend-compatible keys."""
        query_text = """
            SELECT 
                ProductID AS product_id,
                BrandID AS brand_id,
                Name AS name,
                Description AS description,
                Price AS price,
                Material AS material,
                StockQuantity AS stock_quantity,
                DateAdded AS date_added,
                LastUpdated AS last_updated,
                AverageRating AS average_rating,
                Weight AS weight,
                RefCategory AS category,
                COALESCE(ImageURL, '/static/images/default.jpg') AS image_url
            FROM Product
            WHERE Name LIKE ? OR Description LIKE ?;
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                search_term = f"%{query}%"
                cursor.execute(query_text, (search_term, search_term))

                # Retrieve column names from the cursor
                columns = [column[0] for column in cursor.description]

                # Map rows to dictionaries
                products = [dict(zip(columns, row)) for row in cursor.fetchall()]
                return products
        except Exception as e:
            raise Exception(f"Error searching products: {str(e)}")



            
    def get_available_sizes(self, product_id: int) -> list:
        """Fetch available sizes for a product from the ClothingItem table."""
        query = """
            SELECT AvailableSizes
            FROM ClothingItem
            WHERE ProductID = ?
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query, (product_id,))
                result = cursor.fetchone()

                if result and result[0]:
                    # Split the sizes into a list if they are stored as a comma-separated string
                    return result[0].split(",")
                else:
                    return []  # No sizes found
        except Exception as e:
            raise Exception(f"Error fetching available sizes: {str(e)}")

    def get_order_by_id(self, order_id: int) -> Optional[Dict]:
        """Get order by ID with items"""
        with self.db.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("""
                SELECT * FROM "Order" WHERE OrderID = ?
            """, (order_id,))
            columns = [column[0] for column in cursor.description]
            order = cursor.fetchone()
            if not order:
                return None
            
            order_dict = dict(zip(columns, order))
            
            cursor.execute("""
                SELECT oi.*, p.Name as ProductName
                FROM OrderItem oi
                JOIN Product p ON oi.ProductID = p.ProductID AND oi.BrandID = p.BrandID
                WHERE oi.OrderID = ?
            """, (order_id,))
            columns = [column[0] for column in cursor.description]
            order_dict['items'] = [dict(zip(columns, row)) for row in cursor.fetchall()]
            
            return order_dict

    def get_user_orders(self, user_id: int) -> List[Dict]:
        """Get all orders for a user"""
        with self.db.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("""
                SELECT * FROM "Order" WHERE UserID = ? ORDER BY OrderDate DESC
            """, (user_id,))
            columns = [column[0] for column in cursor.description]
            return [dict(zip(columns, row)) for row in cursor.fetchall()]

    def get_user_cart(self, user_id: int) -> Optional[Dict]:
        """Get user's cart with items"""
        with self.db.get_connection() as conn:
            cursor = conn.cursor()
            cursor.execute("""
                SELECT * FROM Cart WHERE UserID = ?
            """, (user_id,))
            columns = [column[0] for column in cursor.description]
            cart = cursor.fetchone()
            
            if not cart:
                return None
            
            cart_dict = dict(zip(columns, cart))
            
            cursor.execute("""
                SELECT ci.*, p.Name as ProductName, p.Price, b.Name as BrandName
                FROM CartItem ci
                JOIN Product p ON ci.ProductID = p.ProductID AND ci.BrandID = p.BrandID
                JOIN Brand b ON p.BrandID = b.BrandID
                WHERE ci.cartid = ?
            """, (cart_dict['cartid'],))
            columns = [column[0] for column in cursor.description]
            cart_dict['items'] = [dict(zip(columns, row)) for row in cursor.fetchall()]
            
            return cart_dict

    def add_to_cart(self, cart_id: int, product_id: int, brand_id: int, quantity: int = 1) -> bool:
        """Add item to cart"""
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute("""
                    INSERT INTO CartItem (CartID, ProductID, BrandID, Quantity, AddedAt)
                    VALUES (?, ?, ?, ?, GETDATE())
                """, (cart_id, product_id, brand_id, quantity))
                conn.commit()
                return True
        except odbc.Error:
            return False

    def remove_from_cart(self, cart_id: int, product_id: int) -> bool:
        """Remove item from cart"""
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute("""
                    DELETE FROM CartItem 
                    WHERE CartID = ? AND ProductID = ?
                """, (cart_id, product_id))
                conn.commit()
                return True
        except odbc.Error:
            return False
        
    def get_products_sorted_by_default(self) -> List[Dict]:
        """Get all products in default order."""
        query = """
            SELECT 
                p.ProductID AS product_id,
                p.BrandID AS brand_id,
                p.Name AS name,
                p.Description AS description,
                p.Price AS price,
                p.Material AS material,
                p.StockQuantity AS stock_quantity,
                p.DateAdded AS date_added,
                p.LastUpdated AS last_updated,
                p.AverageRating AS average_rating,
                p.Weight AS weight,
                p.RefCategory AS category,
                COALESCE(p.ImageURL, '/static/images/default.jpg') AS image_url,
                b.Name AS brand_name
            FROM Product p
            JOIN Brand b ON p.BrandID = b.BrandID
            ORDER BY p.ProductID;
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query)
                # Fetch column names for dynamic key mapping
                columns = [column[0] for column in cursor.description]
                return [dict(zip(columns, row)) for row in cursor.fetchall()]
        except Exception as e:
            raise Exception(f"Error fetching products in default order: {str(e)}")


    def get_products_sorted_by_price_asc(self) -> List[Dict]:
        """Get all products sorted by price (low to high)."""
        query = """
            SELECT 
                p.ProductID AS product_id,
                p.BrandID AS brand_id,
                p.Name AS name,
                p.Description AS description,
                p.Price AS price,
                p.Material AS material,
                p.StockQuantity AS stock_quantity,
                p.DateAdded AS date_added,
                p.LastUpdated AS last_updated,
                p.AverageRating AS average_rating,
                p.Weight AS weight,
                p.RefCategory AS category,
                COALESCE(p.ImageURL, '/static/images/default.jpg') AS image_url,
                b.Name AS brand_name
            FROM Product p
            JOIN Brand b ON p.BrandID = b.BrandID
            ORDER BY p.Price ASC;
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query)
                columns = [column[0] for column in cursor.description]
                return [dict(zip(columns, row)) for row in cursor.fetchall()]
        except Exception as e:
            raise Exception(f"Error fetching products sorted by price (low to high): {str(e)}")


    def get_products_sorted_by_price_desc(self) -> List[Dict]:
        """Get all products sorted by price (high to low)."""
        query = """
            SELECT 
                p.ProductID AS product_id,
                p.BrandID AS brand_id,
                p.Name AS name,
                p.Description AS description,
                p.Price AS price,
                p.Material AS material,
                p.StockQuantity AS stock_quantity,
                p.DateAdded AS date_added,
                p.LastUpdated AS last_updated,
                p.AverageRating AS average_rating,
                p.Weight AS weight,
                p.RefCategory AS category,
                COALESCE(p.ImageURL, '/static/images/default.jpg') AS image_url,
                b.Name AS brand_name
            FROM Product p
            JOIN Brand b ON p.BrandID = b.BrandID
            ORDER BY p.Price DESC;
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query)
                columns = [column[0] for column in cursor.description]
                return [dict(zip(columns, row)) for row in cursor.fetchall()]
        except Exception as e:
            raise Exception(f"Error fetching products sorted by price (high to low): {str(e)}")


    def get_products_sorted_by_rating(self) -> List[Dict]:
        """Get all products sorted by rating (high to low)."""
        query = """
            SELECT 
                p.ProductID AS product_id,
                p.BrandID AS brand_id,
                p.Name AS name,
                p.Description AS description,
                p.Price AS price,
                p.Material AS material,
                p.StockQuantity AS stock_quantity,
                p.DateAdded AS date_added,
                p.LastUpdated AS last_updated,
                p.AverageRating AS average_rating,
                p.Weight AS weight,
                p.RefCategory AS category,
                COALESCE(p.ImageURL, '/static/images/default.jpg') AS image_url,
                b.Name AS brand_name
            FROM Product p
            JOIN Brand b ON p.BrandID = b.BrandID
            ORDER BY p.AverageRating DESC;
        """
        try:
            with self.db.get_connection() as conn:
                cursor = conn.cursor()
                cursor.execute(query)
                columns = [column[0] for column in cursor.description]
                return [dict(zip(columns, row)) for row in cursor.fetchall()]
        except Exception as e:
            raise Exception(f"Error fetching products sorted by rating: {str(e)}")
