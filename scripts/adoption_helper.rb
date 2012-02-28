module AdoptionHelper
  def adopt_puppy_number(num)
    @browser.button(:value => 'View Details', :index => num - 1).click
    @browser.button(:value => 'Adopt Me!').click
  end

  def goto_the_puppy_store
    @browser = Watir::Browser.new :firefox
    @browser.driver.manage.timeouts.implicit_wait = 3
    @browser.goto "http://localhost:3000"
  end

  def keep_on_adopting
    @browser.button(:value => 'Adopt Another Puppy').click
  end

  def checkout_with(name, address, email, pay_type)
    @browser.button(:value => 'Complete the Adoption').click
    @browser.text_field(:id => 'order_name').set(name)
    @browser.text_field(:id => 'order_address').set(address)
    @browser.text_field(:id => 'order_email').set(email)
    @browser.select_list(:id => 'order_pay_type').select(pay_type)
    @browser.button(:value => 'Place Order').click
  end

  def validate_page_contains(expected)
    fail unless @browser.text.include? expected
    sleep 3
  end

  def close_the_browser
    @browser.close
  end
end