Feature: TC 42420 - SHOP (Search/Filter/Add to Cart Products) 

  Scenario: TC 42420 - SHOP (Search/Filter/Add to Cart Products)
    Then my test Id is "42420"
	Then I login
	Then I'm on main page
	Then I validate Home Banners
    Then I Search using Shops by "GAMES" and sort by "Best Sellers"
	Then I select search filter
	Then I Filter by "Condition" 
	Then I Filter by "Availability"
	Then I click done to finish filter
	#Then I touch the "DONE" text
	Then I Purchase "PreOwned" item as "Default" then "AddToCart"
	Then I verify items in cart
	

	