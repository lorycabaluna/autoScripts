Feature: TC 69277 - Gift Card (Auth with Single Gift Card)

	Scenario: TC 69277 Gift Card (Auth with Single Gift Card)
		Then my test Id is "69277"
		Then I login
		Then I'm on main page
		Then I Purchase "PreOwned" item as "Default"
		Then I verify new shipping address
		Then I pick first item from delivery options
		Then I add Promotions using GiftCard
		Then I navigate back
		Then I Place Order