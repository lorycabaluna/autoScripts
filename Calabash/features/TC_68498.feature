Feature: TC 68498 - Place Order - Physical Item (Auth with Default Info)

	Scenario: TC 68498 - Place Order - Physical Item (Auth with Default Info)
	    Then my test Id is "68498"
		Then I login
		Then I'm on main page
		Then I Purchase "PreOrder" item as "Default"
		Then I validate checkout screen	
		Then I Place Order