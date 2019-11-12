Feature: TC 66624 - Add Shipping Address - Domestic (Auth)

  Scenario: TC 66624 - Add Shipping Address - Domestic (Auth)
	Then my test Id is "66624"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "PreOwned" item as "Default"
	Then I enter new Shipping Address
	Then I Place Order