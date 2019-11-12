Then (/^I Set Preferred Console "([^\"]*)"$/) do |myConsole|
	steps %Q{
		Then I press ellipsis button
		Then I swipe "left"
		Then I click Set Console
		Then I select console that interests you "#{myConsole}"
		Then I click on Shop icon
		Then I touch the "PREFERRED CONSOLES" text
		Then I see "#{myConsole}" text
	}
end

Then (/^I click Set Console$/) do
	setConsole = query("* id:'dashboard_top_console_imageview'")
	if(setConsole.empty?)
		fail("\nSet Console not found.\n")
	else
		tap_when_element_exists("* id:'dashboard_top_console_imageview'")
	end
end

Then (/^I select console that interests you "([^\"]*)"$/) do |myConsole|
	sleep(10)
	consoles = query("* id:'console_textview'")
	if(consoles.empty?)
		fail("\nConsole list empty.\n")
	else
		steps %Q{
			Then I scroll until "#{myConsole}" is visible
		}
	end
	
	sleep(2)
	press_back_button
	
	sleep(2)
	press_back_button
end

