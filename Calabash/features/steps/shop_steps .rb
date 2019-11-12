Then (/^I click on Shop icon$/) do
	sleep(3)
	if(query("* marked:'SHOP'").empty?)
		fail("\nSHOP not found on screen.\n")
	else
		tap_when_element_exists("* marked:'SHOP'")
	end
end

Then (/^I click on add to cart button$/) do
	print("\nAdding item to cart...\n")
	sleep(3)
	addToCart = query("* id:'checkoutprompt_addtocart_textview'")
	
	if(addToCart.empty?)
		fail("\nError: Add to Cart prompt is not displayed.\n")
	else
		tap_when_element_exists("* id:'checkoutprompt_addtocart_textview'}")
		print("\nAdded to cart, successful.\n")
	end
end

Then (/^I Search using Shops by "([^\"]*)" and sort by "(Best Sellers|Release Date|Price Ascending|Price Descending)"$/) do |shopBy,sortBy|
	print("\nSearch Shops by '#{shopBy}' and sort by '#{sortBy}'...\n")
	steps %Q{
		Then I click on Shop icon
		Then I touch the "#{shopBy}" text
		Then I see "Sort by" text
		Then I click search sort by button
		Then I sort by "#{sortBy}"
		}
	
	sleep(3)
	print("\nSelecting first item from list\n")
	steps %Q{
		Then I select the first item from the result
	}
	
	sleep(5)
	print("\nGoing back to previous page\n")
	steps %Q{
		Then I go to previous page
	}
end


