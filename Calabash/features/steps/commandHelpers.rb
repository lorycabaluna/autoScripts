class Device
extend Calabash::Android::Operations

	def self.press_back_button
		cmd = "#{default_device.adb_command} shell input keyevent 4"
		system(cmd)
	end

end

Then (/^I go to previous page$/) do
	Device.press_back_button
end

Then (/^I wait for "([^"]*)" to exist if YES "(Click|Type)" this "([^"]*)" and if NOT show this message "([^"]*)"$/) do |objId,clickType,txtInput,errorMsg|
	
	if(objId == 'search_result_titletextview')
	
		sleep(20)
		hasResult = query("* id:'search_result_titletextview'")
		
		if(hasResult.empty?)
			tap_when_element_exists("* id:'actionlayout_search_edittext'")
			sleep(2)
			press_user_action_button
			sleep(3)
		end
	else
		wait_for(timeout: 20,timeout_message: "#{errorMsg}") do
			element_exists("* id:'#{objId}'")
		end
		
		if(clickType == "Type")
			enter_text("* id:'#{objId}'",txtInput)
			print("\nEntered Text:#{txtInput}\n")
			press_user_action_button
		else
			tap_when_element_exists("* id:'#{objId}'")
		end
	
	end
end

Then (/^I validate if tutorial device pop-up is visible$/) do
	sleep(3)
	rotateDevice = query("* id:'tutorial_ximageview'")
	if (!rotateDevice.empty?)
		tap_when_element_exists("* id:'tutorial_ximageview'")
	end
	sleep(3)
end

Then (/^am I in this page "([^"]*)"$/) do |myPage|

	wait_for_text("#{myPage}",:timeout_message => "\nNot in #{myPage} Page...\n",:timeout => 20)

	titlePage = query("* id:'toolbar_title'")
	if(!titlePage.empty?)
		print("\nYou are in '#{titlePage[0]["text"]}' Page\n")
		
		if(titlePage[0]["text"] != myPage)
			fail("\nYou are not in '#{myPage}' Page\n")
		
		else
			if(myPage == "CHECKOUT")
				steps %Q{
					Then I validate if it has pop-up screen message
				}
				
				wait_for_text("PLACE ORDER",:timeout_message => "\nCheckout Page not loaded correctly.\n",:timeout => 20)
			end
		end
	else
		fail("\nYou are not in '#{myPage}' Page\n")
	end
	
end

Then (/^I go to Main Menu$/) do 
	sleep(3)
	steps %Q{
		Then I press ellipsis button
		Then I validate if tutorial device pop-up is visible
	}
end




		


