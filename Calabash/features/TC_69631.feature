Feature: TC 69631 - Trade Credit (Auth)

	Scenario: TC 69631 - Trade Credit (Auth)
		Then my test Id is "69631"
		Then I login
		Then I'm on main page
		Then I clear items in cart
		Then I Purchase "PreOwned" item as "Default"
		Then I add Promotions using PowerUp Rewards
		Then I Place Order