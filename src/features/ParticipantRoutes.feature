@issuer-server
Feature: Participant Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine

  Scenario Outline: Return all dids and names of know participant 
    Given A account 
    When I send GET request to /participant/dids
    Then I get response code 200 

  Scenario Outline: Returns participants with unlinked information  
    Given A account 
    When I send GET request to /participant/global
    Then I get response code 200 

  Scenario Outline: Returns participants with linked information  
    Given A account 
    When I send GET request to /participant/all/ <templateId>
    Then I get response code 200 

    Examples:
     | templateId     |
     | 90238490238490 |

  Scenario Outline: Return participant information with the request code
    Given A account 
    When I send GET request to /participant/new/ <requestCode>
    Then I get response code 200 

    Examples:
     | requestCode    |
     | 90238490238490 |

  Scenario Outline: Return participant information with linked users
    Given A account 
    When I send GET request to /participant/?did= <did>
    Then I get response code 200 

    Examples:
     | did                     |
     | ethr:did:i0di0asjdi0asjd|


  Scenario Outline: Initializate the participant data with only the did and the name
    Given A account <request>
    When I send POST request to /participant/new
    Then I get response code 200

    Examples:
      | request                                                        |
      | {"name":"Participant name", "did": "ethr:did:dasd90siad90idas"}|


  Scenario Outline: Edit participant data with request
    Given A account <request>
    When I send PUT request to /participant/213213
    Then I get response code 200

    Examples:
      | request                                                    |
      | {"name":"participant name","templateId": "1243", "data": []}|

  Scenario Outline: delete a participant
    Given A account 
    When I send DELETE request to /participant/213213
    Then I get response code 200

  Scenario Outline: Loading global participant info from a certificate request made with / template / request /: requestCode
    Given A account <request>
    When I send POST request to /participant/3129389
    Then I get response code 200

    Examples:
      | request                                   |
      | {"access_token": "9831290839018390asdjdf"} |

  Scenario Outline: Loading participant info for a particular template from the QR generated in "/ template /: id / qr /: requestCode"
    Given A account <request>
    When I send POST request to /participant/3129389/2093029
    Then I get response code 200

    Examples:
      | request                                   |
      | {"access_token": "9831290839018390asdjdf"} |



