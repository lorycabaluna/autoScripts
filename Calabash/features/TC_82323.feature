Feature: TC 82323 - Forgot Password 

	Scenario: TC 82323 - Forgot Password 
		Then my test Id is "82323"
		Then I login
		Then I do Forgot Password to retreive email
		Then I re-login
		Then I'm on main page
		
		