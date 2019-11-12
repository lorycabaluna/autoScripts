Then (/^I Purchase "(New|PreOrder|PreOwned|Download|Online)" item with SKU "([^\"]*)" for "(PickupAtStore|BuyOnline|Default)"$/) do |purchaseType, sku,pickOrBuy|
	steps %Q{
	 Then I search item with SKU "#{sku}"
	}
	
	sleep(10)
	if(purchaseType == "PreOwned")
		tap_when_element_exists("* id:'product_preowned'")
	elsif (purchaseType == "New")
		tap_when_element_exists("* id:'product_new'")
	elsif (purchaseType == "PreOrder")
		tap_when_element_exists("* id:'product_preorder'}")
	elsif (purchaseType == "Download")
		tap_when_element_exists("* id:'product_download'")
	elsif (purchaseType == "Online")
		tap_when_element_exists("* id:'checkoutprompt_payonline_textview'")
	end
	
	sleep(2)
	if (!query("* id:'checkoutprompt_checkoutnow_textview'").empty?)
		tap_when_element_exists("* id:'checkoutprompt_checkoutnow_textview'")
	end
	
	sleep(2)
	steps %Q{
		Then I check if message Are you sure you want to pre-order another copy?
		Then I validate if it has pop-up screen message
		}
	
	
	sleep(2)
	if (!query("* id:'checkoutagegate_pass_textview'").empty?)
		
		#Item is for Matured click Im 17 yr old to continue
		tap_when_element_exists("* id:'checkoutagegate_pass_textview'")
	end
	
	
	
	if(pickOrBuy != "Default")
		sleep(2)
		#Validate if Pickup at store or Buy online
		steps %Q{
			Then I "#{pickOrBuy}" the item
		}
	else
		sleep(2)          
		if (!query("* id:'checkoutprompt_checkoutnow_textview'").empty?)
			tap_when_element_exists("* id:'checkoutprompt_checkoutnow_textview'")
		end
	end
	
	steps %Q{
				Then I validate if it has pop-up screen message
			}
end


Then (/^I Purchase "(New|PreOrder|PreOwned|Download|Online)" item with SKU "([^\"]*)" for "(PickupAtStore|BuyOnline|Default)" then "(CheckOut|AddToCart)"$/) do |purchaseType, sku,pickOrBuy,checkoutOrAddToCart|
	steps %Q{
	 Then I search item with SKU "#{sku}"
	}
	
	sleep(10)
	if(purchaseType == "PreOwned")
		tap_when_element_exists("* id:'product_preowned'")
	elsif (purchaseType == "New")
		tap_when_element_exists("* id:'product_new'")
	elsif (purchaseType == "PreOrder")
		tap_when_element_exists("* id:'product_preorder'}")
	elsif (purchaseType == "Download")
		tap_when_element_exists("* id:'product_download'")
	elsif (purchaseType == "Online")
		tap_when_element_exists("* id:'checkoutprompt_payonline_textview'")
	end
	
	
		
	sleep(2)
	if (!query("* id:'checkoutagegate_pass_textview'").empty?)
		
		#Item is for Matured click Im 17 yr old to continue
		tap_when_element_exists("* id:'checkoutagegate_pass_textview'")
	end
	
	sleep(2)
	steps %Q{
		Then I check if message Are you sure you want to pre-order another copy?
		}
	
	if(pickOrBuy != "Default")
		sleep(2)
		#Validate if Pickup at store or Buy online
		steps %Q{
			Then I "#{pickOrBuy}" the item
		}
	end
	
	print("\nCheckoutOrAddToCart:#{checkoutOrAddToCart}")
	
	if(checkoutOrAddToCart == "CheckOut")
		sleep(2)          
		if (!query("* id:'checkoutprompt_checkoutnow_textview'").empty?)
			tap_when_element_exists("* id:'checkoutprompt_checkoutnow_textview'")
		end
	else
		sleep(2)
		if (!query("* id:'checkoutprompt_addtocart_textview'").empty?)
			tap_when_element_exists("* id:'checkoutprompt_addtocart_textview'")
		end
	end
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
	
end

Then (/^I "(PickupAtStore|BuyOnline|Default)" the item$/) do | pickOrBuy |
	sleep(2)
	if pickOrBuy == "PickupAtStore"
		tap_when_element_exists("* id:'checkoutprompt_pickupatstore_textview'")
	elsif pickOrBuy == "BuyOnline"
		tap_when_element_exists("* id:'checkoutprompt_payonline_textview'")
	end
end

