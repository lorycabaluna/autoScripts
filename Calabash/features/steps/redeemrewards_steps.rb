require 'spreadsheet' 
require 'csv'

class PurShipping
	  
	  def initialize(purAdd1,purAdd2,purZip,purCity,purState,couponToRedeem,merchToRedeem,digitalToRedeem,sweepToRedeem)
		@purAdd1 = purAdd1
		@purAdd2 = purAdd2
		@purCity = purCity
		@purState = purState
		@purZip = purZip
		@couponToRedeem = couponToRedeem
		@digitalToRedeem = digitalToRedeem
		@merchToRedeem = merchToRedeem
		@sweepToRedeem = sweepToRedeem
		
	  end
	  
	  def couponToRedeem
		@couponToRedeem
	  end
	  
	  def digitalToRedeem
		@digitalToRedeem
	  end
	  
	  def merchToRedeem
		@merchToRedeem
	  end
	  
	  def sweepToRedeem
		@sweepToRedeem
	  end
	  
	  def purAdd1
		@purAdd1
	  end
	  
	  def purAdd2
		@purAdd2
	  end
	  
	  def purCity
		@purCity
	  end
	  
	  def purState
		@purState
	  end
	  
	  def purZip
		@purZip
	  end
	  
	  def self.getCSVData(testId)
		CSV.foreach('SmokeTestData.csv') do |row|
		  break if row[0].nil?
		  
		  if(!row[0].nil? && row[0] != "TestID")
			 if(row[0]== testId)
				@purAdd1 = row[38]
				@purAdd2 = row[39]
				@purZip = row[40]
				@purCity = row[41]				
				@purState = row[42]
				@couponToRedeem = row[43]
				@merchToRedeem = row[44]
				@digitalToRedeem = row[45]
				@sweepToRedeem = row[46]
			 end
		  end
		  
		end
		return new(@purAdd1,@purAdd2,@purZip,@purCity,@purState,@couponToRedeem,@merchToRedeem,@digitalToRedeem,@sweepToRedeem)
	end	
end

Then (/^I Redeem Rewards "(Certificates|MERCH|Digital Currency|Sweepstakes)"$/) do |reward| 
	print("\nRedeem Rewards...\n")
	sleep(5)
	
	redeemReward = query("* marked:'Rewards Center'")
	
	
	if(redeemReward.empty?)
		fail("\nRedeem Rewards not in the screen.\n")
	else
		tap_when_element_exists("* marked:'Rewards Center'")
		sleep(3)
		
		availablePoints = query("* id:'rewardscatalog_pointstextview'")
		
		if(!availablePoints.empty?)
			print("Available Points: #{availablePoints[0]["text"]}")
			
		if(reward == "Certificates")
			wait_for_text("Certificates",:timeout=> 30,:retry_frequency => 10,:timeout_message => "\nCERTIFICATES not found in the screen.\n")
		elsif(reward == "MERCH")
			wait_for_text("MERCH",:timeout=> 30,:retry_frequency => 10,:timeout_message => "\nMERCH not found in the screen.\n")
		elsif(reward == "Digital Currency")
			wait_for_text("Digital Currency",:timeout=> 30,:retry_frequency => 10,:timeout_message => "\nDIGITAL CURRENCY not found in the screen.\n")
		elsif(reward == "Sweepstakes")
			wait_for_text("Sweepstakes",:timeout=> 30,:retry_frequency => 10,:timeout_message => "\nSWEEPSTAKES not found in the screen.\n")
			#tap_when_element_exists("* marked:'#{redeemList[0]["text"]}'")
		end
			
			 
			steps %Q{
				Then I pick first item from rewards "#{reward}"
			}
			 
		end
	end
	
	
end

