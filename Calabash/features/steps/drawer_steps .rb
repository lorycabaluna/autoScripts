Then (/^I click Signout$/) do
	pan_up
	signout = query("* id:'drawer_bottomview_signouttextview'")
	if(signout.empty?)
		fail("Signout not found.")
	else
		tap_when_element_exists("* id:'drawer_bottomview_signouttextview'")
	end
end

Then (/^I click Home Store$/) do
	wait_for_text("Set Console",:timeout_message => "Home Store is not displayed.",:timeout => 20)
	
	homeStore = query("* id:'dashboard_top_store_imageview'")
	
	
	if(homeStore.empty?)
		fail("Home Store not found.")
	else
		tap_when_element_exists("* id:'dashboard_top_store_imageview'")
	end
end



