Feature: True is stored as a negative one

  In order to allow my rails application to work with my legacy database
  As a web application developer
  I want rails to store 'true' as negative one in my MySQL TINYINT(1) columns

  Scenario: Save a record with a 'true' value
    Given an ActiveRecord 'User' model with an 'enabled' boolean field and a 'username' field
    When I create a user named 'howard' with 'enabled' set to true
    Then the 'enabled' column for 'howard' should be '-1'

  Scenario: Interpret a record with -1 as true
    Given an ActiveRecord 'User' model with an 'enabled' boolean field and a 'username' field
    When I load a user named 'eunice' who's 'enabled' column is '-1'
    Then the user model's 'enabled' field for 'eunice' should be true

