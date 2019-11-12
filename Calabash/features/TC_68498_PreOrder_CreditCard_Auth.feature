Feature: TC 68498 - PreOrder Credit Card (Auth)

	Scenario: TC 68498 - PreOrder Credit Card (Auth)
	    Then my test Id is "68498"
		Then I login
		Then I'm on main page
		Then I validate Home Banners
		Then I clear items in cart
		#Then I Purchase "PreOrder" item as "BuyOnline" then "CheckOut"
		Then I Purchase "PreOrder" item as "Default" 
		Then I validate checkout screen	
		Then I Place Order