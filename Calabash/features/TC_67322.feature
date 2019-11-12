Feature: TC 67322 - Pre-Select Handling Options for Shipping - Product with single shipment type (Auth)

  Scenario:  Pre-Select Handling Options for Shipping - Product with single shipment type (Auth)
		Then my test Id is "67322"
		Then I login
		Then I'm on main page
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default"
		Then I loop through available delivery options 
		Then I pick first item from delivery options
		Then I Place Order
		
	