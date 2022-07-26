@regression
Feature: Create an account and add address to the account.

# Step 1)	Get a Token
# Step 2) Generate an Account
# Step 3) add address to generated Account

Background: Create new Account.
Given url "https://tek-insurance-api.azurewebsites.net"
* def CreateAccountResult = callonce read('CreateAccountFeature.feature')
And print CreateAccountResult
* def primaryPersonId = CreateAccountResult.response.id
* def token = CreateAccountResult.result.response.token

@addAddress
Scenario: Add address to an Account
Given path '/api/accounts/add-account-address'
Given param primaryPersonId = primaryPersonId
Given header Authorization = "Bearer " + token
Given request
	"""
{
  "addressType": "Home",
  "addressLine1": "1234 West Elm Street",
  "city": "Rockville",
  "state": "Maryland",
  "postalCode": "20850",
  "current": true
}
	"""
	When method post
	Then status 201
	And print response
	
	
	
	