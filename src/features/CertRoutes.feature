@issuer-server
Feature: Cert Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Get confidential information about the user according to his did.
    Given A account
    When I send GET request to /cert/all
    Then I get response code 200

  Scenario Outline: Obtains confidential information about the user according to their phone number.
    Given A account 
    When I send GET request to /cert/find?did=<did>
    Then I get response code 200


  Scenario Outline: Get confidential information about the user according to his did.
    Given A account
    When I send GET request to /cert?id= <id>
    Then I get response code 200

    Examples:
      |      id        |
      |  775f1832cbc   |

      
  Scenario Outline: Obtains confidential information about the user according to their phone number.
    Given A account <request>
    When I send POST request to /cert?id= <id>
    Then I get response code 200

    Examples:
      | request                 |  id         |
      | { "phone": "40762726" } |  3902930    |

  Scenario Outline: Obtains confidential information about the user according to their phone number.
    Given A account <request>
    When I send POST request to /cert/
    Then I get response code 200

    Examples:
      | request                 |
      | { "phone": "40762726" } |

  Scenario Outline: Get confidential information about the user according to his did.
    Given A account
    When I send GET request to /cert/0312903/emmit
    Then I get response code 200


    Scenario Outline: Obtains confidential information about the user according to their phone number.
    Given A account <request>
    When I send POST request to /cert/updateAllDeleted
    Then I get response code 200

    Examples:
      | request                 |
      | { "phone": "40762726" } |
