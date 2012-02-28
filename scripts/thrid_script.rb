require 'rubygems'
require 'watir-webdriver'
require File.dirname(__FILE__) +  '/adoption_helper'
include AdoptionHelper


goto_the_puppy_store
adopt_puppy_number 1
keep_on_adopting
adopt_puppy_number 2
checkout_with 'cheezy', '123 Main street', 'cheezy@example.com', 'Credit card'
validate_page_contains "Thank you for adopting a puppy!"
close_the_browser
