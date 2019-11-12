class ShippingInformation

	 def initialize(testId,phoneNumber,fullName,lastName,country,address,city,state,zipCode,emailAddress)
	    @testId=testId
		@phoneNumber=phoneNumber
		@fullName=fullName
		@lastName=lastName
		@country=country
		@address=address
		@city=city
		@state=state
		@zipCode=zipCode
		@emailAddress=emailAddress
	  end	 
	
	def testId
		@testId
	end
	
	def phoneNumber
		@phoneNumber
	end
	
	def fullName
		@fullName
	end
	
	def lastName
		@lastName
	end
	
	def country
		@country
	end
	
	def address
		@address
	end
	
	def city
		@city
	end
	
	def state
		@state
	end
	
	def zipCode
		@zipCode
	end
	
	def emailAddress
		@emailAddress
	end
	
	def self.getCSVData(tcId)
		CSV.foreach('C:\Users\c101433\Desktop\ECOM\GS APK\latest MIP\SmokeTestData.csv') do |row|
		  break if row[0].nil?
		  
		  if(!row[0].nil? && row[0] != "TestID")
			 if(row[0]== tcId)
			    @testId = row[0]
				@phoneNumber=row[9]
				@fullName=row[11]
				@lastName=row[12]
				@country=row[13]
				@address=row[14]
				@city=row[15]
				@state=row[16]
				@zipCode=row[17]
				@emailAddress=row[18]
			 end
		  end
		  
		end
		return new(@testId,@phoneNumber,@fullName,@lastName,@country,@address,@city,@state,@zipCode,@emailAddress)
	end	
	  
end

Then (/^I verify new shipping address$/) do
	steps %Q{
		Then I click on Shipping Information
		Then I click on Add or Edit Address
		Then I verify Fullname in New Shipping Address
		Then I verify Lastname in New Shipping Address
		Then I verify Country in New Shipping Address
		Then I verify City in New Shipping Address
		Then I verify Zip code in New Shipping Address
		Then I verify Email address in New Shipping Address
		Then I verify Phone number in New Shipping Address
		Then I click on Save in New Shipping Address
		}
end

Then (/^I enter new Shipping Address$/) do

	shippingInfo = ShippingInformation.getCSVData($currentTestId)
	
	if(shippingInfo.testId.nil?)
		fail("No shipping information found in csv using testid='#{$currentTestId}'")
	end
	
	steps %Q{
		Then I click on Shipping Information
		Then I click on Add or Edit Address
		Then I enter "#{shippingInfo.fullName}" as Fullname in New Shipping Address
		Then I enter "#{shippingInfo.lastName}" as Lastname in New Shipping Address
		Then I select "#{shippingInfo.country}" as Country in New Shipping Address
		Then I enter "#{shippingInfo.address}" as Address in New Shipping Address
		Then I enter "#{shippingInfo.city}" as City in New Shipping Address
		Then I select "#{shippingInfo.state}" as State in New Shipping Address
		Then I enter "#{shippingInfo.zipCode}" as Zip code in New Shipping Address
		Then I enter "#{shippingInfo.phoneNumber}" as Phone number in New Shipping Address
		Then I enter "#{shippingInfo.emailAddress}" as Email address in New Shipping Address		
		Then I click on Save in New Shipping Address
	}
end

Then (/^I scroll until I see the "([^\"]*)" text$/) do |text|
  q = query("TextView text:'#{text}'")
  while q.empty?
    scroll_down
    q = query("TextView text:'#{text}'")
  end 
end

Then (/^I click on Save in New Shipping Address$/) do
	sleep(2)
	tap_when_element_exists("* id:'app_checkout_save'")
end

Then (/^I click on Add or Edit Address$/) do
	sleep(5)
	scroll_count=0
	addEditFound=false
	while scroll_count <=3
	    scroll_count+=1
		addEdit = query("* marked:'Add or Edit Address'")
		
		if(addEdit.empty?)
			scroll_down
			sleep(2)
		else
			addEditFound=true
			break
		end
	end
	
	if(addEditFound)
		scroll_down
		tap_when_element_exists("* marked:'Add or Edit Address'")
	end
