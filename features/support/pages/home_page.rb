class HomePage
  include PageObject

  def adopt_puppy_number(pup_number)
    button_element(:value => 'View Details', :index => pup_number - 1).click
  end
end