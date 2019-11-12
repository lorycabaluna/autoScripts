Then (/^I save estimate trade item "([^\"]*)" for "(GAMES|CONSOLES|ELECTRONICS|ACCESSORIES)"$/) do |itemName,tradeType|
	
	sleep(2)
	tap_when_element_exists("* {text CONTAINS[c] 'TRADE'}")
	
	sleep(2)
	tap_when_element_exists("* marked:'FIND TRADE VALUES'")
	
	#Check if Tutorial is displayed, if yes then swipe to close.
	sleep(3)
	tutorial = query("* id:'fragment_tradetutorialoverlay_contentlinearlayout'")
	
	if(!tutorial.empty?)
		tap_when_element_exists("* id:'trade_values_titletextview'")
	end
	
	#Search product given
	steps %Q{
		Then I touch the "#{tradeType}" text
	}
	
	sleep(3)
	enter_text("* id:'actionlayout_search_edittext'",itemName)
	press_user_action_button
	
	
	
	#Select the first item from the result
	sleep(3)
	firstItem = query("* id:'trade_games_result_titletextview'")
	if(firstItem.empty?)
		fail("\nNo item to be selected from search list.\n")
	else
		tap_when_element_exists("* marked:'#{firstItem[0]["text"]}'")
	end
	
	
	#Select from product list
	sleep(3)
	chooseProduct = query("* id:'trade_device_chooseyourproducttextview'")
	if(!chooseProduct.empty?)
		products = query("* id:'search_category_textview'")
		if(!products.empty?)
			tap_when_element_exists("* marked:'#{products[0]["text"]}'")
		else
			fail("\nNo item to be selected from product list.\n")
		end
	end
	
	#Check if Device Condition pop-up appears
	sleep(3)
	deviceCondition = query("* id:'fragment_deviceconditionoverlay_contentlinearlayout'")
	
	if(!deviceCondition.empty?)
		tap_when_element_exists("* id:'trade_infopriceheader_titletextview'")
	end
	##########
	
	#Save Estimate
	sleep(5)
	tap_when_element_exists("* id:'trade_detail_saveestimate'")
	
	#Validate estimate is saved
	sleep(3)
	macro %Q|I should see "Estimate Saved!"|
end	
	
Then (/^I go to Trades$/) do 
	#Select Trades
	sleep(2)
	tap_when_element_exists("* {text CONTAINS[c] 'TRADE'}")
end

