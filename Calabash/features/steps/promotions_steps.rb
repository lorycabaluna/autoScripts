class PromotionsInfo
	def initialize(testId,gcNumber,gcPin,powerUpCcNumber,powerUpCcPin,promoCode,promoCode2,promoCode3)
		@testId=testId
		@gcNumber=gcNumber
		@gcPin=gcPin
		@powerUpCcNumber=powerUpCcNumber
		@powerUpCcPin=powerUpCcPin
		@promoCode=promoCode
		@promoCode2=promoCode2
		@promoCode3=promoCode3
	end
	
	def testId
		@testId
	end
	
	def gcNumber
		@gcNumber
	end
	
	def gcPin
		@gcPin
	end
	
	def powerUpCcNumber
		@powerUpCcNumber
	end
	
	def powerUpCcPin
		@powerUpCcPin
	end
	
	def promoCode
		@promoCode
	end
	
	def promoCode2
		@promoCode2
	end
	
	def promoCode3
		@promoCode3
	end
	
	def self.getCSVData(tcId)
		CSV.foreach('SmokeTestData.csv') do |row|
		  break if row[0].nil?
		  
		  if(!row[0].nil? && row[0] != "TestID")
			 if(row[0]== tcId)
			    @testId=row[0]
				@gcNumber=row[19]
				@gcPin=row[20]
				@powerUpCcNumber=row[21]
				@powerUpCcPin=row[22]
				@promoCode=row[23]
				@promoCode2=row[36]
				@promoCode3=row[37]
			 end
		  end
		  
		end
		return new(@testId,@gcNumber,@gcPin,@powerUpCcNumber,@powerUpCcPin,@promoCode,@promoCode2,@promoCode3)
	end	
	
	
end

Then (/^I add Promotions using PowerUp Rewards$/) do 
	
	promotionsInfo = PromotionsInfo.getCSVData($currentTestId)
	
	if(promotionsInfo.testId.nil?)
		fail("No PowerUp data found using testId=#{$currentTestId}")
	end
	
	steps %Q{
		Then I click on Promo Code
		Then I enter Card Number "#{promotionsInfo.powerUpCcNumber}" PIN "#{promotionsInfo.powerUpCcPin}" into Power Up Rewards Trade Credit
		Then I click on Add Trade Credit
		Then I go back
	}
end

Then (/^I enter "([^\"]*)" into promo textfield$/) do |text|
  sleep(3)
  enter_text("* id:'txt_promo_code'", text)
  sleep(3)
end

Then (/^I click on promotions button$/) do
  steps %Q{
		Then I validate if it has pop-up screen message
  }
  
  if(!query("* id:'toolbar_title'").empty?)
  
	if(query("* marked:'CHECKOUT'").empty?)
		fail("\nNot in Checkout page, promotions button cannot be clicked.\n")
	else
		tap_when_element_exists("* id:'ll_discount_information'")
		sleep(3)
	end
	
  end
end

Then (/^I click on plus button$/) do
	sleep(3)
	tap_when_element_exists("* id:'img_icon_add_promo_code'")
	
	sleep(5)
	 steps %Q{
		Then I validate if it has pop-up screen message
	}
end 

Then (/^I add Promotions using promo code$/) do 

	promotionsInfo = PromotionsInfo.getCSVData($currentTestId)
	
	if(promotionsInfo.testId.nil?)
		fail("No promotions data found using testId=#{currentTestId}")
	end
	
	steps %Q{
		Then I click on promotions button
		Then I enter "#{promotionsInfo.promoCode}" into promo textfield
		Then I click on plus button
		Then I click back to go to checkout screen
		
	}
		#Then I scroll down
		#Then I see "Promo Saving" text
end

Then (/^I add Promotions using promo code "(PromoCode1|PromoCode2|PromoCode3)"$/) do | promoCode |
	print("\nEntering Promo Code '#{promoCode}'\n")
	promotionsInfo = PromotionsInfo.getCSVData($currentTestId)
	
	if(promotionsInfo.testId.nil?)
		fail("No promotions data found using testId=#{currentTestId}")
	end
	
	sleep(10)
	
	if(query("* marked:'PROMOTIONS'").empty?)
		steps %Q{
			Then I click on promotions button
		}
	end
	
	currentPromo = "none"
	
	if(promoCode == "PromoCode1")
		currentPromo = promotionsInfo.promoCode
		
	elsif (promoCode == "PromoCode2")
		currentPromo = promotionsInfo.promoCode2
	
	elsif (promoCode == "PromoCode3")
		currentPromo = promotionsInfo.promoCode3
	end
	
	scroll_down
	
	#Then I enter "#{currentPromo}" into promo textfield
	
	steps %Q{
		Then I enter Promo Code "#{currentPromo}"
		Then I click on plus button
		Then I validate if it has pop-up screen message
	}
	
end

Then (/^I check promo saving in checkout screen$/) do
		#Then I scroll down
		#Then I see "Promo Saving" text
		
	steps %Q{
		Then I click back to go to checkout screen
		}
		
	savingFound = 0
	
	while savingFound == 0 do
	   
	   if(!query("* {text CONTAINS[c] 'Promo Saving'}").empty?)
		savingFound = 1
	   else
		scroll_down
	   end
	end
	
