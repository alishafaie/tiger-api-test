  Feature: Edit Account
  # 2) Test API endpoint "/api/accounts/add-primary-account" to add new Account with existing email address.
  # Then status code should be 400 - Bad Request, validate response.
  Background: Generate Token for scenarios.
	Given url "https://tek-insurance-api.azurewebsites.net"
	And path "/api/token"
	And request  {"username": "supervisor","password": "tek_supervisor"}
	When method post
	Then status 200
	* def generatedToken = response.token
  
  Scenario: Add New Account with existing email
	Given path "/api/accounts/add-primary-account"
	And request {"email": "WooZoo123@gmail.com", "title": "Mr.", "firstName": "May", "lastName": "Day", "gender": "FEMALE", "maritalStatus": "MARRIED", "employmentStatus": "EMPLOYED", "dateOfBirth": "1999-09-09"}
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 400
  * def errorMessage = response.errorMessage
  And assert errorMessage == "Account with Email WooZoo123@gmail.com is exist"
  And print response
  
  
  # 3) Test API endpoint "/api/accounts/add-account-car" to add car to existing Account.
  # Then status code should be 201 - Created, validate response.
  Scenario: Add Car to existing Account
  Given path "/api/accounts/add-account-car"
  And param primaryPersonId = 17
  And request {"make": "Jeep", "model": "Wrangler", "year": "2022","licensePlate": "buuup"}
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  Then print response
  
  
  # 4) Test API endpoint "/api/accounts/add-account-phone" to add Phone number to existing Account.
  # Then status code should be 201 - Created, validate response.
  Scenario: Add phone to existing Account
  Given path "/api/accounts/add-account-phone"
  And param primaryPersonId = 17
  And request {"phoneNumber": "703-655-9999", "phoneExtension": "4545", "phoneTime": "Morning", "phoneType": "Mobile"}
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  Then print response
  
  
  # 5) Test API endpoint "/api/accounts/add-account-address" to add address to existing Account.
  # Then status code should be 201 - Created, validate response.
  Scenario: Add address to existing Account
  Given path "/api/accounts/add-account-address"
  And param primaryPersonId = 17
  And request {"id": 0, "addressType": "Home", "addressLine1": "999 Ninty Street", "city": "Nineton", "state": "Maryland", "postalCode": "20850", "countryCode": "1", "current": true}
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  Then print response
  