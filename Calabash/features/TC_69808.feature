Feature: TC 69808 - Apply Promo Code - 10 OFF GUIDE (Auth)

  Scenario: TC 69808 - Apply Promo Code - 10 OFF GUIDE (Auth)
    Then my test Id is "69808"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "PreOwned" item as "Default"
	Then I check Promotions screen
	Then I go back
	Then I verify promotion value in Checkout screen
	Then I place order and see save
	
