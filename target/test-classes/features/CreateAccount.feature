Feature: Create Account
# 1) Test API endpoint "/api/accounts/add-primary-account"(Same as we do fill the form in UI).
# Then status code should be 201-Created, with response generated account with Email address.

Background: generate token for all scenarios.
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request  {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
* def generatedToken = response.token
Scenario: Create New Account happy path
	Given path "/api/accounts/add-primary-account"
	And request {"email": "WooZoo123@gmail.com", "title": "Mr.", "firstName": "Woo", "lastName": "Zoo", "gender": "MALE", "maritalStatus": "SINGLE", "employmentStatus": "student", "dateOfBirth": "2000-01-31"}
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  Then print response
  
  
 