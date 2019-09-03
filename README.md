# Mini Shop

Mini Shop is an e-commerce site that allows for organizations/companies (Merchants) to create a profile and add the products (Items) that they offer so they are available for sale.
![Mini Shop](app/assets/images/mini_shop.png)

## How to install it

1. Make sure you have [Ruby v. 2.5.5](https://www.ruby-lang.org/en/documentation/installation/) and [Rails v. 5.1.7](http://installrails.com/) installed. 

2. [Clone](https://help.github.com/en/articles/cloning-a-repository) this repo.
3. Once you have your local clone; navigate into the project, bundle your gems and create, migrate, and seed your database:
```
cd mini_shop
bundle install
rails db:create
rails db:migrate
rails db:seed
```
4. Run `rspec` in your terminal to ensure all tests are passing.

5. Run your server in your local environment (your computer). Enter in your terminal `rails s` and then visit `localhost:3000`.

6. To see the production site on Heroku, visit: https://immense-oasis-67806.herokuapp.com/

## Features

### Merchant
* Merchant Index page - List of all merchants in the system.
* Merchant Show page - Details of a specific merchant.
* Merchant Creation - Fill out a form to create a new merchant.
* Merchant Update - Fill out a form to update any attribute of a merchant.
* Merchant Delete - Delete a specific merchant.
* Merchant Items page - Shows all items that belong to a merchant. With the ability to filter by item status (active/ inactive).

Relationship: A Merchant has many Items.
| Attributes | Description | Requirement |
| ----- | ----- |-----|
| Name | Company name (string) | Required |
| Address | Address where they operate (string) | Required |
| City | City where they operate (string) | Required |
| State | State where they operate (string) | Required |
| Zip | Zipcode where they are located (string) | Required |

### Items
* Items Index page - List of all items in the system (shows 16 per page).
* Items Show page - Details of a specific item.
* Items Creation - Fill out a form to create a new item.
* Items Update - Fill out a form to update any attribute of an item.
* Items Delete - Delete a specific item.

Relationship: An Item belongs to a Merchant.
| Attributes | Description | Requirement |
| ----- | ----- |-----|
| Name | Product name (string) | Required |
| Description | Product description (text) | Optional |
| Image | Image Path (string) | Required |
| Price | Price (decimal) | Required |
| Inventory | Inventory available (integer) | Required |
| Status | Active/ Inactive (enum - integer) | Optional (Active by default) |


## Built With
* Rails 5.1.7
* Ruby 2.5.5
* PostgreSQL
* HTML/CSS

## Testing
All test are done with RSpec with a 100% code coverage (calculated with [SimpleCov](https://github.com/colszowka/simplecov))

To run all tests, enter in your terminal:
```
$ cd mini_shop
$ rspec
```

To run a single test:
```
$ cd mini_shop
$ rspec spec/models/item_spec.rb #(e.g.)
```

To see the test coverage, enter in your terminal:
```
$ rspec
$ open coverage/index.html
```