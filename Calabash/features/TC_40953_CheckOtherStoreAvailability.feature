Feature: TC 40953 - Check Other Store Availability

  Scenario: TC 40953 - CheckOtherStoreAvailability
	Then my test Id is "40955"
    Then I login
	Then I'm on main page
	Then I validate Home Banners
	Then I hold item "PreOwned" as "CheckOtherStoreAvailability"
	Then I see "Your hold request has been sent!"
	