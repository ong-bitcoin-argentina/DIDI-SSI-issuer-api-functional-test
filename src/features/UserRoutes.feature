@issuer-server
Feature: User Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Create a new user for issuer
    Given A account <body>
    When I send POST request to /user 
    Then I get response code 200

    Examples:

        |                     body              |
        | {"name": "Gaston Genaud", "password": "QAAutomation", "did": "ethr:did:84902384293084902", "profileId": "hj1h312jk3h21j3"} |

  Scenario Outline: Create a Admin user for the issuer 
    Given A account <body>
    When I send POST request to /user/admin 
    Then I get response code 200

    Examples:

        |                     body                              |
        | {"name": "Gaston Genaud", "password": "QAAutomation"} |


  Scenario Outline: Validate the passord is from the user - login 
    Given A account <body>
    When I send POST request to /user/login
    Then I get response code 200

    Examples:

        |                     body                              |
        | {"name": "Gaston Genaud", "password": "QAAutomation"} |


  Scenario Outline: Delete a user 
    Given A account 
    When I send DELETE request to /user/ <id>
    Then I get response code 200

    Examples:

        |   id   |
        | sd8ad7 |


  Scenario Outline: get the list of all users 
    Given A account 
    When I send GET request to /user/all
    Then I get response code 200


  Scenario Outline: Edit User
    Given A account <body>
    When I send PUT request to /user/ <id>
    Then I get response code 200

    Examples:

        |   id   |   body                                              |
        | sd8ad7 |{"name": "Gaston Genaud", "password": "QAAutomation"}|


