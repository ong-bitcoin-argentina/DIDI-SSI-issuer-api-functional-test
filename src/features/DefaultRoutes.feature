@issuer-server
Feature: Default Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  
  Scenario Outline: Return the default
    Given A account
    When I send GET request to /default
    Then I get response code 200

  Scenario Outline: Change the default
    Given A account <body>
    When I send PUT request to /default
    Then I get response code 200

    Examples:
        | body      |
        | {"registerId": "00001", "templateId":"912809312"}  |

  Scenario Outline: Register new default
    Given A account <body>
    When I send POST request to /default
    Then I get response code 200

    Examples:
        | body                     |
        | {"templateId": "00000"}  |
