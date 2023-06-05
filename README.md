# Market System Backend

Market System Backend is a system built for managing products, product types, and sales using Laravel, a PHP web application framework.

The project consists of several components, including the `ProductController`, `ProductTypeController`, and `SaleController`, which are responsible for managing and controlling the logic of products, product types, and sales in the system, respectively.

The `web.php` file handles all the routing for the application, mapping the HTTP requests to the corresponding controller functions.

`Tests` are an essential part of any software development project, and this application is no different. The `ProductTest`, `ProductTypeTest`, and `SaleTest` classes contain test cases for testing the various functions and features of the application.

To manage the application's database, there are two options provided. The first is to use a database management tool like `Navicat`, `MySQL Workbench`, or `DBeaver` to create a new database called marketdb and execute marketdb.sql to construct schemas and data. The second is to run `"php artisan migrate"` in the command window from the project root directory, which will construct the table schema. Table data can then be input using the CRUD functionality provided in the application's UI.

Overall, the Market System Backend is a PHP Laravel web application that provides basic features for managing products, product types, and sales.

## Server Management

Server running on `localhost:8000`.

- Run **"php artisan serve"** to run server.
- Run **"php artisan test"** to test server.

## DB Management

As a test project model, Market System Backend is constructed for only one user.

- `marketdb.sql` is located in root directory.
- Use db management tool lik `Navicat`, `MySQL Workbench`, `DBeaver`.
- Create `marketdb` database.
- In `marketdb`, execute `marketdb.sql` to construct schemas and data.

**OR**

- In your project root directory, open the cmd window
- run **"php artisan migrate"** to contruct the table schema.
- Input table data with CRUD operation provided in UI (product).

## Project Architecture

- Controller
    - `ProductController`  
    This is a controller responsible for managing the products in the system. It contains functions for listing all products, showing a specific product by ID, adding a new product, updating an existing product, and deleting a product.
    - `ProductTypeController`  
    This controller will manage the product types or categories. It has functions to list all product types, show a specific product type by its ID, add a new product type, update an existing product type, and delete a product type.
    - `SaleController`  
    This is a controller that will handle all the sales in the system. It includes functions for listing all sales, and summarizing it.
- Routing
    - `web.php`  
    This is the routing file that defines all the web routes of the application. It maps HTTP requests to their corresponding controller functions.
- Test
    - `ProductTest`  
    This is a testing class that is responsible for testing the functions in the **ProductController**. It includes test cases for checking the CRUD operations of the **ProductController**.
    - `ProductTypeTest`  
    This is a testing class that tests the functions in the **ProductTypeController**. It includes test cases for checking the CRUD operations of the **ProductTypeController**.
    - `SaleTest`  
    This is the testing class that will test the functions in the **SaleController**. It includes test cases that ensure the correct and expected behavior of the **SaleController**.