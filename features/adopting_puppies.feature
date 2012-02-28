Feature: Adopting Puppies

  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

  Background:
    Given I am on the puppy adoption site

  Scenario Outline: Adopt a single puppy
    When I press the first View Details button
    And I press the Adopt Me button
    And I press the Complete the Adoption button
    And I enter "<name>" in the name field
    And I enter "<address>" in the address field
    And I enter "<email>" in the email field
    And I select "<pay_type>" from the pay type dropdown
    And I press the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Examples:
    | name   | address         | email                     | pay_type       |
    | Cheezy | 123 Main Street | cheezy@example.com        | Credit card    |
    | Sneezy | 555 South High  | sneezy@notfeelingwell.com | Check          |
    | Wheezy | 999 5th Ave     | wheezy@guru.com           | Purchase order |

  Scenario: Adopting two puppies
    When I press the first View Details button
    And I press the Adopt Me button
    And I press the Adopt Another Puppy button
    And I press the second View Details button
    And I press the Adopt Me button
    And I press the Complete the Adoption button
    And I enter "Cheezy" in the name field
    And I enter "123 Main" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay type dropdown
    And I press the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Validate shopping cart with one puppy
    When I press the first View Details button
    And I press the Adopt Me button
    Then I should see "Brook" for the name on line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "$34.95" as the shopping cart total

  Scenario: Validate shopping cart with two puppies
    When I press the first View Details button
    And I press the Adopt Me button
    And I press the Adopt Another Puppy button
    And I press the second View Details button
    And I press the Adopt Me button
    Then I should see "Brook" for the name on line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "Hanna" for the name on line item 2
    And I should see "$22.99" as the subtotal for line item 2
    And I should see "$57.94" as the shopping cart total

