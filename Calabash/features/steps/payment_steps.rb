class CreditCardInfo
	def initialize (testId,ccNumber,cVV,ccExpiry)
		@testId =testId
		@ccNumber = ccNumber
		@cVV = cVV
		@ccExpiry = ccExpiry
	end
	
	def testId
		@testId
	end
	
	def ccNumber
		@ccNumber
	end
	
	def cVV
		@cVV
	end
	
	def ccExpiry
		@ccExpiry
	end
	
	def self.getCSVData(tcId)
		CSV.foreach('SmokeTestData.csv') do |row|
		  break if row[0].nil?
		  
		  if(!row[0].nil? && row[0] != "TestID")
			 if(row[0]== tcId)
			    @testId = row[0]
				@ccNumber = row[27]
				@cVV = row[28]
				@ccExpiry = row[29]
			 end
		  end
		  
		end
		return new(@testId,@ccNumber,@cVV,@ccExpiry)
	end	
	
end

Then (/^I pay with payment card$/) do
	sleep(15)
	storeInfo = StoreInfo.getCSVData($currentTestId)
		
	if(storeInfo.paymentCardType.nil?)
		fail("\nFailed: No paymentCardType provided in the Test Data.csv.\n")
	end
		
	steps %Q{
		Then I click on Payment
		Then I click on "#{storeInfo.paymentCardType}" as payment card type
	}
end

Then (/^I click on payment button$/) do
	sleep(5)
	tap_when_element_exists("* id:'img_payment_info_disclosure'")
end

	
Then (/^I Add New Card Number then Save address as same shipping addrress$/) do 
	sleep(5)
	ccInfo = CreditCardInfo.getCSVData($currentTestId)
	
	if(ccInfo.testId.nil?)
		fail("No Credit card information found in csv using testid='#{$currentTestId}'")
	end
	
	
	steps %Q{
		Then I click on Payment button
		Then I click on Add a New Credit Card
	}
	sleep(10)
	
	wait_for_element_exists("* id:'txt_cc_number'",timeout:20,timeout_message:"CC Number not found on screen.")
	
	enter_text("* id:'txt_cc_number'",ccInfo.ccNumber)
	
	
	sleep(2)
	enter_text("* id:'txt_cc_expiry'",ccInfo.ccExpiry)
	
	
	sleep(2)
	enter_text("* id:'txt_cc_cvv'",ccInfo.cVV)
	
	steps %Q{
		Then I click on Add or Edit Address
		Then I select Same as Shipping Address
		Then I click on Save in New Shipping Address
		
	}
	#removed from steps
	#Then I click on Save changes in Payment page
end

Then (/^I Add New Card Number and loop through addresses$/) do 
	
	ccInfo = CreditCardInfo.getCSVData($currentTestId)
	
	if(ccInfo.testId.nil?)
		fail("No Credit card information found in csv using testid='#{$currentTestId}'")
	end
	
	steps %Q{
		Then I click on Payment
		Then I click on Add a New Credit Card
	}
	
	sleep(5)
	enter_text("* id:'txt_cc_number'",ccInfo.ccNumber)
	
	
	sleep(2)
	enter_text("* id:'txt_cc_expiry'",ccInfo.ccExpiry)
	
	
	sleep(2)
	enter_text("* id:'txt_cc_cvv'",ccInfo.cVV)
	
	steps %Q{
		Then I loop through addresses available options
		Then I click on Save changes in Payment page
	}
end

Then (/^I click on Add a New Credit Card$/) do
	sleep(5)
	
	addCreditCard = false
	
	addLinkFound = query("* marked:'Add New Credit Card'")
	loopCount = 0
	if(addLinkFound.empty?)
		while( addCreditCard == false && addLinkFound.empty?)
			loopCount +=1
			sleep(2)
			scroll_down
			addLinkFound = query("* marked:'Add New Credit Card'")
			
			if(!addLinkFound.empty?)
				addCreditCard = true			
				break
			end	

			if(loopCount >= 10)
				fail("Add a New Credit Card not found.")
				break
			end
		end
	else
		addCreditCard = true
	end
	
	if(addCreditCard == true && !addLinkFound.empty?)
		scroll_down
		tap_when_element_exists("* id:'txt_add_credit_card'")
	else
		fail("Add a New Credit Card not found.")
	end
end

Then (/^I choose "([^\"]*)" as payment option$/) do | paymentType |
	sleep(5)
	scrollCount=0
	foundPaymentType=false
	print("Payment type: #{paymentType}")
	
	while scrollCount <= 10
		scrollCount+=1
		payment = query("* marked:'#{paymentType}'",:getText).first
		if(payment.to_s.strip.length == 0)
			print("\nScrolling down....")
			pan_up
			sleep(2)
		else
			foundPaymentType=true
			break
		end
	end
	print("\nPayment is: #{payment}")
	print("\nScroll Count:#{scrollCount.to_s}")
	print("\nFound Payment Type: #{foundPaymentType.to_s}")
	if(foundPaymentType)
		pan_up
		sleep(2)
		tap_when_element_exists("* marked:'#{paymentType}'")
	else
		fail("Payment Type '#{paymentType}' not found.")
	end
