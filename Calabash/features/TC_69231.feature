Feature: TC 69231 - Place Order (Auth with Credit Card and Gift Card Combination)

	Scenario: TC 69231 - Place Order (Auth with Credit Card and Gift Card Combination)
	    Then my test Id is "69231"
		Then I login
		Then I'm on main page
		Then I validate Home Banners
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default"
		Then I Add New Card Number then Save address as same shipping addrress
		Then I add Promotions using GiftCard
		Then I validate checkout screen	
		Then I Place Order