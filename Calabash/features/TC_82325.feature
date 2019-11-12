Feature: TC 82325 - Forgot Username Screen

  Scenario: TC 82325 - Forgot Username Screen
		Then my test Id is "82325"
		Then I login
		Then I do Forgot Password and Forgot Email
		Then I re-login
		Then I'm on main page