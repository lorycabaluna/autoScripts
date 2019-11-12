Feature: TC 40953 - HOPS (Guest) 

  Scenario: TC 40953 - HOPS (Guest) 
    Then my test Id is "40956"
	Then I'm on main page
	Then I Purchase PreOwned item
	Then I search store location and Hold New or HoldPreOwned
	Then I enter my personal details in HOPS
	Then I continue to finish HOPS
	Then I see "Your hold request has been sent!"