Then (/^I delete Saved Trades "([^\"]*)"$/) do |savedTrade|
	titlebar =query("* id:'toolbar_title'")
	
	if(titlebar[0]["text"] != "SAVED TRADES" )
		#Select Trades
		sleep(2)
		tap_when_element_exists("* {text CONTAINS[c] 'TRADE'}")
		
		#Click on Saved Trades link
		sleep(3)
		savedTrades = query("* id:'trade_values_savedtradestextview'")
		if(savedTrades.empty?)
			fail("Saved button not found.")
		else
			tap_when_element_exists("* id:'trade_values_savedtradestextview'")
		end
	else
		print("Current Page:#{titlebar[0]["text"]}")
	end

	originalActive = query("* id:'savedtrade_listitem_headertextview'")
	
	#Edit Trades
	sleep(3)
	editTrades = query("* id:'action_edit'")
	if(editTrades.empty?)
		fail("Edit button not found.")
	else
		tap_when_element_exists("* id:'action_edit'")
	end
	
	if(savedTrade == "ALL")
		#Select all trades
		sleep(2)
		tap_when_element_exists("* marked:'SELECT ALL'")
		
	elsif (savedTrade == "FIRSTITEM")
		items = query("* id:'savedtrade_listitem_titletextview'")
		
		if (items.empty?)
			fail("No saved trades to be selected.")
		else
			tap_when_element_exists("* {text CONTAINS[c] '#{items[0]["text"]}'}")
		end
		
	else
		#Select saved trade given
		activeTitle = query("* id:'savedtrade_listitem_headertextview'")
		
		while (!activeTitle[0]["text"].include? "Active (") do
			scroll_up
			activeTitle = query("* id:'savedtrade_listitem_headertextview'")
		end
		
		items = query("* id:'savedtrade_listitem_titletextview'")
		
		if (items.empty?)
			fail("No saved trades to be selected.")
		else
			loopStart = 0
			listCount = items.count-1
			while loopStart <=  listCount 
			
				if(items[loopStart]["text"].include? "#{savedTrade}")
				 tap_when_element_exists("* {text CONTAINS[c] '#{savedTrade}'}")	
				 break
				end
				
				loopStart +=1
			end
		end
		
	end
	
	#Click on Delete button
	sleep(3)
	deleteTrades = query("* id:'savedtrades_deletetextview'")
	if(deleteTrades.empty?)
		fail("Delete button not found.")
	else
		tap_when_element_exists("* id:'savedtrades_deletetextview'")
	end
	
	#Confirm saved trades are deleted
	sleep(3)
	
	if(savedTrade == "ALL")
		macro %Q|I should see "You have no saved trades."|
		
	else
		#Active should be not equal 
		currentActive = query("* id:'savedtrade_listitem_headertextview'")
		
		if(originalActive[0]["text"] != currentActive[0]["text"])
			print("\nBefore (#{originalActive[0]["text"]})| Now (#{currentActive[0]["text"]})\n")
		else
			print("\nActive Trades count did not changed. (#{originalActive[0]["text"]} | #{currentActive[0]["text"]})\n")
		end
	end
	
end
		
Then (/^I check if tutorial is visible$/) do
	sleep(3)
	tutorial = query("* id:'fragment_tradetutorialoverlay_contentlinearlayout'")
	
	if(!tutorial.empty?)
		tap_when_element_exists("* id:'trade_values_titletextview'")
	end
end

Then (/^I enter "([^\"]*)" into game title trade search$/) do | gameTitle |
	sleep(3)
	enter_text("* id:'actionlayout_search_edittext'",gameTitle)
	press_user_action_button
end

Then (/^I select the first item from trade games result$/) do
	sleep(3)
	firstItem = query("* id:'trade_games_result_titletextview'")
	if(firstItem.empty?)
		fail("No item to be selected.")
	else
		tap_when_element_exists("* marked:'#{firstItem[0]["text"]}'")
	end
	sleep(5)
end

Then (/^I click on Saved Trades$/) do
	sleep(3)
	savedTrades = query("* id:'trade_values_savedtradestextview'")
	if(savedTrades.empty?)
		fail("Saved button not found.")
	else
		tap_when_element_exists("* id:'trade_values_savedtradestextview'")
	end
	
end

Then (/^I click on Edit Trades$/) do
	sleep(3)
	editTrades = query("* id:'action_edit'")
	if(editTrades.empty?)
		fail("Edit button not found.")
	else
		tap_when_element_exists("* id:'action_edit'")
	end
	
end

Then (/^I click on Delete Trades$/) do
	sleep(3)
	deleteTrades = query("* id:'savedtrades_deletetextview'")
	if(deleteTrades.empty?)
		fail("Delete button not found.")
	else
		tap_when_element_exists("* id:'savedtrades_deletetextview'")
	end
	
end

Then (/^I verify Trades and Cash in Saved Trades$/) do
	steps %Q{
		Then I go to Trades
		Then I click on Saved Trades
		Then I update estimate of first Expired Trade
		Then I get all Trades in Saved Trades
		Then I get all Cash in Saved Trades
	}
end

