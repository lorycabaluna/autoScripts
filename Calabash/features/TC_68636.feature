Feature: TC 68636 - Add PayPal Payment Option - Physical Item (Auth)

	Scenario: TC 68636 - Add PayPal Payment Option - Physical Item (Auth)
	    Then my test Id is "68636"
		Then I login
		Then I'm on main page
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default"
		Then I enter new Shipping Address
		Then I pick first item from delivery options
		Then I set payment as Paypal