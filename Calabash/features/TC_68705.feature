Feature: TC 68705 - Edit Billing Address - Existing Address - Domestic (Auth)

  Scenario: TC 68705 - Edit Billing Address - Existing Address - Domestic (Auth)
	Then my test Id is "68705"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "PreOwned" item as "Default"
	Then I Add New Card Number and loop through addresses
	Then I Place Order