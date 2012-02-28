Given /^I am on the puppy adoption site$/ do
  @browser.goto "http://localhost:3000"
end

When /^I press the first View Details button$/ do
  @browser.button(:value => 'View Details', :index => 0).click
end

When /^I press the second View Details button$/ do
  @browser.button(:value => 'View Details', :index => 1).click
end

When /^I press the Adopt Me button$/ do
  @browser.button(:value => 'Adopt Me!').click
end

When /^I press the Adopt Another Puppy button$/ do
  @browser.button(:value => 'Adopt Another Puppy').click
end

When /^I press the Complete the Adoption button$/ do
  @browser.button(:value => 'Complete the Adoption').click
end

When /^I enter "(.+)" in the name field$/ do |name|
  @browser.text_field(:id => 'order_name').set(name)
end

When /^I enter "([^\"]*)" in the address field$/ do |address|
  @browser.text_field(:id => 'order_address').set(address)
end

When /^I enter "([^\"]*)" in the email field$/ do |email|
  @browser.text_field(:id => 'order_email').set(email)
end

When /^I select "([^\"]*)" from the pay type dropdown$/ do |pay_type|
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
end

When /^I press the Place Order button$/ do
  @browser.button(:value => 'Place Order').click
end

Then /^I should see "([^\"]*)"$/ do |expected|
  @browser.text.should include expected
end

Then /^I should see "([^\"]*)" for the name on line item (\d+)$/ do |name, line_item|
  row = (line_item.to_i - 1) * 6
  @browser.table(:index => 0)[row][1].text.should include name
end

When /^I should see "(.+)" as the subtotal for line item (\d+)$/ do |subtotal, line_item|
  row = (line_item.to_i - 1) * 6
  @browser.table(:index => 0)[row][3].text.should == subtotal
end

When /^I should see "([^\"]*)" as the shopping cart total$/ do |total|
  @browser.td(:class => 'total_cell').text.should == total
end

