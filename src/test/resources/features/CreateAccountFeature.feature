Feature: Create account with Data Generator

# We are going to re-use a generated token feature.
Background: Prepare for test. generate token.
	Given url "https://tek-insurance-api.azurewebsites.net"
	* def result = callonce read('GenerateToken.feature')
	* def generatedToken = result.response.token
	And header Authorization = "Bearer " + generatedToken

@createAccountDataGenerator
Scenario: Create New Account using Data Generator;
	* def generator = Java.type('tiger.api.test.data.DataGenerator')
	* def email = generator.getEmail()
	* def firstName = generator.getFirstName()
	* def lastName = generator.getLastName()
	* def dob = generator.getDob()
	Given path "/api/accounts/add-primary-account"
	And request 
	"""
	{
	"email": "#(email)", 
	"title": "Mr.", 
	"firstName": "#(firstName)", 
	"lastName": "#(lastName)", 
	"gender": "FEMALE", 
	"maritalStatus": "MARRIED", 
	"employmentStatus": "EMPLOYED", 
	"dateOfBirth": "#(dob)"}
	"""
	
  And header Authorization = "Bearer " + generatedToken
  When method post
  Then status 201
  * def generatedId = response.id
  And print generatedId
  And print response
  Then assert response.email == email
  
  