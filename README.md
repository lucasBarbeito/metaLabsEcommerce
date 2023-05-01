
# MetaLabs Ecommerce

## Prerequisites
-You need to have installed rvm in your system RVM if you dont you can follow the instructions here https://rvm.io/rvm/install
-You need to have installed postgresql if not follow this instructions https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04






## Local enviroment configuration

Install Ruby Version if you dont have it

```
rvm install 3.0.4
```
Use Ruby Version

```
rvm use 3.0.4
```
Install Rails

```
gem install rails
```

After you clone the project it will automaticaly create the gemset, you only need to run the command

```
bundle Install
```

Before running the db commands create a .env file with your postgres configuration
```
POSTGRES_USER=''
POSTGRES_PASSWORD=''
```

Run this commands:
Before running the db commands create a .env file with your postgres configuration
```
rails db:create
rails db:migrate
rails db:seed
```

After that you should be able to run the app with the command
```
rails s
```
