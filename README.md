# Venus

# SETTING UP AND RUNNING THE APPLICATION:

Things to download from the GitHub:
- Venus App folder
- Datavase-Venus-v1.1.sql
- InsertStatements.sql

What applications are needed:
- MS SQL SERVER MANAGEMENT STUDIO TO HOST LOCAL DB
- IDE of your choice (I used VS code for reference)

Setting up the DB:
To set up the database, all we need is to create the tables and insert sample data into them for the application to run. To do this, enter into the MS SQL SERVER MANAGEMENT STUDIO application on your computer. It will prompt you to connect. Take a picture of this part, since you will need to hardcode this information into db_queries.py for the database connection to work. When you connect, you will do the following:

- Create a new database (name it whatever you want)
- Copy the Datavase-Venus-v1.1.sql into a new query (make sure the query is connected to the correct database), and then execute. This will create the tables for the database.
- Copy the InsertStatements.sql into a new query (make sure the query is connected to the correct database), and then execute. This will insert all the sample data necessary for the application to pull for the website.

Setting up the DB connection:
Open up the folder Venus App in VS code (make sure that the directory path is such that the project folder is opened and contains 2 folders named "templates" and "static", and 2 .py files named "app.py" and "db_queries.py". After doing this, go into the db_queries file. Change the following:

- In the top of the file, there is a DatabaseConnection class. In here, there is hardcoded information regarding the names of keys used to connect to the database you are hosting in SQL server management studio. Change the SERVER_NAME and DATABASE_NAME to match yours. Note that if your SERVER_NAME contains a backslash, you will need to add another backslash in the code prior to the backslash like this (DESKTOP-SGL6GV3\\SQLEXPRESS)

Running the app:
Before anything, make sure that you have all the necessary libraries for the project, namely Flask and pypyodbc. You can execute pip install statements from terminal or follow instructions online. Once you have done this, you can execute the app doing the following:

- Press run code (make sure you are in the app.py file) or type into terminal "python app.py"
- You will see a local address displayed, like this: Running on http://127.0.0.1:5000
- If you are in VS code, you can ctrl + click the address to open up the website in a browser, or you can copy paste the address and into a browser.

Working in the website:
PLEASE NOTE THAT THE WEBSITE IS NOT FULLY FUNCTIONAL, BUT CONTAINS AN EXAMPLE OF QUERIES/CRUD OPERATIONS. Some pages specifically are not dynamic, namely the Cart page. There are some functionalities that aren't yet implemented, such as the "edit" button for the products, or the "add to cart" button on a specific product's page. The Insert Statements do not contain sample ImageURLs. This means that the Products Page will show only the default images for the products, which is a question mark. This may be updated by the time you read this, but if not I apologize. I will list below all the functionalities shown in the app demo of our presentation:

- EXAMPLE SELECT QUERY: The search bar in the products page has full functionality. You should be able to search up a specific product(s) using keywords in their names/descriptions.
- CREATE (Add tuple to Product/User table): You can go to the Login/Register page, click on the register form, and implement sample data to create a new user tuple. You can also press the "Add product" button on the Products page and insert sample data to create a new product tuple (this product can also be seen displayed on the Products page).
- READ: This is shown in the Products Page and the Profile page upon login. The sample products are pulled from the DB, and the Profile page will display data regarding the logged in user that can be edited.
- UPDATE: As aforementioned, you can edit an existing user's data when logged in. You can click on the Profile page (it also autodirects you to this page upon log in), and you can change the existing data in the form and click "Save" to update the tuple.
- DELETE: You can delete a product in the Products page by clicking the "Delete" button under an existing product.

