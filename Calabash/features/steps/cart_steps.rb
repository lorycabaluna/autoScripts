Then (/^I click on Shipping button$/) do
	tap_when_element_exists("* id:'img_shipping_info_disclosure'")
end

Then (/^I click on Payment button$/) do
	tap_when_element_exists("* id:'img_payment_info_disclosure'")
end

Then (/^I should see Cart Subtotal$/) do
	cartSubTotal = query("* id:'txt_summary_cart_subtotal'",:getText)
	if(cartSubTotal.empty?)
		fail("\nCart Sub Total is empty.\n")
	else
		print("\nCart Sub Total: #{cartSubTotal}.\n")
	end
end

Then (/^I should see Product Title$/) do
	prodTitle = query("* id:'cart_titletextview'",:getText)
	if(prodTitle.empty?)
		fail("\nProduct Title is empty.\n")
	else
		print("\nProduct Title: #{prodTitle}.\n")
	end
end

Then (/^I should see Shipping summary$/) do
	shipping = query("* id:'txt_summary_shipping'",:getText)
	if(shipping.empty?)
		fail("\nShipping summary is empty.\n")
	else
		print("\nShipping summary: #{shipping}.\n")
	end
end

Then (/^I should see Estimated Tax$/) do
	loop = 0
	
	
	estimatedTax = query("* id:'txt_summary_estimated_tax'",:getText)
	
	
	while loop < 3
		loop +=1
		estimatedTax = query("* id:'txt_summary_estimated_tax'",:getText)
		
		if(estimatedTax.empty?)
			scroll_down
		else
			break
		end
		
	end
	
	if(estimatedTax.empty?)
	    fail("\nEstimated Tax is empty.\n")
	else
		print("\nEstimated Tax: #{estimatedTax}.\n")
	end
	
end

Then (/^I should see Order Total$/) do
	estimatedTax = query("* id:'txt_summary_order_total'",:getText)
	if(estimatedTax.empty?)
		fail("\nOrder Total is empty.\n")
	else
		print("\nOrder Total: #{estimatedTax}.\n")
	end
end

Then (/^I verify items in cart$/) do
	steps %Q{
		Then I click on cart icon
	}
	
	sleep(2)
	
	cart = query("* id:'cart_header_count_textview'")
	
	if(!cart.empty?)
		print("\n#{cart[0]["text"]}\n")
	else
		fail("\nNo items in cart.\n")
	end
end

Then (/^I pickup item from cart$/) do

	storeInfo = StoreInfo.getCSVData($currentTestId)
	
	if(storeInfo.storeZip.nil?)
		fail("\nFailed: No Store Zip code provided in the Test Data.csv.\n")
	end
	
	steps %Q{
		Then I click on cart icon
		Then I scroll down
		Then I click on pickup store button
		Then I click on cart checkout button
		Then I click on store location button
		Then I enter "#{storeInfo.storeZip}" into zip code text
		Then I select "#{storeInfo.storeAddress}" from the list
		Then I click on payment button
		Then I click on payment icon
		}
		
	sleep(3)
	order1 = query("* id:'checkout_place_order_1'")
	
	if(!order1.empty?)
	    tap_when_element_exists("* id:'checkout_place_order_1'")
	end
	
end

Then (/^I checkout item from cart with payment card$/) do
	steps %Q{
		Then I click on cart icon
		Then I click on cart checkout button
		Then I pay with payment card
	}
end

Then (/^I checkout item from cart$/) do
	steps %Q{
		Then I click on cart icon
		Then I click on cart checkout button
	}
end

Then (/^I clear items in cart$/) do
	steps %Q{
		Then I click on cart icon
	}
	sleep(3)
	
	remove = query("* id:'cart_listitem_removeitemtextview'")
	loopRemove = 0
	while (remove.empty? == false) do
		loopRemove+=1
		sleep(3)
		tap_when_element_exists("* id:'cart_listitem_removeitemtextview'")
		
		sleep(2)
		alertRemove = query("* id:'alertTitle'")
		
		if(alertRemove.empty?)
			fail("\nRemove alert is not displayed.\n")
		else
			steps %Q{
				Then I see "Remove Item" text
				Then I touch the "OK" text
			}
		end
		
		sleep(3)
		remove = query("* id:'cart_listitem_removeitemtextview'")
		
		if(loopRemove >= 20)
			print("\nEnding while to avoid infinite loop in cart items remove.\n")
			break
		end
	end
	
	press_back_button
end

Then (/^I remove first item in cart then checkout$/) do
	sleep(5)
	steps %Q{
		Then I click on cart icon
	}
	sleep(5)
	remove = query("* id:'cart_listitem_removeitemtextview'")
	
	if(remove.empty?)
		fail("\nUnable to remove, no remove button on display.\n")
	else
		tap_when_element_exists("* id:'cart_listitem_removeitemtextview'")
		
		sleep(2)
		alertRemove = query("* id:'alertTitle'")
		
		if(alertRemove.empty?)
			fail("\nRemove alert is not displayed.\n")
		else
			steps %Q{
				Then I see "Remove Item" text
				Then I touch the "OK" text
				Then I touch the "CHECKOUT" text
			}
		end
	end
	
end