end
	
Then (/^I add Promotions using GiftCard Number "([^"]*)" and PIN "([^"]*)"$/) do |gcNumber, gcPin|
	steps %Q{
		Then I click on Promo Code
		Then I enter GiftCard Number "#{gcNumber}" and PIN "#{gcPin}"
		Then I click on Add GiftCard
	}
end

Then (/^I check Promotions screen$/) do 
	sleep(2)
	
	steps %Q{
			Then I click on Promo Code
			Then I should see the "Promo Code" text
		}
		
		title = query("* id:'txt_title'")
		if(title.empty?)
			fail("No promo displayed.")
		else
			promoDescrip = query("* id:'txt_description'")
			print("\nPromo Title:#{title[0]["text"]}\n")
			print("\nPromo Description:#{promoDescrip[0]["text"]}\n")
		end
end

Then (/^I add Promotions using GiftCard$/) do 
	#print("Promotion Current TestID: #{$currentTestId}")
    
	promotionsInfo = PromotionsInfo.getCSVData($currentTestId)
	
	if(promotionsInfo.testId.nil?)
		fail("No promotions data found using testId=#{$currentTestId}")
	end
	
	steps %Q{
		Then I click on Promo Code
		Then I enter GiftCard Number "#{promotionsInfo.gcNumber}" and PIN "#{promotionsInfo.gcPin}"
		Then I click on Add GiftCard
		Then I verify if pop-up billing address is shown in New Shipping Address
	}
	
	sleep(5)
	
	steps %Q{
		Then I go back
	}
	
	
end

Then (/^I enter Promotions GiftCard Number "([^"]*)" and PIN "([^"]*)"$/) do |gcNumber, gcPin|
	print("\nTrying to add GiftCard Number '#{gcNumber}' with PIN '#{gcPin}'...\n")
	wait_for_text("Gift Cards/Trade Cards",:timeout_message => "\nGift Card Text box not found.\n",:timeout => 20)
	scroll_down
	
	enter_text("* id:'txt_gift_card'",gcNumber)
	enter_text("* id:'txt_gift_card_pin'",gcPin)
	
	sleep(3)
	tap_when_element_exists("* id:'img_icon_add_gift_card'")
	sleep(3)
end

Then (/^I enter GiftCard Number "([^"]*)" and PIN "([^"]*)"$/) do |gcNumber, gcPin|
	print("\nTrying to add GiftCard Number '#{gcNumber}' with PIN '#{gcPin}'...\n")
	wait_for_text("Gift Cards/Trade Cards",:timeout_message => "\nGift Card Text box not found.\n",:timeout => 20)
	scroll_down
	
	enter_text("* id:'txt_gift_card'",gcNumber)
	enter_text("* id:'txt_gift_card_pin'",gcPin)
end

Then (/^I enter Promotions Power Up Rewards Trade Credit Card Number "([^\"]*)" and PIN "([^\"]*)"$/) do | cardNumber, cardPin |
	sleep(3)
	tap_when_element_exists("* id:'img_discount_info_disclosure'")
	scroll_down
	
	sleep(3)
	enter_text("* id:'txt_trade_credit'",cardNumber)
	enter_text("* id:'txt_trade_credit_pin'",cardPin)
	
	sleep(3)
	tap_when_element_exists("* id:'img_icon_add_trade_credit'")
	sleep(3)
end

Then (/^I enter Card Number "([^\"]*)" PIN "([^\"]*)" into Power Up Rewards Trade Credit$/) do | cardNumber, cardPin |
	
	wait_for_text("Gift Cards/Trade Cards",:timeout_message => "\nPower Up Reward Text box not found.\n",:timeout => 20)
	scroll_down
	
	enter_text("* id:'txt_trade_credit'",cardNumber)
	enter_text("* id:'txt_trade_credit_pin'",cardPin)
	
end

Then (/^I enter Promotions Promo Code "([^\"]*)"$/) do | promoCode |
	wait_for_text("Gift Cards/Trade Cards",:timeout_message => "\nPromo Code Text box not found.\n",:timeout => 20)
	scroll_down
	
	sleep(3)
	enter_text("* id:'txt_promo_code'",promoCode)
	
	sleep(3)
	tap_when_element_exists("* id:'img_icon_add_promo_code'")
	sleep(3)
end

Then (/^I enter Promo Code "([^\"]*)"$/) do | promoCode |
    print("\nEntering promo code:#{promoCode}\n")
	wait_for_text("Gift Cards/Trade Cards",:timeout_message => "\nPromo Code Text box not found.\n",:timeout => 20)
	scroll_down
	enter_text("* id:'txt_promo_code'",promoCode)
end

Then(/^I click on Add GiftCard$/) do
	sleep(3)
	tap_when_element_exists("* id:'img_icon_add_gift_card'")
	sleep(3)
end

Then(/^I click on Add Trade Credit$/) do
	sleep(3)
	tap_when_element_exists("* id:'img_icon_add_trade_credit'")
	sleep(3)
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
end

Then(/^I click on Add Promo Code$/) do
	sleep(3)
	tap_when_element_exists("* id:'img_icon_add_promo_code'")
	sleep(10)
	
	steps %Q{
		Then I validate if it has pop-up screen message
	}
end