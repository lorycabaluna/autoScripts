Then (/^I click on Buy Online button$/) do
	sleep(3)
	tap_when_element_exists("* id:'checkoutprompt_payonline_textview'")
end

Then (/^I click on Buy Download button$/) do
	sleep(3)
	tap_when_element_exists("* id:'product_download'")
end

Then (/^I click on Buy PreOrder button$/) do
	sleep(1)
	tap_when_element_exists("* id:'product_preorder'}")
end

Then (/^I click on Buy PreOwned button$/) do
	sleep(3)
	tap_when_element_exists("* id:'product_preowned'")
end

Then (/^I click on Buy New button$/) do
	sleep(3)
	tap_when_element_exists("* id:'product_new'")
end

Then (/^I should see cover art$/) do
	sleep(5)
	coverArt = query("* id:'product_topart_boxart_imageview'")
	if(coverArt.empty?)
		fail("No cover art displayed.")
	end
end

Then (/^I should see game title$/) do
	sleep(5)
	gameTitle = query("* id:'product_title_textview'",:getText).first
	if(gameTitle.empty?)
		fail("No game title displayed.")
	else
		if (gameTitle.to_s.strip.length == 0)
			fail("No game title displayed.")
		else
			print("Game Title: #{gameTitle}")
		end
	end
end

Then (/^I should see platform$/) do
	sleep(5)
	platForm = query("* id:'product_platform_textview'",:getText).first
	if(platForm.empty?)
		fail("No platform displayed.")
	else
		if (platForm.to_s.strip.length == 0)
			fail("No platform displayed.")
		else
			print("Platform: #{platForm}")
		end
	end
end

Then (/^I should see release date$/) do
	sleep(5)
	releaseDate = query("* id:'product_releasedate_textview'",:getText).first
	if(releaseDate.empty?)
		fail("No release date displayed.")
	else
		if (releaseDate.to_s.strip.length == 0)
			fail("No release date displayed.")
		else
			print("#{releaseDate}")
		end
	end
end

Then (/^I should see user rating$/) do
	sleep(5)
	userRating = query("* id:'product_ratingtextview'",:getText).first
	if(userRating.empty?)
		fail("No user rating displayed.")
	else
		if (userRating.to_s.strip.length == 0)
			fail("No user rating displayed.")
		else
			print("User Rating:#{userRating}")
		end
	end
end

Then (/^I should see NEW,DOWNLOAD or PREOWNED$/) do
	sleep(5)
	new = query("* marked:'NEW'",:getText).first
	download = query("* marked:'DOWNLOAD'",:getText).first
	preowned = query("* marked:'PREOWNED'",:getText).first
	
	if(new.empty? && download.empty? && preowned.empty?)
		fail("No new,download or preowned item displayed.")
	end
end

Then (/^I should see item details view$/) do
	sleep(5)
	detailsView = query("* id:'view_product_details_textview'",:getText).first
	if(detailsView.empty?)
		fail("No details view displayed.")
	else
		if (detailsView.to_s.strip.length == 0)
			fail("No details view displayed.")
		end
	end
end


Then (/^I should see item esrb rating$/) do
	sleep(5)
	esrbRating = query("* id:'product_esrb_textview'",:getText).first
	if(esrbRating.empty?)
		fail("No esrb rating displayed.")
	else
		if (esrbRating.to_s.strip.length == 0)
			fail("No esrb rating displayed.")
		else
			print("ESRB Rating:#{esrbRating}")
		end
	end
end

Then (/^I should see item publisher$/) do
	sleep(5)
	publisher = query("* id:'product_publisherdev_publisher_textview'",:getText).first
	if(publisher.empty?)
		fail("No publisher displayed.")
	else
		if (publisher.to_s.strip.length == 0)
			fail("No publisher displayed.")
		else
			print("Publisher:#{publisher}")
		end
	end
end

Then (/^I should see item developer$/) do
	sleep(5)
	developer = query("* id:'product_publisherdev_dev_textview'",:getText).first
	if(developer.empty?)
		fail("No developer displayed.")
	else
		if (developer.to_s.strip.length == 0)
			fail("No developer displayed.")
		else
			print("Developer:#{developer}")
		end
	end
end

Then (/^I select New or PreOwned$/) do
	sleep(5)
	new = query("* marked:'NEW'",:getText).first
	preowned = query("* marked:'PREOWNED'",:getText).first
	
	if(new.to_s.strip.length == 0 && preowned.to_s.strip.length == 0)
		fail("No new or preowned item to be selected.")
	else
	
		if(new.to_s.strip.length != 0)
			touch("* marked:'NEW'")
		
		elsif (new.to_s.strip.length == 0 && preowned.to_s.strip.length != 0)
			touch("* marked:'PREOWNED'")
		end
	end
end

Then (/^I select Pickup at store$/) do
	sleep(5)
	pickup = query("* id:'checkoutprompt_pickupatstore_textview'")
	
	if(pickup.empty?)
		fail("No pickup option.")
	else
		tap_when_element_exists("* id:'checkoutprompt_pickupatstore_textview'")
	end
	sleep(5)
end