Then (/^I add all Trades in Saved Trades$/) do
	steps %Q{
		Then I go to Trades
		Then I click on Saved Trades
	}
	
   sleep(3)
   active = query("* id:'savedtrade_listitem_creditvaluetextview'")
   
   arr = Array.new
   loop = 0
   while active.count > 0 do
   
        if loop == 0 
			   firstEachItems = 0
			   accCount = active.count -1
			   while firstEachItems <= accCount do
					print("Trade Value: #{active[firstEachItems]["text"]}")
					arr.push(active[firstEachItems]["text"])
					firstEachItems+=1
			   end
		else
			if(active.count > 0)
			
			   eachItems = 1
			   accCount = active.count -1
			   while eachItems <= accCount do
					print("Trade Value: #{active[eachItems]["text"]}")
					arr.push(active[eachItems]["text"])
					eachItems+=1
			   end
			   
			end
		end
		
		scroll_down
		
		active = query("* id:'savedtrade_listitem_creditvaluetextview'")
		loop +=1
   end
   
   if(arr.count <=0)
	print("\nNo Active Trades.\n")
   else
		arrCount = arr.count
		iterate = 0
		tradeTotal = 0
		while iterate <= arrCount
			tradeTotal +=arrCount[iterate]
			iterate+=1
		end
		
	print("Trade Total:#{tradeTotal}")
   end
end

Then (/^I get all Trades in Saved Trades$/) do
   sleep(3)
   active = query("* id:'savedtrade_listitem_creditvaluetextview'")
	
   if(active.empty?)
		print("\nNo Active Trade to be selected.\n")
   else
		activeCount = active.count-1
		totalValue =0
		while activeCount >= 0 do
			
			creditValue = active[activeCount]["text"].gsub! "$",""
			creditValue = creditValue.to_f
			
			print("\nCredit Value:#{creditValue}\n")
			
			totalValue += creditValue
			
			activeCount -= 1
			
		end
		
		print("\nTotal:#{totalValue}\n")
		
		#Compare Trade total###########################
		#Get Trade Total
		currentTotal = query("* id:'savedtrades_credittotalvalue'")
		currentTotal = currentTotal[0]["text"].gsub! "$",""
		currentTotal = currentTotal.to_f
		print("\nCompare Current Active Total Trade Value:#{currentTotal} should be equal to #{totalValue} which is the sum of all active trade in list.\n")
		
		if(totalValue != currentTotal)
			fail("\nActive Trades total is not equal to the sum of active trades list.\n")
		end
		###############################################
		
   end
end

Then (/^I get all Cash in Saved Trades$/) do
   sleep(3)
   cash = query("* id:'savedtrade_listitem_cashvaluetextview'")
	
   if(cash.empty?)
		print("\nNo Cash Trade to be selected.\n")
   else
		cashCount = cash.count-1
		totalCashValue =0
		
		while cashCount >= 0 do
			
			cashValue = cash[cashCount]["text"].gsub! "$",""
			cashValue = cashValue.to_f
			
			print("\nCash Value:#{cashValue}\n")
			
			totalCashValue += cashValue
			
			cashCount -= 1
			
		end
		
		print("\nTotal:#{totalCashValue}\n")
		
		#Compare Trade total###########################
		#Get Trade Total
		currentTotalCash = query("* id:'savedtrades_cashtotalvalue'")
		currentTotalCash = currentTotalCash[0]["text"].gsub! "$",""
		currentTotalCash = currentTotalCash.to_f
		
		print("\nCompare Current Active Total Cash Value:#{currentTotalCash} should be equal to #{totalCashValue} which is the sum of all active cash in list.\n")
		
		if(totalCashValue != currentTotalCash)
			fail("\nActive Cash total is not equal to the sum of active cash list.\n")
		end
		###############################################
		
   end
end

Then (/^I update estimate of first Expired Trade$/) do
	sleep(3)
	scroll_down
	
	expired = query("* id:'savedtrade_listitem_updateestimatetextview'")
	
	if(expired.empty?)
		print("\nNo Expired Trade to be updated.\n")
    else
		tap_when_element_exists("* id:'savedtrade_listitem_updateestimatetextview'")
    end
end

