Then (/^I verify Dashboard Settings$/) do
	print("\nVerifying Dashboard Settings...\n")
	steps %Q{
		Then I scroll down
		Then I touch the "SETTINGS" text
		Then I see "Push Message Settings" text
		Then I see "Tutorials" text
		Then I see "Offers" text
		Then I see "RESET TUTORIALS" text
		Then I verify Tutorial and Offers setting
		Then I touch the "Push Message Settings" text
		Then I verify Push Message Settings
	}
end

Then (/^I verify Tutorial and Offers setting$/) do 
	print("\nChecking Tutorial Offers...\n")
	sleep(5)
	tutorialSwitch = query("* id:'setting_tutorial_toggle'",:isChecked)
	offerSwitch = query("* id:'setting_instoreoffers_toggle'",:isChecked)
	
	toggle = "ON"
	
	if(tutorialSwitch[0]==false)
		toggle="OFF"
	end
	print("\nTutorials is #{toggle}.\n")
	
	toggle = "ON"
	
	if(offerSwitch[0]==false)
		toggle="OFF"
	end
	
	print("\nOffers is #{toggle}.\n")
	
end

Then (/^I verify Push Message Settings$/) do 
	print("\nChecking Push Message Settings...\n")
	sleep(10)
	msgSwitches = query("* id:'message_switch'",:isChecked)
	msgTitles = query("* id:'message_title'",:getText)
	
	if(msgSwitches.count > 0)
		
		i=0
		num= msgSwitches.count
		
		while i < num
			toggle="ON"
			
			if(msgSwitches[1]==false)
				toggle= "OFF"
			end
			
			print("\n#{msgTitles[i]} is #{toggle}\n")
			i+=1
		end
		
	else
		print("\nNo Available Settings.\n")
	end
end



