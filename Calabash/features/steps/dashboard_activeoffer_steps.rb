Then (/^I verify Active Offers$/) do
	print("\nVerifying Active Offerss...\n")
	steps %Q{
		Then I touch the "ACTIVE OFFERS" text
		Then I see Active Offers list
		Then I select first item from Active Offers
		Then I validate if Save to Android Pay is displayed
	}
end

Then (/^I see Active Offers list$/) do
	print("\nShowing Active Offer list...\n")
	sleep(10)
	
	offers = query("* id:'offers_listitem_titletextview'")
	
	if(offers.count > 0)
	
		i = 0
		num = offers.count

		while i < num  do
			print("\n#{offers[i]["text"]}\n" )
		    i+=1
		end
	else
		print("\nNo Active Offers.\n")
	end
end

Then (/^I select first item from Active Offers$/) do
	print("\nSelecting first item from Active Offerss...\n")
	sleep(2)
	offers = query("* id:'offers_listitem_titletextview'")
	
	if(offers.count > 0)
		tap_when_element_exists("* id:'offers_listitem_titletextview' index:0")
	else
		print("\nNo Active Offers.\n")
	end
end

Then (/^I validate if Save to Android Pay is displayed$/) do
	print("\nValidating Android pay...\n")
	sleep(2)
	wallet = query("* id:'save_to_wallet'")
	
	if(wallet.count > 0)
		print("\nSave to Android Pay is displayed.\n")
	else
		fail("\n Save to Android Pay is not displayed.\n")
	end
end

