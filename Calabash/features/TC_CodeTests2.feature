Feature: Code Testing

  Scenario: Code testing
    Then I login
	Then I'm on main page
	Then I Purchase PreOwned item
	Then I search store location and Hold New or HoldPreOwned
	Then I see "Your hold request has been sent!"
	