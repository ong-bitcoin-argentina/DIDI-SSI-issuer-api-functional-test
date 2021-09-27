@issuer-server
Feature: Profile Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Register new profile
    Given A account <body>
    When I send GET request to /profile 
    Then I get response code 200

    Examples:
      | body                                  |
      |{"name": "Gaston Genaud", "types": "" }| 

  Scenario Outline:  
    Given A account <request>
    When I send POST request to /profile/ <id>
    Then I get response code 200

    Examples:
      | request                  |  id  |
      | { "jwts": "75f1832cbc" } |09391 |

 Scenario Outline:
    Given A account
    When I send DELETE request to /profile/ <id>
    Then I get response code 200

    Examples: 
      |  id  |
      |123890|
