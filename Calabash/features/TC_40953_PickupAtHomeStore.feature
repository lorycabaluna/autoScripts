Feature: TC 40953 - HOPS with Set Pickup at Home Store

  Scenario: TC 40953 - HOPS with Set Pickup at Home Store
	Then my test Id is "40954"
    Then I login
	Then I'm on main page
	Then I validate Home Banners
	Then I hold item "PreOwned" as "PickUpAtHomeStore"
	Then I see "Your hold request has been sent!"
	