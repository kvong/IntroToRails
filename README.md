## Notes

#### Get started building a Rails app
1. Build a new app using Rails CLI (commandline interface).
```
$ rails new <name> -d <database>
```
2. Install dependencies
```
$ bundle install
```
3. Set up database configuration `app/config/database.yml`
- Create a mysql database and table with the following MySQL command.
    ```
    $ mysql -u root -p
    mysql> CREATE DATABASE <database-name>;
    mysql> USE <database-name>;
    mysql> GRANT ALL PRIVILEGES ON <database-name>.*
    -----> TO '<username>'@'localhost'
    -----> IDENTIFIED BY '<password>';
    mysql> exit;

    ```
4. Run project
```
$ rails server
```
5. Create a controller and its actions.

`$ rails generate <controller-name> <action-name>...` will generate files located in `app/controller/...`, `app/views/<controller-name>`

    - rails generate controller <controller-name> <action>...
    - Controller hold the functions to be executed on page load.
    - Action are the different function for each page. A page's name is the same as its action name.
    - View files are also generated
        - Holds .ebr files (Embedded Ruby Files) which holds Ruby and HTML code.
            <% Ruby Code %>
            <%= Ruby Code with Output %>
            <%# Comment %>
    - Action can pass variables to View using instance variables. For example, @var_name.
        - Use it in view: <%= @var_name %>
6. Routing `config/routes.rb`
    - After setting up the view we must route the URL to the view and controller.
7. Linking different views and its associated action
    - Instead \<a\> tag use: 
        ```
        <%= link_to("Go to page", {:controller => '<controller-name>',
                                    :action => '<action-name>',
                                    :name => 'John', :age => '19'}) %>
        ```
    - Clicking on the link will display the content of `<action-name>.html.erb` and run the action.
        - Argument are optional, and will be stored in `params` variable to be accessed in the action function.
8. Connect to a Database.

    1. Fill out field in `config/database.yml`
    2. `rake db:schema:dump` will connect the web app to the database and create `db/schema.rb` file.

9. Using rails to generate Rails database object/table.
    - Running `$ rails generate model <table-name>` will generate a migration file inside of `db/migrate/[number]_create_<table-name>.rb`
        - In the migration file we can specify the columns
            ```
            t.string 'name', :limit => 50, :null => false

            # Alternatively
            t.column 'name', :string, :limit => 50, :null => false
            ```
        - Using a migration file to create the table makes it easier for us to switch database, as rails will set up the tables for us automatically.
    - Run `$ rake db:migrate` to create the table from the migration file.


## Screenshots

![](screenshots/home.png)

![](screenshots/article.png)