end

Then (/^I verify Fullname in New Shipping Address$/) do
	sleep(5)
	firstname = query("* id:'txt_first_name'",:getText).first
	
	if (firstname.to_s.strip.length == 0)
			fail("Full name is empty.")
	else
		print("\nFull name: #{firstname}")
	end
end

Then (/^I enter "([^\"]*)" as Fullname in New Shipping Address$/) do |fullName|
	sleep(5)
	firstname = query("* id:'txt_first_name'",:getText).first
	
	if (firstname.to_s.strip.length != 0)
		clear_text_in("* id:'txt_first_name'")
	end
	
	enter_text("* id:'txt_first_name'",fullName)
	press_user_action_button
end

Then (/^I verify Lastname in New Shipping Address$/) do
	sleep(3)
	lastname = query("* id:'txt_last_name'",:getText).first
	
	if (lastname.to_s.strip.length == 0)
			fail("Lastname is empty.")
	else
		print("\nLastname: #{lastname}")
	end
end

Then (/^I enter "([^\"]*)" as Lastname in New Shipping Address$/) do |text|
	sleep(5)
	lastname = query("* id:'txt_last_name'",:getText).first
	
	if (lastname.to_s.strip.length != 0)
		clear_text_in("* id:'txt_last_name'")
	end
	
	enter_text("* id:'txt_last_name'",text)
	press_user_action_button
end

Then (/^I verify Address in New Shipping Address$/) do
	sleep(3)
	address = query("* id:'txt_address'",:getText).first
	
	if (address.to_s.strip.length == 0)
			fail("Address is empty.")
	else
		print("\nLastname: #{address}")
	end
end

Then (/^I enter "([^\"]*)" as Address in New Shipping Address$/) do |text|
	sleep(5)
	address = query("* id:'txt_address'",:getText).first
	
	if (address.to_s.strip.length != 0)
		clear_text_in("* id:'txt_address'")
	end
	
	enter_text("* id:'txt_address'",text)
	press_user_action_button
end


Then (/^I verify Country in New Shipping Address$/) do
	sleep(3)
	country = query("* id:'text1'",:getText).first
	
	if (country.to_s.strip.length == 0)
			fail("Country is empty.")
	else
		print("\nCountry: #{country}")
	end
end

Then /^I select country "([^\"]*)" from "([^\"]*)"$/ do |item_identifier, spinner_identifier|
  spinner = query("android.widget.Spinner marked:'#{spinner_identifier}'")

  if spinner.empty?
    tap_when_element_exists("android.widget.Spinner * marked:'#{spinner_identifier}'")
  else
    touch(spinner)
  end
  tap_when_element_exists("android.widget.CheckedTextView * marked:'#{item_identifier}'")
  #tap_when_element_exists("android.widget.PopupWindow$PopupViewContainer * marked:'#{item_identifier}'")
end

Then (/^I select "([^\"]*)" as Country in New Shipping Address$/) do |text|
	sleep(5)
	country = query("* id:'spn_country'")
	
	if (country.empty?)
		fail("Country dropdown is not found.")
	else
		#sleep(1)
		# tap_when_element_exists("* marked:'#{text}'")
		
		if(text != "United States of America")
		tap_when_element_exists("* id:'spn_country'")
		
			steps %Q{
				Then I scroll until "#{text}" is visible
			}
		end
	end
	
end

Then (/^I verify City in New Shipping Address$/) do
	sleep(3)
	city = query("* id:'txt_city'",:getText).first
	
	if (city.to_s.strip.length == 0)
			fail("City is empty.")
	else
		print("\nCity: #{city}")
	end
end

Then (/^I enter "([^\"]*)" as City in New Shipping Address$/) do |text|
	sleep(5)
	city = query("* id:'txt_city'",:getText).first
	
	if (city.to_s.strip.length != 0)
		clear_text_in("* id:'txt_city'")
	end
	
	enter_text("* id:'txt_city'",text)
	press_user_action_button
