Then (/^I verify Digital Locker$/) do
	steps %Q{
		Then I scroll down
		Then I touch the "DIGITAL LOCKER" text
		Then I see Digital Locker items
	}
end

Then (/^I see Digital Locker items$/) do 
	sleep(10)
	digital = query("* id:'listheader_empty_textview'")
	
	if(digital.count > 0)
		print("\n#{digital[0]["text"]}\n")
	else
		print("\nDigital locker has items\n")
	end
end



