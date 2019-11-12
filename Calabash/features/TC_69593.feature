Feature: TC 69593 - Prompt Age Gate - Checkout - Age 17 or older (Add To Cart/New/BuyOnline)

  Scenario: TC 69593 - Prompt Age Gate - Checkout - Age 17 or older (Add To Cart/New/BuyOnline)
    Then my test Id is "69593"
	Then I login
	Then I'm on main page
	Then I clear items in cart
	Then I Purchase "New" item as "BuyOnline" then "AddToCart"
	Then I checkout item from cart with payment card
	Then I Place Order
