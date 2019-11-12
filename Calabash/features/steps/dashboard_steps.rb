Then (/^I set my Home Store$/) do

	shippingInfo = ShippingInformation.getCSVData($currentTestId)
	
	if(shippingInfo.testId.nil?)
		fail("No shipping information found in csv using testid='#{$currentTestId}'")
	end
	
	steps %Q{
		Then I press ellipsis button
		Then I swipe "left"
		Then I click Home Store
		Then I enter "#{shippingInfo.zipCode}" into zip code address bar text
		Then I select the first item from store list result
		Then I set Home Store for the selected location
	}
end
		
Then (/^I should see Set Console icon$/) do
	setConsole =query("* id:'dashboard_top_console_textview'",:getText).first
	if (setConsole.to_s.strip.length == 0)
		fail("Set Console icon not found on screen")
	else
		print("\nSet Console icon found in screen.\n")
	end
	sleep(3)
end

Then (/^I should see Set Home Store icon$/) do
	setHome = query("* id:'dashboard_top_store_imageview'",:getText).first
	if (setHome.to_s.strip.length == 0)
		fail("Set Home Store icon not found on screen")
	else
		print("\nSet Home Store icon found in screen.\n")
	end
	sleep(3)
end

Then (/^I should see Check In icon$/) do
	checkIn =query("* id:'dashboard_top_checkin_imageview'",:getText).first
	if (checkIn.to_s.strip.length == 0)
		fail("Check In icon not found on screen")
	else
		print("\nCheck In icon found in screen.\n")
	end
	sleep(3)
end

Then (/^I should see Messages icon$/) do
	messages = query("* id:'dashboard_top_message_imageview'",:getText).first
	if (messages.to_s.strip.length == 0)
		fail("Messages icon not found on screen")
	else
		print("\nMessages icon found in screen.\n")
	end
	sleep(3)
end

Then (/^Trade Credit Balance is$/) do
   sleep(1)
   tradeCredit = query("* id:'dashboard_top_tradecredit_textview'",:getText).first
   tradeCredit = tradeCredit.to_i
   print("\nTrade Credit Balance is: $ #{tradeCredit}\n")
end

Then (/^Pre Order is$/) do
   sleep(1)
   preOrder = query("* id:'drawer_bottomview_preordersnotificationcount'",:getText).first
   preOrder = preOrder.to_i
   print("\nPre Order count is: #{preOrder}\n")
end

Then (/^Saved Trades is$/) do
   sleep(1)
   savedTrades = query("* id:'drawer_bottomview_savedtradesnotificationcount'",:getText).first
   savedTrades = savedTrades.to_i
   if (savedTrades > 0)
   print("\nSaved Trades count is: #{savedTrades}\n")
   else
   savedTrades = query("* id:'drawer_bottomview_nonpur_savedtradesnotificationcount'",:getText).first
   savedTrades = savedTrades.to_i
   print("\nSaved Trades count is: #{savedTrades}\n")
   end
end

Then (/^I should see Active Offers$/) do
	activeOffers = query("* id:'drawer_bottomview_offerstextview'",:getText).first
	if (activeOffers.to_s.strip.length == 0)
		fail("Active Offers not found on screen")
	else
		print("\nActive Offers found on screen.\n")
	end
	
end

Then (/^I should see My Library$/) do
	activeOffers = query("* id:'drawer_bottomview_gamelibrarytextview'",:getText).first
	if (activeOffers.to_s.strip.length == 0)
		fail("My Library not found on screen")
	else
		print("\nMy Library found on screen.\n")
	end
	
end

Then (/^I scroll down to see more$/) do
	scroll_down
end

Then (/^I should see Digital Locker$/) do
	digitalLocker = query("* id:'drawer_bottomview_digitallockertextview'",:getText).first
	if (digitalLocker.to_s.strip.length == 0)
		fail("Digital Locker not found on screen")
	else
		print("\nDigital Locker found on screen.\n")
	end
	
end

Then (/^I should see Settings$/) do
	settings = query("* text:'SETTINGS'",:getText).first
	if (settings.to_s.strip.length == 0)
		fail("\nSettings not found on screen.\n")
	else
		print("\nSettings found in screen.\n")
	end
	
end

Then (/^I should see About$/) do
	about = query("* {text CONTAINS[c] 'ABOUT'}",:getText).first
	if (about.to_s.strip.length == 0)
		fail("\nAbout not found on screen.\n")
	else
		print("\nAbout found in screen.\n")
	end
	
end

