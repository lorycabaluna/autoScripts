Feature: TC 69474 - Apply Promo Code - Item Level (Auth)

  Scenario: TC 69474 - Apply Promo Code - Item Level (Auth)
    Then my test Id is "69475"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "New" item as "Default"
	Then I add Promotions using promo code
	Then I place order and see save
	
