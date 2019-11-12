Then (/^I verify My Library$/) do
	steps %Q{
		Then I scroll down
		Then I touch the "MY LIBRARY" text
		Then I see "I HAVE" text
		Then I see "I WANT" text
		Then I see "I HAD" text
		Then I select first item from "I HAVE"
		Then I select first item from "I WANT"
		Then I select first item from "I HAD"
	}
end

Then (/^I select first item from "(I HAVE|I WANT|I HAD)"$/) do |text|
    sleep(3)
	tap_when_element_exists("* marked:'#{text}'")
	sleep(10)
		
	bannerEmpty = query("* id:'listheader_empty_textview'")
	
	if(bannerEmpty.count > 0)
		print("\n#{bannerEmpty[0]["text"]}\n")
	else
		gameLibrary = query("* id:'gamelibrary_listitem_titletextview'")
	
		if(gameLibrary.count > 0)
			tap_when_element_exists("* id:'gamelibrary_listitem_titletextview' index:0")
			print("\nItem from #{text} libray selected and displayed.\n")
			sleep(5)
			
			steps %Q{
				Then I go to previous page
			}
		else
			print("\nNo #{text} List Available.\n")
		end
	end
	
	
end



