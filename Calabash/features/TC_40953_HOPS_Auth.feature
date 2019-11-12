Feature: TC 40953 - HOPS (Auth)

  Scenario: TC 40953 - HOPS (Auth)
	Then my test Id is "40953"
    Then I login
	Then I'm on main page
	Then I validate Home Banners
	Then I Purchase PreOwned item
	Then I search store location and Hold New or HoldPreOwned
	Then I continue to finish HOPS
	Then I see "Your hold request has been sent!"
	