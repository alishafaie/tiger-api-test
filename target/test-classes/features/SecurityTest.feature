@Smoke
Feature: Security Test. Token Generating Test

@security
Scenario: generate Token with valid username and password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response

#2) Test API Endpoint "/api/token" with invalid username and valid password
# Status code should be 404. - bad request and response should be TOKEN_EXPIRED
# There is a defect open for this scenario already. 
@negativeUser
Scenario: generate Token with invalid username and valid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "upervisor","password": "tek_supervisor"}
When method post
Then status 404
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "USER_NOT_FOUND"

#3) Test API Endpoint "/api/token" with Valid username and Invalid password
# Status code should be 400. - 
@negativePassword
Scenario: generate Token with valid username and Invalid password
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request {"username": "supervisor","password": "tek-supervisor"}
When method post
Then status 400
And print response
* def errorMessage = response.errorMessage
And assert errorMessage == "Password Not Matched"
