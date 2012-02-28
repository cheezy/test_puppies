require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper'
include AdoptionHelper

goto_the_puppy_store
adopt_puppy_number 1
checkout_with 'Cheezy', '555 South High', 'cheezy@example.com', 'Purchase order'
validate_page_contains 'Thank you for adopting a puppy!'
close_the_browser

