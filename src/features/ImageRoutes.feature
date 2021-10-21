@issuer-server
Feature: Image Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Save an image in the database and return its id.
    Given A account <request>
    When I send POST request to /image
    Then I get response code 200

    Examples:
      | request                |
      | { "file": "40762726" } |


  Scenario Outline: Returns an image given an id.
    Given A account
    When I send GET request to /image/ <id>
    Then I get response code 200

    Examples:
      |                         id                   |
      |  0xd56d90753777b4ab2013ad06ed3ae775f1832cbc  |

  Scenario Outline: Delete an image given an id.
    Given A account
    When I send DELETE request to /image/312312312.jpg
    Then I get response code 200
