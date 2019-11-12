Feature: Native Smoke Tests - TC HOPS

  Scenario: HOPS Complete new HOPS for Game
	    Then I Sign in with user "bf_gsdc210@qagsecomprod.oib.com" and password "T3sting1"
		Then I search item with SKU "101344"
		Then I click on Buy New button
		Then I click on Im 17 or older button
		Then I select Pickup at store
		Then I enter "76092" into zip code address bar text
		Then I look for item with Hold New or Hold PreOwned
		Then I touch the "CONTINUE" text
		Then I touch the "FINISH" text
		Then I see "Your hold request has been sent!"
		
	