@issuer-server
Feature: Register Routes
  In order manage directory
  As a QA Automation
  I want to make sure CRUD operations through REST API works fine


  Scenario Outline: Create a new register from transmitter in the blockchain selected
    Given A account <request>
    When I send POST request to /register
    Then I get response code 200

    Examples:
      | request                                                                             |
      | { "did":"did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc", "name": "New register", "description": "description of new register", "key": "keyexample", "file": "./example.txt"} |


  Scenario Outline: Obtain list of register 
    Given A account
    When I send GET request to /register 
    Then I get response code 200


  Scenario Outline: Obtain list of all blockchains 
    Given A account
    When I send GET request to /register/all/blockchain
    Then I get response code 200

  Scenario Outline: Edit a register
    Given A account
    When I send PATCH request to /register/didexample 
    Then I get response code 200
  
    Examples:
      | request                                                                       |
      | {"name": "Edit Register", "file" : "./fileexample.txt", "status" : "SUCCESS"} | 
 

# Scenario Outline: try delegate of register in DIDI 
    #  Given A account <request>
    #  When I send POST request to /register/did:ethr:aoidjasiod0j9/retry
    #  Then I get response code 200

    #Examples:
    # | request                                                                             |
    # | { "did":"did:ethr:0xd56d90753777b4ab2013ad06ed3ae775f1832cbc", "name": "New register", "description": "description of new register", "key": "keyexample", "file": "./example.txt"} |



