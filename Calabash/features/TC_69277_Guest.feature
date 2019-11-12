Feature: TC 69277 - Gift Card (Guest)

	Scenario: TC 69277 - Gift Card (Guest)
		Then my test Id is "69279"
		Then I'm on main page
		Then I validate Home Banners
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default"
		Then I enter new Shipping Address
		Then I pick first item from delivery options
		Then I add Promotions using GiftCard
		Then I Place Order