from db_queries import DatabaseQueries
from datetime import datetime
import logging
import random
import string

logging.basicConfig(level=logging.DEBUG)

def test_database_connection():
    """Test basic database connection"""
    try:
        db = DatabaseQueries()
        conn = db.db.get_connection()
        print("✓ Database connection successful!")
        conn.close()
        return True
    except Exception as e:
        print("✗ Database connection failed:", str(e))
        return False
'''
def test_user_queries(db: DatabaseQueries):
    """Test all user-related queries"""
    print("\nTesting User Queries:")
    try:
        # Test get all users
        users = db.get_all_users()
        print(f"✓ Found {len(users)} users")

        if users:
            # Test get single user
            user_id = users[0]['userid']
            single_user = db.get_user_by_id(user_id)
            print(f"✓ Successfully retrieved user: {single_user['firstname']} {single_user['lastname']}")

        # Test create user
        test_email = "skibidi@toilet.com"
        new_user = db.create_user(
            email=test_email,
            password="hashedpassword123",
            first_name="Test",
            last_name="User",
            phone_number="1234567890",
            user_type="standard",
            total_spent=0.00
        )

        if new_user is None:
            print("✗ Failed to create new user")
            return
        
        print(f"✓ Created new user with ID: {new_user}")

        # Verify new user creation using the ID
        new_user_id = db.get_user_by_id(new_user)
        if new_user_id:
            print(f"✓ Retrieved newly created user: {new_user_id['firstname']} {new_user_id['lastname']}")
            if new_user_id['email'] == test_email:
                print("✓ Successfully verified new user creation")
            else:
                print("✗ Email mismatch for newly created user")
        else:
            print("✗ Failed to retrieve newly created user by ID")

    except Exception as e:
        print("✗ User query error:", str(e))


def test_product_queries(db: DatabaseQueries):
    """Test all product-related queries"""
    print("\nTesting Product Queries:")
    try:
        # Get all products
        products = db.get_all_products()
        print(f"✓ Found {len(products)} products")
        
        if products:
            # Test get single product
            product = products[0]
            single_product = db.get_product_by_id(product['productid'], product['brandid'])
            print(f"✓ Successfully retrieved product: {single_product['name']}")
            
            # Test search with product name
            search_term = single_product['name'][:4]  # Use first 4 letters of a known product
            search_results = db.search_products(search_term)
            print(f"✓ Search for '{search_term}' found {len(search_results)} products")

            # Test search with empty/invalid term
            invalid_search = db.search_products("xxxxxxxxxxx")
            if len(invalid_search) == 0:
                print("✓ Search with invalid term correctly returned no results")
    except Exception as e:
        print("✗ Product query error:", str(e))

def test_order_queries(db: DatabaseQueries):
    """Test all order-related queries"""
    print("\nTesting Order Queries:")
    try:
        # Get all users to find one with orders
        users = db.get_all_users()
        if users:
            user_id = users[0]['userid']
            orders = db.get_user_orders(user_id)
            print(f"✓ Found {len(orders)} orders for user {user_id}")
            
            if orders:
                # Test get single order
                order_id = orders[0]['orderid']
                order_details = db.get_order_by_id(order_id)
                print(f"✓ Successfully retrieved order details for order {order_id}")
                if 'items' in order_details:
                    print(f"  Order has {len(order_details['items'])} items")
                    
                # Test non-existent order
                fake_order = db.get_order_by_id(-1)
                if fake_order is None:
                    print("✓ Correctly handled non-existent order query")
    except Exception as e:
        print("✗ Order query error:", str(e))

def test_cart_queries(db: DatabaseQueries):
    """Test all cart-related queries"""
    print("\nTesting Cart Queries:")
    try:
        # Get users to test cart
        users = db.get_all_users()
        if users:
            user_id = users[0]['userid']
            
            # Test get user cart
            cart = db.get_user_cart(user_id)
            if cart:
                print(f"✓ Successfully retrieved cart for user {user_id}")
                print(f"  Cart has {len(cart['items'])} items")
                cart_id = cart['cartid']
                
                # Test add to cart
                if len(cart['items']) > 0:
                    # Get a product to add to cart
                    products = db.get_all_products()
                    if products:
                        product = products[0]
                        success = db.add_to_cart(
                            cart_id=cart_id,
                            product_id=product['productid'],
                            brand_id=product['brandid'],
                            quantity=1
                        )
                        if success:
                            print("✓ Successfully added item to cart")
                        
                        # Test remove from cart
                        success = db.remove_from_cart(cart_id, product['productid'])
                        if success:
                            print("✓ Successfully removed item from cart")
                
                # Verify cart updates
                updated_cart = db.get_user_cart(user_id)
                if updated_cart:
                    print(f"✓ Successfully verified cart updates")
            else:
                print("✓ User has no cart (this is okay)")

            # Test invalid cart operations
            invalid_add = db.add_to_cart(-1, -1, -1, 1)
            if not invalid_add:
                print("✓ Correctly handled invalid add to cart")

            invalid_remove = db.remove_from_cart(-1, -1)
            if not invalid_remove:
                print("✓ Correctly handled invalid remove from cart")

    except Exception as e:
        print("✗ Cart query error:", str(e))
'''

def test_get_available_sizes(db: DatabaseQueries):
        """Test fetching available sizes for a product."""
        # Use a valid product_id from your database for testing
        product_id = 1345  # Replace with a valid ProductID in the ClothingItem table

        try:
            sizes = db.get_available_sizes(product_id)
            print(f"Available sizes for ProductID {product_id}: {sizes}")
        except Exception as e:
            print("Query failed with exception:", {str(e)})
def main():
    print("Starting Comprehensive Database Tests...")
    print("=" * 50)
    
    # First test connection
    if not test_database_connection():
        print("Aborting tests due to connection failure")
        return
    
    # Create database queries instance
    db = DatabaseQueries()
    
    # Run all tests
    '''
    test_user_queries(db)
    test_product_queries(db)
    test_order_queries(db)
    test_cart_queries(db)
    '''
    test_get_available_sizes(db)
    print("\nAll tests completed!")

if __name__ == "__main__":
    main()