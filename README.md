# Bike Share

Bike Share is a Ruby on Rails application that presents a sample of [real-world trip data](https://www.kaggle.com/benhamner/sf-bay-area-bike-share) from the San Francisco bike share system organized by stations, trips and weather conditions. Using this application, you can see analytics about popular stations, how weather correlates with trips, and even mock-purchase bike accessories.

See it for yourself at [serene-taiga-63780.herokuapp.com](serene-taiga-63780.herokuapp.com)

## Setup

Once you've forked or cloned this repository to your computer, run `bundle install` to get the proper dependencies installed.

Then, create your database:

`rails db:create`

`rails db:setup`

Now you should be able to visit localhost:3000 in your browser and see the homepage. It should look like this:

## Running the tests

Use `rspec` to run all tests.

## Versions

* Ruby version 2.4.1
* Rails version 5.6.1
* Rspec version 3.7.1