Then (/^I pick first item from rewards "(Certificates|MERCH|Digital Currency|Sweepstakes)"$/) do |reward| 
	tap_when_element_exists("* marked:'#{reward}'")
	
	sleep(3)
	redeemList = query("* id:'rewardscatalog_listitem_titletextview'")
	
	if(redeemList.empty?)
		print("\nNo #{reward} Rewards to be redeemed.\n")
	else
	
		users = User.getCSVData($currentTestId)
		
		purShip = PurShipping.getCSVData($currentTestId)
		
		if(reward == "Certificates")
			tap_when_element_exists("* marked:'#{purShip.couponToRedeem}'")
		elsif(reward == "MERCH")
			tap_when_element_exists("* marked:'#{purShip.merchToRedeem}'")
		elsif(reward == "Digital Currency")
			tap_when_element_exists("* marked:'#{purShip.digitalToRedeem}'")
		elsif(reward == "Sweepstakes")
			tap_when_element_exists("* marked:'#{purShip.sweepToRedeem}'")
			#tap_when_element_exists("* marked:'#{redeemList[0]["text"]}'")
		end
		
		steps %Q{
			Then I get reward "#{reward}"
		}
		
	end
end

Then (/^I get reward "(Certificates|MERCH|Digital Currency|Sweepstakes)"$/) do |reward| 
	sleep(3)
	getIt = query("* id:'reward_placeordertextview'")
	
	if(getIt.empty?)
		fail("\nGet It Now button is not displayed.\n")
	else
		tap_when_element_exists("* id:'reward_placeordertextview'")
		
		steps %Q{
			Then I Place order of my redeem reward
		}
	end
end

Then (/^I set shipping address for reward "(Certificates|MERCH|Digital Currency|Sweepstakes)"$/) do |reward| 
	sleep(3)
	users = User.getCSVData($currentTestId)
	
	purShip = PurShipping.getCSVData($currentTestId)
	
	if(purShip.purAdd1.nil?)
		fail("\nFailed Test Id provided not found in SmokeTestData.csv\n")
	end
	
	if(reward == "Certificates")
		enter_text("android.widget.EditText id:'rewardship_email_edittext'","#{users.username}")
		press_user_action_button
		
	elsif(reward == "MERCH")
		enter_text("android.widget.EditText id:'rewardship_email_edittext'","#{users.username}")
		press_user_action_button
		
		enter_text("android.widget.EditText id:'rewardship_addresslineone_edittext'","#{purShip.purAdd1}")
		press_user_action_button
		
		enter_text("android.widget.EditText id:'rewardship_addresslinetwo_edittext'","#{purShip.purAdd2}")
		press_user_action_button
		
		enter_text("android.widget.EditText id:'rewardship_zippostalcode_edittext'","#{purShip.purZip}")
		press_user_action_button
		
		enter_text("android.widget.EditText id:'rewardship_city_edittext'","#{purShip.purCity}")
		press_user_action_button
		
		enter_text("android.widget.EditText id:'rewardship_state_edittext'","#{purShip.purState}")
		press_user_action_button
		
	elsif(reward == "DIGITAL CURRENCY")
		enter_text("android.widget.EditText id:'rewardship_email_edittext'","#{users.username}")
		press_user_action_button
		
	elsif(reward == "SWEEPSTAKES")
		enter_text("android.widget.EditText id:'rewardship_email_edittext'","#{users.username}")
		press_user_action_button
	end
	
	sleep(5)
	tap_when_element_exists("* marked:'CONTINUE'")
		
	
	
end

Then (/^I Place order of my redeem reward$/) do  

	wait_for_text("PLACE YOUR ORDER",:timeout=> 30,:retry_frequency => 10,:timeout_message => "\nPLACE YOUR ORDER not found in the screen.\n")
	
	tap_when_element_exists("* marked:'PLACE YOUR ORDER'")
	
	wait_for_text("Confirmation Number",:timeout=> 30,:retry_frequency => 10,:timeout_message => "\nConfirmation Number not found in the screen.\n")
	
	confirmNumber = query("* id:'rewardconfirmation_confirmationnumber_textview'")
	
	if(!confirmNumber.empty?)
		print("\nConfirmation Number: #{confirmNumber[0]["text"]}\n")
	else
		fail("\nNo Confirmation Number displayed.\n")
	end
end