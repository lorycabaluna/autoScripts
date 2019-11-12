Then (/^I verify Dashboard About Feedback$/) do
   print("\nVerifying About Feedback section...\n")
	steps %Q{
		Then I scroll down
		Then I touch the "ABOUT/FEEDBACK" text
		Then I see "Privacy Policy" text
		Then I see "Terms & Conditions" text
		Then I see "Send Feedback" text
		Then I tap "Privacy Policy"
		Then I tap "Privacy Policy"
		Then I tap "Terms & Conditions"
		Then I tap "Terms & Conditions"
		Then I tap "Send Feedback"
		Then I tap "Send Feedback"
	}
end


Then (/^I tap "(Privacy Policy|Terms & Conditions|Send Feedback)"$/) do |text|
	print("\nShowing '#{text}'...\n")
	sleep(5)
	
	toggle = query("* marked:'#{text}'")
	
	if(toggle.count > 0)
		tap_when_element_exists("* marked:'#{text}'")
		sleep(5)
	else
		print("\nCannot toggle #{text}.\n")
	end
end