Then (/^I should see Sign Out$/) do
	signout = query("* {text CONTAINS[c] 'SIGN OUT'}",:getText).first
	if (signout.to_s.strip.length == 0)
		fail("Sign Out not found on screen")
	else
		print("\nSign Out found in screen.\n")
	end
	
end

Then (/^I go back to dashboard$/) do
	print("\nGoing Back to Dashboard...\n")
	sleep(3)
	steps %Q{
		Then I go to previous page
	}
	
	print("\nClicking Menu icon\n")
	sleep(3)
	steps %Q{
		Then I press ellipsis button
	}
	print("\nDone Clicking Menu icon\n")
	
	print("\nChecking if tutorial message is displayed.\n")
	steps %Q{
		Then I validate if tutorial device pop-up is visible
	}
	print("\nDone Checking if tutorial message is displayed.\n")
end

Then (/^I verify all items in Dashboard$/) do
	steps %Q{
		Then I verify Dashboard
		Then I verify PowerUp Rewards
		Then I go back to dashboard
		Then I verify PreOrders
		Then I go back to dashboard
		Then I verify Saved Trades
		Then I go back to dashboard
		Then I verify Active Offers
		Then I go back to dashboard
		Then I verify Game Informer News
		Then I go back to dashboard
		Then I verify My Library
		Then I go back to dashboard
		Then I verify Digital Locker
		Then I go back to dashboard
		Then I verify Dashboard Settings
		Then I go back to dashboard
		Then I verify Dashboard About Feedback
		Then I go back to dashboard
	}
end

Then (/^I verify Dashboard as "(PUR|NonPUR|Guest)"$/) do |purType|
	print("\nVerifying Dashboard as #{purType}...\n")
	if(purType == "PUR")

	steps %Q{
		Then I verify Dashboard
		Then I verify PowerUp Rewards as "PUR"
		Then I go back to dashboard
		Then I verify PreOrders
		Then I go back to dashboard
		Then I verify Saved Trades as "PUR"
		Then I go back to dashboard
		Then I verify Active Offers
		Then I go back to dashboard
		Then I verify Game Informer News as "PUR"
		Then I go back to dashboard
		Then I verify My Library
		Then I go back to dashboard
		Then I verify Digital Locker
		Then I go back to dashboard
		Then I verify Dashboard Settings
		Then I go back to dashboard
		Then I verify Dashboard About Feedback
		Then I go back to dashboard
	}
	elsif (purType == "NonPUR")
		steps %Q{
		Then I press ellipsis button
		Then I validate if tutorial device pop-up is visible
		Then I should see Set Console icon
		Then I should see Set Home Store icon
		Then I should see Messages icon
		Then Trade Credit Balance is
		Then Pre Order is
		Then Saved Trades is
		Then I should see Settings
		Then I should see About
		Then I should see Sign Out
		Then I verify PowerUp Rewards as "NonPUR"
		Then I go back to dashboard
		Then I verify Saved Trades as "NonPUR"
		Then I go back to dashboard
		Then I verify Game Informer News as "NonPUR"
		Then I go back to dashboard
		Then I verify Dashboard Settings
		Then I go back to dashboard
		Then I verify Dashboard About Feedback
		Then I go back to dashboard
		
	}
	elsif (purType == "Guest")
		steps %Q{
		Then I press ellipsis button
		Then I see "SIGN IN" text
		Then I see "POWERUP REWARDS" text
		Then I see "GAME INFORMER NEWS" text
		Then I see "MESSAGES" text
		Then I see "SETTINGS" text
		Then I see "ABOUT/FEEDBACK" text
	}
	end
end

Then (/^I verify Dashboard$/) do
	steps %Q{
		Then I press ellipsis button
		Then I validate if tutorial device pop-up is visible
		Then I should see Set Console icon
		Then I should see Set Home Store icon
		Then I should see Check In icon
		Then I should see Messages icon
		Then Trade Credit Balance is
		Then Pre Order is
		Then Saved Trades is
		Then I should see Active Offers
		Then I should see My Library
		Then I scroll down to see more
		Then I should see Digital Locker
		Then I should see Settings
		Then I should see About
		Then I should see Sign Out
	}
end

Then (/^I verify Dashboard as Guest$/) do
	steps %Q{
		Then I press ellipsis button
		Then I validate if tutorial device pop-up is visible
		Then I see "SIGN IN" text
		Then I see "POWERUP REWARDS" text
		Then I see "GAME INFORMER NEWS" text
		Then I see "MESSAGES" text
		Then I see "SETTINGS" text
		Then I see "ABOUT/FEEDBACK" text
	}
end



