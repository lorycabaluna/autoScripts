Feature: TC 69474 - Apply Promo Code - Combo (Auth)

  Scenario: TC 69474 - Apply Promo Code - Combo (Auth)
    Then my test Id is "69477"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "New" item as "Default" then "AddToCart"
	Then I Purchase "PreOwned" item as "Default" then "AddToCart"
	Then I Purchase "PreOrder" item as "BuyOnline" then "AddToCart"
	Then I checkout item from cart
	Then I add Promotions using promo code "PromoCode1"
	Then I add Promotions using promo code "PromoCode2"
	Then I check promo saving in checkout screen
	Then I place order and see save
	