end

Then (/^I verify State in New Shipping Address$/) do
	sleep(3)
	state = query("* id:'text1'",:getText)
	
	if(state.count > 1)
		state = state[1]
	end
	
	if (state == "Select a state")
			fail("State is empty.")
	else
		print("\nState: #{state}")
	end
end

Then (/^I select "([^\"]*)" as State in New Shipping Address$/) do |text|
	sleep(5)
	spinner = query("* id:'spn_state_province'")
	
	if (spinner.empty?)
		fail("State dropdown is not found.")
	else
		tap_when_element_exists("* id:'spn_state_province'")
		# sleep(2)
		# tap_when_element_exists("* marked:'#{text}'")
		
		steps %Q{
			Then I scroll until "#{text}" is visible
		}
	end
	
end

Then (/^I verify Zip code in New Shipping Address$/) do
	sleep(3)
	zipCode = query("* id:'txt_postal_code'",:getText).first
	
	if (zipCode.to_s.strip.length == 0)
			fail("Zip Code is empty.")
	else
		print("\nZip Code: #{zipCode}")
	end
end

Then (/^I enter "([^\"]*)" as Zip code in New Shipping Address$/) do |text|
	sleep(5)
	zipCode = query("* id:'txt_postal_code'",:getText).first
	
	if (zipCode.to_s.strip.length != 0)
		clear_text_in("* id:'txt_postal_code'")
	end
	
	enter_text("* id:'txt_postal_code'",text)
	press_user_action_button
end

Then (/^I verify Phone number in New Shipping Address$/) do
	sleep(3)
	phoneNumber = query("* id:'txt_phone'",:getText).first
	
	if (phoneNumber.to_s.strip.length == 0)
			fail("Phone Number is empty.")
	else
		print("\nPhone Number: #{phoneNumber}")
	end
end

Then (/^I enter "([^\"]*)" as Phone number in New Shipping Address$/) do |text|
	sleep(5)
	phoneNumber = query("* id:'txt_phone'",:getText).first
	
	if (phoneNumber.to_s.strip.length != 0)
		clear_text_in("* id:'txt_phone'")
	end
	
	enter_text("* id:'txt_phone'",text)
	press_user_action_button
end

Then (/^I verify Email address in New Shipping Address$/) do
	sleep(3)
	emailAddress = query("* id:'txt_email'",:getText).first
	
	if (emailAddress.to_s.strip.length == 0)
			fail("Email address is empty.")
	else
		print("\nEmail address: #{emailAddress}")
	end
end

Then (/^I enter "([^\"]*)" as Email address in New Shipping Address$/) do |text|
	sleep(5)
	emailAddress = query("* id:'txt_email'",:getText).first
	
	if (emailAddress.to_s.strip.length != 0)
		clear_text_in("* id:'txt_email'")
	end
	
	enter_text("* id:'txt_email'",text)
	press_user_action_button
end

Then (/^I verify if pop-up billing address is shown in New Shipping Address$/) do
	sleep(3)
	popup = query("* marked:'Please enter a billing address.'",:getText).first
	
	if (popup.to_s.strip.length > 0)
		#Click OK from pop-up
		tap_when_element_exists("* id:'button1'")
		sleep(2)
		#Click Add Billing Address link
		tap_when_element_exists("* id:'txt_gift_card_add_address'")
		sleep(3)
		#Select same as shipping address
		tap_when_element_exists("* id:'selectSameAsShippingAddress'")
		
		sleep(5)
		tap_when_element_exists("* id:'img_icon_add_gift_card'")
	end
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
	
end

Then (/^I select Same as Shipping Address$/) do
	sleep(3)
	same = query("* id:'selectSameAsShippingAddress'")
	
	if(!same.empty?)
		tap_when_element_exists("* id:'selectSameAsShippingAddress'")
	else
		fail("Same as Shipping Address button is not found.")
	end
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
end

		


