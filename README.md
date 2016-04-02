# Table-editor

Table-editor with REST API and CRUD operations. Powered with Ruby on Rails, PostgreSQL and React.js

## Set up and development

Clone repository:

    $ https://github.com/micrum/table-editor.git
    $ cd table-editor

Install RVM:

    $ \curl -sSL https://get.rvm.io | bash

Install ruby, create a gemset:

    $ rvm install ruby-2.3.0
    $ rvm use 2.3.0@teditor --create
    
Install app dependencies:

    $ gem install bundler && bundle install
    
Install Postgres:

http://www.postgresql.org/download/
    
Create database & update DB schema:

    $ rake db:create
    $ rake db:migrate
    
Run development server:
 
    $ rails s

Enjoy:

http://0.0.0.0:3000/