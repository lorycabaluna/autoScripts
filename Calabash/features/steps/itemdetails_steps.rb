
Then (/^I enter my personal details in HOPS$/) do
	personalInfo = ShippingInformation.getCSVData($currentTestId)
	
	if(personalInfo.testId.nil?)
		fail("No Personal information found in csv using testid='#{$currentTestId}'")
	end
	
	steps %Q{
		Then I enter my personal details "#{personalInfo.fullName}","#{personalInfo.lastName}","#{personalInfo.emailAddress}","#{personalInfo.phoneNumber}"
	}
end

Then (/^I enter my personal details "([^\"]*)","([^\"]*)","([^\"]*)","([^\"]*)"$/) do |firstname,lastname,email,phonenumber|
		sleep(2)
		tap_when_element_exists("* id:'hops_firstname_edittext'")
		sleep(2)
        enter_text("* id:'hops_lastname_edittext'", lastname)
		sleep(1)
		enter_text("* id:'hops_firstname_edittext'", firstname)
		sleep(1)
		enter_text("* id:'hops_email_edittext'", email)
		sleep(1)
		enter_text("* id:'hops_phonenumber_edittext'", phonenumber)
		sleep(3)
		tap_when_element_exists("* id:'hops_submit_textview'")
end

Then (/^I enter "([^\"]*)" into firstname field of item details$/) do
	sleep(1)
	enter_text("* id:'hops_firstname_edittext'", text)
end

Then (/^I enter "([^\"]*)" into lastname field of item details$/) do
	sleep(1)
	enter_text("* id:'hops_lastname_edittext'", text)
end

Then (/^I enter "([^\"]*)" into email field of item details$/) do
	sleep(1)
	enter_text("* id:'hops_email_edittext'", text)
end


Then (/^I enter "([^\"]*)" into phone number field of item details$/) do
	sleep(1)
	enter_text("* id:'hops_phonenumber_edittext'", text)
end


Then (/^I click Continue on hops details$/) do
	sleep(1)
	tap_when_element_exists("* id:'hops_submit_textview'")
end

