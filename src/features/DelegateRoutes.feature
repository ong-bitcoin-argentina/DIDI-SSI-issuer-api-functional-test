@issuer-server
Feature: Delegate Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  
  Scenario Outline: Returns all the dids to which the issuer has delegated its permission to issue certificates.
    Given A account
    When I send GET request to /delegate/all
    Then I get response code 200

  Scenario Outline: It revokes the authorization received to issue certificates.
    Given A request <body>
    When I send DELETE request to /delegate
    Then I get response code 200

    Examples:
        |           body                            |
        | {"did": "did:ethr:082103uj03ujm32193m2"}  |

  Scenario Outline: Authorizes the received did to issue certificates.
    Given A request <body>
    When I send POST request to /delegate
    Then I get response code 200 

    Examples:
        | body                                                                          |
        | {"name": "00000", "did": "did:ethr:082103uj03ujm32193m2", "registerId": ""}   |

  Scenario Outline: Change the name that will be displayed in all the certificates issued by this issuer or its delegates.
    Given A request <body>
    When I send POST request to /delegate/didDelegationValid
    Then I get response code 200

    Examples:
        |                     body                                                      |
        | {"didDelegate": "did:ethr:082103uj03ujm32193m2", "registerId": "of897sd89f"}  |