Feature: TC 69213 - Add Credit Card Payment Option (Auth with Visa)

  Scenario: TC 69213 - Add Credit Card Payment Option (Auth with Visa)
		Then my test Id is "69213"
	    Then I login
		Then I'm on main page
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default"
		Then I Add New Card Number then Save address as same shipping addrress
		Then I Place Order
		
	