Feature: TC 68498 - Physical Item (New)

	Scenario: TC 68498 - Physical Item (New)
	    Then my test Id is "68499"
		Then I login
		Then I'm on main page
		Then I validate Home Banners
		Then I clear items in cart
		Then I Purchase "New" item as "Default"
		Then I validate checkout screen	
		Then I Place Order