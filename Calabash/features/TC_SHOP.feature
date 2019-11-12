@smoketests
Feature: Native Smoke Tests - SHOP (Search/Filter/Add to Cart Products)

  Scenario: SHOP (Search/Filter/Add to Cart Products)
	Then I wait for "HOME" in main screen
	Then I swipe left
    Then I click on Shop icon
	Then I touch the "GAMES" text
	Then I see "Sort by" text
	Then I click search sort by button
	Then I sort by Best Sellers
	Then I select the first item from the result
	Then I go back
	Then I select search filter
	Then I click on condition category to select New and PreOwned
	Then I click on availability filter to select Pickup Store
	Then I touch the "DONE" text
	Then I click on Search icon
	Then I enter SKU "952002" into search bar
	Then I select the first item from the result
	Then I click on Buy PreOwned button
	Then I click on add to cart button
	Then I click on cart icon
	Then I should see text containing "item in cart" 
	