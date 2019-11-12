Feature: TC 68804 - Pre-Order Pick-Up at Store (Auth)

  Scenario: TC 68804 - Pre-Order Pick-Up at Store (Auth)
	Then my test Id is "68804"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "PreOrder" item as "Default" then "AddToCart" 
	Then I check if message Are you sure you want to pre-order another copy?
	#Then I Purchase "PreOrder" item as "PickupAtStore" then "AddToCart"
	Then I pickup item from cart
	Then I should see confirmation number
	Then I should see delivery options equal to "InStorePickup"
	
	
