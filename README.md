# Market System Backend

**Using Laravel to build backend part.**

## Server Management

- Run **"php artisan serve"** to run server.
- Run **"php artisan test"** to test server.

## DB Management

As a test project model, Market System Backend is constructed for only one user.

- [marketdb.sql]() is located in root directory.
- Use db management tool lik Navicat, MySQL Workbench, DBeaver.
- Execute [marketdb.sql]() to import database.

**OR**

- In your project root directory, open the cmd window
- run **"php artisan migrate"** to contruct the table schema.
- Input table data with CRUD operation provided in UI.

## Project Architecture

- Controller
    - ProductController
    - ProductTypeController
    - SaleController
- Routing
    - web.php
- Test
    - ProductTest
    - ProductTypeTest
    - SaleTest