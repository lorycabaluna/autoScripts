class PaypalInformation
	def initialize(testId,paypalUser,paypalPassword)
	
		@testId = testId
		@paypalUser = paypalUser
		@paypalPassword = paypalPassword
		
	end
	
	def testId
		@testId
	end
	
	def paypalUser
		@paypalUser
	end
	
	def paypalPassword
		@paypalPassword
	end

	def self.getCSVData(tcId)
		CSV.foreach('SmokeTestData.csv') do |row|
		  break if row[0].nil?
		  
		  if(!row[0].nil? && row[0] != "TestID")
			 if(row[0]== tcId)
			    @testId=row[0]
				@paypalUser=row[24]
				@paypalPassword=row[25]
			 end
		  end
		  
		end
		return new(@testId,@paypalUser,@paypalPassword)
	end	
end

		
		
Then (/^I set payment as Paypal$/) do
	steps %Q{
		Then I click on Payment
		Then I choose "Pay with PayPal" as payment option
		Then I click on Promo Code
		Then GiftCard disclaimer should be displayed
		Then Trade Credit disclaimer should be displayed
		Then I navigate back
		Then I click on place order button
		Then I pay with Paypal
		
	}
end		

Then (/^I pay with Paypal$/) do
	sleep(5)
	tap_when_element_exists("* android.widget.ImageView contentDescription:'PayPal'")
	
	paypalInformation = PaypalInformation.getCSVData($currentTestId)
	
	if(paypalInformation.testId.nil?)
		fail("No paypal information found in csv using testid='#{$currentTestId}'")
	end
	
	steps %Q{
		Then I enter "#{paypalInformation.paypalUser}" as paypal username
		Then I enter "#{paypalInformation.paypalPassword}" as paypal password
		Then I click on Login to paypal
		
	}
	
	sleep(10)
	steps %Q{
		Then I click on pay to confirm paypal
		Then I should see confirmation number
	}
end

Then (/^I enter "([^\"]*)" as paypal username$/) do |txtUser|
	sleep(2)
    clear_text_in("android.widget.EditText contentDescription:'Email'")
	enter_text("android.widget.EditText contentDescription:'Email'",txtUser)
	#enter_text("android.widget.EditText index:0",'bf_gsdc11@qagsecomprod.oib.com')
end

Then (/^I enter "([^\"]*)" as paypal password$/) do |txtPassword|
	sleep(2)
	clear_text_in("android.widget.EditText contentDescription:'Password'")
	enter_text("android.widget.EditText contentDescription:'Password'",txtPassword)
	#enter_text("android.widget.EditText index:1",'T3sting!@#')
end

Then (/^I click on Login to paypal$/) do 
	tap_when_element_exists("android.widget.TextView text:'Log In'")
	sleep(5)
end

Then (/^I click on pay to confirm paypal$/) do 
	wait_for_text("Confirm",:timeout => 20,:timeou_message => "\nNot able to confirm paypal account.\n")
	tap_when_element_exists("android.widget.TextView text:'Pay'")
end

Then (/^GiftCard disclaimer should be displayed$/) do 
	sleep(3)
	gift = query("* id:'giftCard_paypal_disclaimer'",:getText).first
	
	if(gift.empty?)
		fail("Gift disclaimer is not displayed.")
	end
end

Then (/^Trade Credit disclaimer should be displayed$/) do 
	sleep(2)
	gift = query("* id:'tradeCredit_paypal_disclaimer'",:getText).first
	
	if(gift.empty?)
		fail("Trade Credit disclaimer is not displayed.")
	end
end







