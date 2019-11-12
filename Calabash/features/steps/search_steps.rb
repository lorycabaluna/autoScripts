Then (/^I click on Search icon$/) do
	#sleep(5)
	#tap_when_element_exists("* id:'action_search'")
	steps %Q{
		Then I wait for "action_search" to exist if YES "Click" this "Item" and if NOT show this message "Search icon not found on screen."
	}
	#tap_when_element_exists("android.widget.TextView {contentDescription LIKE[c] 'Search'}")
end

Then (/^I enter "([^"]*)" into search text$/) do |text|
  enter_text("android.widget.EditText index:0", text)
  sleep(5)
end

Then (/^I search item with SKU "([^\"]*)"$/) do |sku|
			
	#if(query("* id:'action_search'").empty?)
	#	fail("Cannot find Search icon.")
	#else
	#	tap_when_element_exists("* id:'action_search'")
	#end
	
	#sleep(3)
	#if(query("* id:'actionlayout_search_edittext'").empty?)
	#	fail("Search bar not found.")
	#else
	#	enter_text("* id:'actionlayout_search_edittext'",sku)
	#	press_user_action_button
	#end
	#wait_for("actionlayout_search_edittext",:timeout=> 20 ,:timeout_message => "Cannot Find Search Text Bar.")
	
	#sleep(5)
	#wait_for("actionlayout_search_edittext",:timeout=> 20 ,:timeout_message => "Cannot Find Search Text Bar.")
	
	steps %Q{
		Then I wait for "action_search" to exist if YES "Click" this "Button" and if NOT show this message "Cannot Find Search icon."
		Then I wait for "actionlayout_search_edittext" to exist if YES "Type" this "#{sku}" and if NOT show this message "Cannot Find Search Text Bar."
		Then I wait for "search_result_titletextview" to exist if YES "Click" this "Item" and if NOT show this message "Search no results found or Unable to Search error."
	}
	
	firstItem = query("* id:'search_result_titletextview'")
	if(firstItem.empty?)
		fail("Search no results found or Unable to Search error.")
	else
		sleep(10)
		tap_when_element_exists("* id:'#{firstItem[0]["id"]}'")
	end
end	

Then (/^I should see search back button$/) do
	search = query("android.widget.ImageButton")
	if(search.empty?)
		fail("Back button is not displayed.")
	else
		if(search[0]["contentDescription"]=="Navigate up")
			print("Back button is displayed.")
		else
			fail("No back button.")
		end
	end
end

Then (/^I should see search cart icon$/) do
	cart = query("* id:'actionlayout_cart_imageview'")
	if(cart.empty?)
		fail("Cart icon is not displayed.")
	end
end

Then (/^I should see search icon$/) do
	sleep(5)
	cart = query("* id:'action_search'")
	if(cart.empty?)
		fail("Search icon is not displayed.")
	end
end

Then (/^I should see search number of results$/) do
	sleep(5)
	numOfResults = query("* id:'fragment_search_numresultstextview'")
	if(numOfResults.empty?)
		fail("No results found.")
	else
		print("There are #{numOfResults[0]["text"]}")
	end
end

Then (/^I should see search filter button$/) do
	filter =query("* id:'fragment_search_filtermaintoggletextview'")
	if(filter.empty?)
		fail("No filter button displayed.")
	end
end

Then (/^I click search sort by button$/) do
	sortBy = query("* id:'search_sortspinner'")
	if(sortBy.empty?)
		fail("No sort by button displayed.")
	else
		tap_when_element_exists("* id:'search_sortspinner'")
	end
end

Then (/^I sort by "(Best Sellers|Release Date|Price Ascending|Price Descending)"$/) do |sortBy|
	iSortBy =query("* marked:'#{sortBy}'")
	if(iSortBy.empty?)
		fail("Cannot sort by #{sortBy}.")
	else
		tap_when_element_exists("* marked:'#{sortBy}'")
	end
end

Then (/^I select the first item from the result$/) do
	sleep(5)
	firstItem = query("* id:'search_result_titletextview'")
	if(firstItem.empty?)
		fail("No item to be selected.")
	else
		tap_when_element_exists("* id:'#{firstItem[0]["id"]}'")
	end
	sleep(5)
end

Then (/^I select search filter$/) do
	sleep(10)
	if(query("* id:'fragment_search_filtermaintoggletextview'").empty?)
		fail("\nSearch Filter not found.\n")
	else
		tap_when_element_exists("* id:'fragment_search_filtermaintoggletextview'")
	end
end

Then (/^I click on condition category to select New and PreOwned$/) do
	sleep(3)
	tap_when_element_exists("* marked:'Condition'")
	sleep(2)
	tap_when_element_exists("* marked:'New'")
	sleep(2)
	tap_when_element_exists("* marked:'Pre-Owned'")
end

Then (/^I Filter by "(Products|Platform|Condition|Category|Availability|Price|ESRB)"$/) do |filterBy|
	
	if(filterBy == "Products")
		sleep(3)
		tap_when_element_exists("* marked:'#{filterBy}'")
	elsif (filterBy == "Platform")
		sleep(3)
		tap_when_element_exists("* marked:'#{filterBy}'")
	elsif (filterBy == "Condition")
	
		sleep(3)
		tap_when_element_exists("* marked:'Condition'")
		sleep(2)
		tap_when_element_exists("* marked:'New'")
		sleep(1)
		tap_when_element_exists("* marked:'Pre-Owned'")
	
	elsif (filterBy == "Category")
		sleep(3)
		tap_when_element_exists("* marked:'#{filterBy}'")
	elsif (filterBy == "Availability")
		sleep(3)
		tap_when_element_exists("* marked:'#{filterBy}'")
		
		sleep(2)
		tap_when_element_exists("* marked:'Pick Up At Store'")
	elsif (filterBy == "Price")
		sleep(3)
		tap_when_element_exists("* marked:'#{filterBy}'")
	elsif (filterBy == "ESRB")
		sleep(3)
		tap_when_element_exists("* marked:'#{filterBy}'")
	end
	
end

Then (/^I click done to finish filter$/) do
	sleep(3)
	tap_when_element_exists("* marked:'DONE'")
	sleep(3)
end


Then (/^I click on availability filter to select Pickup Store$/) do
	sleep(3)
	tap_when_element_exists("* marked:'Availability'")
	sleep(2)
	tap_when_element_exists("* marked:'Pick Up At Store'")
end

Then (/^I enter SKU "([^\"]*)" into search bar$/) do |sku|
	sleep(3)
	enter_text("* id:'actionlayout_search_edittext'",sku)
	press_user_action_button
end


