Feature: TC 68707 - Edit Handling (Auth)

  Scenario:  TC 68707 - Edit Handling (Auth)
		Then my test Id is "68707"
		Then I login
		Then I'm on main page
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default"
		Then I loop through available delivery options
		Then I Place Order
		
	