Then (/^I click on Shipping Information$/) do
	print("\nVerifying Shipping information...\n")
	steps %Q{
		Then am I in this page "CHECKOUT"
	}
	
	if(query("* id:'img_shipping_info_disclosure'").empty?)
		sleep(20)
		if(query("* id:'img_shipping_info_disclosure'").empty?)
			fail("Shipping Infomation button is not on screen.")
		end
	else
		tap_when_element_exists("* id:'img_shipping_info_disclosure'")
	end
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
	
end

Then (/^I click on Delivery Options$/) do
	print("\nVerifying Delivery information...\n")
	steps %Q{
		Then am I in this page "CHECKOUT"
	}
	
	if(query("* id:'img_delivery_info_disclosure'").empty?)
		sleep(20)
		if(query("* id:'img_delivery_info_disclosure'").empty?)
			fail("Delivery Infomation button is not on screen.")
		end
	else
		tap_when_element_exists("* id:'img_delivery_info_disclosure'")
	end
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
end

Then (/^I click on Payment$/) do
	print("\nVerifying Payment information...\n")
	steps %Q{
		Then am I in this page "CHECKOUT"
	}
	
	if(query("* id:'img_payment_info_disclosure'").empty?)
		sleep(20)
		if(query("* id:'img_payment_info_disclosure'").empty?)
			fail("Payment Infomation button is not on screen.")
		end
	else
		tap_when_element_exists("* id:'img_payment_info_disclosure'")
	end
	sleep(3)
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
	
	
end

Then (/^I click on Promo Code$/) do
	print("\nClicked to Promo Code...\n")
	
	steps %Q{
		Then am I in this page "CHECKOUT"
	}
	
	if(query("* id:'img_discount_info_disclosure'").empty?)
		fail("\nDiscount Infomation button is not on screen.\n")
	else
		tap_when_element_exists("* id:'img_discount_info_disclosure'")
		print("\nGoing to Promotions page...\n")
	end
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
end

Then (/^I Checkout item "(Now|AddToCart)"$/) do | checkout |
	sleep(2)
	if(checkout == "Now")
		tap_when_element_exists("* id:'checkoutprompt_checkoutnow_textview'")
	elsif (checkout == "AddToCart")
		tap_when_element_exists("* id:'checkoutprompt_addtocart_textview'")
	end
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
end

Then (/^I verify promotion value in Checkout screen$/) do 
	sleep(5)
	
	if(query("* marked:'Promo Saving'").empty?)
		fail("\nPromo saving is not found\n.")
	else
		discount = query("* id:'txt_summary_discount'")
		
		if(discount.empty?)
			fail("\nNo Promo value.\n")
		else
			print("\nPromo Saving...#{discount[0]["text"]}\n")
		end
	end
	
end

Then (/^I Checkout"$/) do 
	sleep(2)
	tap_when_element_exists("* id:'cart_header_checkout_textview'")
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
	
end

Then (/^I verify Checkout page with "([^\"]*)"$/) do | itemToCheck|
		
	    print("\nVerifying Checkout Page...\n")
		
		steps %Q{
				Then I validate if it has pop-up screen message
			}
			
		cartItem = query("* id:'text_header_info'",:getText).first
		
		if (cartItem.to_s.strip.length == 0)
				fail("Cart is empty.")
		else
			print("\nCart Item: #{cartItem}\n")
		end
		
		productTitle = query("* id:'cart_titletextview'",:getText).first
		
		if (productTitle.to_s.strip.length == 0)
				fail("Product Title is empty.")
		else
			print("\nProduct Title: #{productTitle}\n")
		end
		
		productPrice = query("* id:'cart_pricetextview'",:getText).first
		
		if (productPrice.to_s.strip.length == 0)
				fail("Product Price is empty.")
		else
			print("\nProduct Price: #{productPrice}\n")
		end
		
		cartSubtotal = query("* id:'txt_summary_cart_subtotal'",:getText).first
		if (cartSubtotal.to_s.strip.length == 0)
				fail("Cart Subtotal is empty.")
		else
			print("\nCart Subtotal: #{cartSubtotal}\n")
		end
		
		cartSummary = query("* id:'txt_summary_shipping'",:getText).first
		if (cartSummary.to_s.strip.length == 0)
				fail("Cart Summary Shipping is empty.")
		else
			print("\nCart Summary Shipping: #{cartSummary}\n")
		end
		
		cartSummaryEstimated = query("* id:'txt_summary_estimated_tax'",:getText).first
		if (cartSummaryEstimated.to_s.strip.length == 0)
				fail("Cart Summary Estimated Tax is empty.")
		else
			print("\nCart Summary Estimated Tax: #{cartSummaryEstimated}\n")
		end
		
		cartSummaryOrderTotal = query("* id:'txt_summary_order_total'",:getText).first
		if (cartSummaryOrderTotal.to_s.strip.length == 0)
				fail("Cart Summary Order Total is empty.")
		else
			print("\nCart Summary Order Total: #{cartSummaryOrderTotal}\n")
		end
				
		steps %Q{
		Then I should see back button
		Then I should see the button "PLACE ORDER" 
		Then I should see "Payment" navigation arrow Id "img_payment_info_disclosure"
		Then I should see "Promo" navigation arrow Id "img_discount_info_disclosure"
		Then I should see the "#{itemToCheck}" text
		}	
		
		productIcon = query("* id:'cart_boxartimageview'")
		if (productIcon.empty?)
				fail("Item icon not displayed.")
		else
			print("\nItem Icon is displayed properly.")
		end
end



