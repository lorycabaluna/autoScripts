Feature: TC 69659 - Prompt Age Gate - PDP - Age 17 or older (Auth with Card/New/BuyOnline/Check Out)

  Scenario: TC 69659 - Prompt Age Gate - PDP - Age 17 or older (Auth with Card/New/BuyOnline/Check Out)
	Then my test Id is "69659"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "New" item as "BuyOnline" then "CheckOut"
	Then I pay with payment card
	Then I Place Order