Feature: Native Smoke Tests - TC 40953 (Authenticated)

  Scenario: HOPS Complete new HOPS for Game (Authenticated)
	Then I wait for "HOME" in main screen
	Then I swipe left
    Then I press ellipsis button
	Then I touch the "SIGN IN" text 
	Then I enter "bf_gsdc211@qagsecomprod.oib.com" into email field
	Then I enter "T3sting1" into password field
	Then I click on SIGN IN button
	Then I wait for "HOME" to appear
    Then I click on Shop icon
	Then I see "GAMES" text
	Then I see "Our library of current and upcoming games" text
	Then I see "CONSOLES" text
	Then I see "Explore our full selection of gaming consoles" text
	Then I see "ELECTRONICS" text
	Then I see "Browse our huge collection of top electronics" text
	Then I see "ACCESSORIES" text
	Then I see "An assortment of must-have accessories" text
	Then I touch the "GAMES" text
	Then I should see search back button
	Then I see "SEARCH"
	Then I should see search cart icon
	Then I should see search icon
	Then I should see search number of results 
	Then I should see search filter button
	Then I see "Sort by" text
	Then I click search sort by button
	Then I see "Best Sellers" text
	Then I see "Release Date" text
	Then I see "Price Ascending" text
	Then I see "Price Descending" text
	Then I sort by Best Sellers
	Then I select the first item from the result
	Then I should see search back button
	Then I should see search cart icon
	Then I should see search icon
	Then I should see cover art
	Then I should see game title
	Then I should see platform
	Then I should see release date
	Then I should see user rating
	Then I see "CHECK STORE AVAILABILITY" text
	Then I should see NEW,DOWNLOAD or PREOWNED
	Then I see "DETAILS" text
	Then I see "VIDEOS" text
	Then I scroll down to see more
	Then I should see item details view
	Then I should see item esrb rating
	Then I scroll down to see more
	Then I should see item publisher
	Then I should see item developer
	Then I scroll up
	Then I go back
	Then I click on Search icon
	Then I enter SKU "101344" into search bar
	Then I select the first item from the result
	Then I click on Buy New button
	Then I click on Im 17 or older button
	Then I select Pickup at store
	Then I enter "76092" into zip code address bar text
	Then I look for item with Hold New or Hold PreOwned
	Then I touch the "CONTINUE" text
	Then I touch the "FINISH" text
	Then I see "Your hold request has been sent!"