end

Then (/^I loop through addresses available options$/) do 
	sleep(3)
	addresses = query("* id:'txt_address'")
	
	ctr = 0
	
	begin
	   sleep(2)
	   tap_when_element_exists("* marked:'#{addresses[ctr]["text"]}'")
	   ctr +=1
	end while ctr < addresses.count-1
end

Then (/^I click on Save changes in Payment page$/) do 
	sleep(20)
	foundSave = query("* marked:'SAVE'")
	loop=0
	while(foundSave.empty? && loop < 4)
		foundSave = query("* marked:'SAVE'")
		
		if(!foundSave.empty?)
			loop == 4
			break
		end
		
	    loop+=1
		sleep(2)
		scroll_down
		
	end
	
	if(!foundSave.empty?)
		scroll_down
		tap_when_element_exists("* marked:'SAVE'")
	else
		fail("SAVE button is not found on payment page.")
	end
end



Then (/^I enter Card Number "([^\"]*)" with Expiry "([^\"]*)" and CVV "([^\"]*)"$/) do  | ccNumber, ccExpiry, ccCVV|
	sleep(2)
	enter_text("* id:'txt_cc_number'",ccNumber)
	
	sleep(2)
	enter_text("* id:'txt_cc_expiry'",ccExpiry)
	
	sleep(2)
	enter_text("* id:'txt_cc_cvv'",ccCVV)
	press_user_action_button
end

Then (/^I enter "([^\"]*)" in CC Number field$/) do  | text|
	sleep(2)
	enter_text("* id:'txt_cc_number'",text)
end

Then (/^I enter "([^\"]*)" in CC Expiry field$/) do  | text|
	sleep(2)
	enter_text("* id:'txt_cc_expiry'",text)
end

Then (/^I enter "([^\"]*)" in CC CVV field$/) do  | text|
	sleep(2)
	enter_text("* id:'txt_cc_cvv'",text)
	press_user_action_button
end

Then (/^I click on "(Discover|MasterCard|Visa|AmericanExpress|Paypal|PowerUp)" as payment card type$/) do |paymentCardType|
    sleep(5)
	print("\nPayment using '#{paymentCardType}'\n")
	
	if(query("* marked:'PAYMENT'").empty?)
		fail("Not in payment page..")
	end
	
	loopCount=0
	foundPaymentType = false
	addCreditCardFound = []
	
	while (addCreditCardFound.empty?) do 
	  payment = query("* id:'txt_payment'")
	  addCreditCardFound = query("* id:'txt_add_credit_card'")
	  countCards =0
		
		cards = Array.new()
		loopStart=0
		while loopStart <= payment.count-1
			cards.insert(loopStart,payment[loopStart]["text"])
			loopStart+=1
		end
		
		
	    if(paymentCardType == "Discover")
		 if(cards.include? '****1117')
		    foundPaymentType = true
			tap_when_element_exists("* marked:'****1117'")
			
		  break
		 end
		 
		elsif(paymentCardType == "MasterCard")
		 if(cards.include? '****4444')
		  foundPaymentType = true
		  tap_when_element_exists("* marked:'****4444'")
		  
		  break
		 end
		 
		elsif(paymentCardType == "Visa")
		
		 if(cards.include? '2246')
		  foundPaymentType = true
		  tap_when_element_exists("* marked:'2246'")
		  break
		 elsif (cards.include? '1111')
		  foundPaymentType = true
		  tap_when_element_exists("* marked:'1111'")
		  break
		 elsif (cards.include? '9999')
		  foundPaymentType = true
		  tap_when_element_exists("* marked:'9999'")
		  break
		 end
		 
		elsif(paymentCardType == "AmericanExpress")
		 if(cards.include? '2006')
		  foundPaymentType = true
		  tap_when_element_exists("* marked:'2006'")
		  break
		 end
		 
		elsif(paymentCardType == "Paypal")
		 if(cards.include? 'Pay with PayPal')
		  foundPaymentType = true
		  tap_when_element_exists("* marked:'Pay with PayPal'")
		  break
		 end
		 
		elsif(paymentCardType == "PowerUp")
		 if(cards.include? '9904')
		  foundPaymentType = true
		  tap_when_element_exists("* marked:'9904'")
		  break
		 end
	    end
	
	  scroll_down
	  break if (!addCreditCardFound.empty?)
	end 
	
	if(foundPaymentType == false)
		fail("Payment Type '#{paymentCardType}' is not found.")
	end
end









