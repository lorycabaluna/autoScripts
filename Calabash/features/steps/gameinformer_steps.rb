Then (/^I verify Game Informer News as "(NonPUR|PUR)"$/) do |purType|
 sleep(2)
 print("\nVerifying Game Informer News\n")
 
	if(purType == "NonPUR")
		havePur = query("* id:'drawer_bottomview_nonpur_gameinformertextview'")
		purId = "drawer_bottomview_nonpur_gameinformertextview"
	end
	
	if(purType == "PUR")
		havePur = query("* id:'drawer_bottomview_gameinformertextview'")
		purId = "drawer_bottomview_gameinformertextview"
	end
 
 if(havePur.empty?)
	fail("\n\Game Informer News is not on the screen.\n")
 else
	tutorial = query("* id:'tutorial_ximageview'")
		
	if(!tutorial.empty?)
		pan_left
	end
	
	tap_when_element_exists("* id:'#{purId}'")
	
	sleep(3)
	
	tutorial = query("* id:'tutorial_ximageview'")
		
		if(!tutorial.empty?)
			pan_left
		end
	
	pageTitle = query("* id:'toolbar_title'")
	
	if(pageTitle[0]["text"] != "GAME INFORMER NEWS")
		fail("\nNot in Game Informer News screen.\n")
	end
 end
 
	steps %Q{
		Then I see "FEATURES" text
		Then I see "NEWS" text
		Then I see "PREVIEWS" text
		Then I see "REVIEWS" text
		Then I see action refresh button
		Then I select first item from "Features"
		Then I go back
		Then I select first item from "News"
		Then I go back
		Then I select first item from "Previews"
		Then I go back
		Then I select first item from "Reviews"
		Then I go back		
	}
end

Then (/^I see action refresh button$/) do
	sleep(10)
	
	refresh = query("* id:'action_refresh'")
	
	if(refresh.count > 0)
		print("\nAction Refresh button is displayed.\n")
		tap_when_element_exists("* id:'action_refresh'")
	else
		fail("\nNo Refresh button.\n")
	end
end

Then (/^I select first item from "(Features|News|Previews|Reviews)"$/) do |gameInfo|
	tap_when_element_exists("* marked:'#{gameInfo}'")

	sleep(10)
	
	rssItems = query("* id:'rss_item_image'")
	
	if(rssItems.count > 0)
		tap_when_element_exists("* id:'rss_item_image' index:0")
		sleep(3)
	else
		print("\nNo #{gameInfo} Available.\n")
	end
end



