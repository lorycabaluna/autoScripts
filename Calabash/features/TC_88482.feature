Feature: TC 88482 - Edit Billing Address - Same as Shipping Address - Domestic (Auth)

  Scenario: TC 88482 - Edit Billing Address - Same as Shipping Address - Domestic (Auth)
	Then my test Id is "88482"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "PreOwned" item as "Default"
	Then I Add New Card Number then Save address as same shipping addrress
	Then I Place Order