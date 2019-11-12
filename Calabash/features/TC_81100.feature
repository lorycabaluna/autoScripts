Feature: TC 81100 - Multiple Item Transaction to Cart and remove item (Auth)

	Scenario: TC 81100 - Multiple Item Transaction to Cart and remove item (Auth)
	    Then my test Id is "81100"
		Then I login
		Then I'm on main page
		Then I validate Home Banners
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default" then "AddToCart"
		Then I Purchase "PreOrder" item as "Default" then "AddToCart"
		Then I Purchase "Download" item as "Default" then "AddToCart"
		Then I remove first item in cart then checkout
		Then I validate checkout screen	
		Then I Place Order