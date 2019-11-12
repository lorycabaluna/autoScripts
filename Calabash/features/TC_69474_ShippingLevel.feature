Feature: TC 69474 - Apply Promo Code - Shipping Level (Auth)

  Scenario: TC 69474 - Apply Promo Code - Shipping Level (Auth)
    Then my test Id is "69476"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "New" item as "Default"
	Then I set delivery option as "Day One"
	Then I add Promotions using promo code
	Then I Place Order
	
