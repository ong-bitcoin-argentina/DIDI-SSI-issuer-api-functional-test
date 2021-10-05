@issuer-server
Feature: Template Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Get the list of templates with the information of the certificates models generate of the issuer 
    Given A account
    When I send GET request to /template/all
    Then I get response code 200


  Scenario Outline: Return a model of certificate from id
    Given A account
    When I send GET request to /template/ <id>
    Then I get response code 200

    Examples:
      | id |
      | 10 |

  Scenario Outline: Generates a new certificate model without content
    Given A token <request>
    When I send POST request to /template
    Then I get response code 200

    Examples:
      | request                                                              |
      | { "name": "Template from automation", "registerId": "812903812908" } |

  Scenario Outline: Edit a certificate model with the body 
    Given A account <request>
    When I send PUT request to /template/312938
    Then I get response code 200 

    Examples:
      | request                                                                               |
      |{"data": "data", "preview": "Preview example", "category": "RSK", "type": "type example", "registerId": "8219039"}| 

   Scenario Outline: Delete a certificate model
    Given A account <body>
    When I send DELETE request to /template/901238129
    Then I get response code 200

    Examples:
      |body                                                              |
      |{"name": "Template from automation", "registerId": "812903812908"}|

  Scenario Outline: Emit a request for information from a global participant from a certificate request
    Given A account <request>
    When I send POST request to /template/request/2130321908
    Then I get response code 200

    Examples:
      | request                                                              |
      | { "name": "Template from automation", "registerId": "812903812908" } |


