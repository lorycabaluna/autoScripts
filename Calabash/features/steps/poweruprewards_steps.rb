Then (/^I verify Account Info Details$/) do
	print("\nVerifying Account Details...\n")
	sleep(5)
	steps %Q{
		Then I press ellipsis button
		Then I validate if tutorial device pop-up is visible
		Then I wait for "POWERUP REWARDS" in main screen
		Then I verify PowerUp Rewards
		Then I verify Lifetime Points
	}
end

Then (/^I verify Lifetime Points$/) do
	print("\nVerifying Lifetime Points...\n")
	sleep(5)
	steps %Q{
		Then I touch the "Lifetime Points" text
		Then I wait for "ACCOUNT" in main screen
		Then I should see account username
		Then I should see account point balance
		Then I should see account lifetime points
		Then I should see account login and contact details
		Then I should see account rewards id
		Then I should see account tier
		Then I should see account expiration date
		Then I see "To edit this information, please visit GameStop.com" text
	}
end

Then (/^I verify PowerUp Rewards$/) do
	print("\nVerifying Power Up Rewards Section...\n")
	
	wait_for_text("POWERUP REWARDS",:timeout_message => "\nPower Up Rewards link not found on screen.\n",:timeout => 20)
	
	steps %Q{
		Then I touch the "POWERUP REWARDS" text
		Then I see "POWERUP REWARDS" text
		Then I swipe left
		Then Pro points is
		Then Lifetime points is
		Then I see "Member Activity" text
		Then I see "Redeem Rewards" text
		Then I see "Card Details" text
		Then I see "LEARN MORE" text
		Then I see "VIEW LATEST" text
	}
end

Then (/^I verify PowerUp Rewards as "(NonPUR|PUR)"$/) do |purType|

	print("\nVerifying Power Up Rewards Section as #{purType}...\n")
    sleep(3)
	
	if(purType == "NonPUR")
		havePur = query("* id:'drawer_bottomview_nonpur_rewardstextview'")
		purId = "drawer_bottomview_nonpur_rewardstextview"
	end
	
	if(purType == "PUR")
		havePur = query("* id:'drawer_bottomview_rewardstextview'")
		purId = "drawer_bottomview_rewardstextview"
	end
	
	if(havePur.empty?)
		fail("\nPower Up Rewards is not on screen display.\n")
	else
		steps %Q{
			Then I validate if tutorial device pop-up is visible
		}
		 
		tap_when_element_exists("* id:'#{purId}'")
		
		wait_for(timeout: 20,timeout_message: "Invalid Page, Not in Power Up Rewards page.") do
			element_exists("* id:'toolbar_title'")
		end

		#tutorial = query("* id:'tutorial_ximageview'")
		
		#if(!tutorial.empty?)
		#	pan_left
		#end
		
		steps %Q{
			Then I validate if tutorial device pop-up is visible
		}
		
		pageTitle = query("* id:'toolbar_title'")
		
		if(pageTitle[0]["text"] != "POWERUP REWARDS")
			fail("\nInvalid Page, Not in Power Up Rewards page.\n")
		end
	end
	
	if(purType == "PUR")
	steps %Q{
		Then Pro points is
		Then Lifetime points is
		Then I see "Member Activity" text
		Then I see "Rewards Center" text
		Then I see "Card Details" text
		Then I see "LEARN MORE" text
		Then I see "VIEW LATEST" text
	}
	elsif (purType == "NonPUR")
	steps %Q{
		Then I see "ACTIVATE MEMBERSHIP" text
	}
	end
end
Then (/^I verify Membership Card Details$/) do
	print("\nVerifying Membership Card Details...\n")
    sleep(3)
	steps %Q{
	    Then I touch the "Card Details" text
	}
	
	sleep(3)
	wallet = query("* id:'save_to_wallet'")
	
	if(wallet.count > 0)
		print("\nSave to Android Pay is displayed.\n")
	else
		fail("\nSave to Android Pay, is not displayed.\n")
	end
	
end

Then (/^I click "([^\"]*)" text$/) do
	sleep(3)
	tap_when_element_exists("* id:'drawer_bottomview_rewardstextview'")
	sleep(5)
end

Then (/^Pro points is$/) do
   sleep(1)
   proPoints = query("* id:'rewards_purmain_pointstextview'",:getText).first
   print("\nPro points is: #{proPoints}\n")
end

Then (/^Lifetime points is$/) do
   sleep(1)
   lifetimePoints = query("* id:'rewards_purmain_lifetimepointstextview'",:getText).first
   print("\nLifetime points is: #{lifetimePoints}\n")
end

Then (/^I should see account username$/) do
	sleep(3)
	userName = query("* id:'accountdetails_nametextview'",:getText).first
	if (userName.to_s.strip.length == 0)
		fail("Empty username.")
	else
		print("\nUsername: #{userName}\n")
	end
	sleep(3)
end

Then (/^I should see account addressline one$/) do
	addressOne = query("* id:'accountdetails_addressline1textview'",:getText).first
	if (addressOne.to_s.strip.length == 0)
		fail("Empty Address line 1.")
	else
		print("\nAddress line 1: #{addressOne}\n")
	end
	sleep(3)
end

Then (/^I should see account addressline two$/) do
	addressTwo = query("* id:'accountdetails_addressline2textview'",:getText).first
	if (addressTwo.to_s.strip.length == 0)
		fail("Empty Address line 2.")
	else
		print("\nAddress line 2: #{addressTwo}\n")
	end
	sleep(3)
end

Then (/^I should see account phone number$/) do
	phoneNumber = query("* id:'accountdetails_phonetextview'",:getText).first
	if (phoneNumber.to_s.strip.length == 0)
		fail("Empty Phone number.")
	else
		print("\nPhone number: #{phoneNumber}\n")
	end
	sleep(3)
end

Then (/^I should see account point balance$/) do
	pointBalance = query("* id:'accountdetails_pointstextview'",:getText).first
	if (pointBalance.to_s.strip.length == 0)
		fail("Empty Point balance.")
	else
		print("\nPoint Balance: #{pointBalance}\n")
	end
	sleep(3)
end

Then (/^I should see account lifetime points$/) do
	accLifetimePoints = query("* id:'accountdetails_lifetimepointstextview'",:getText).first
	if (accLifetimePoints.to_s.strip.length == 0)
		fail("Empty account Lifetime points.")
	else
		print("\nLifetime points: #{accLifetimePoints}\n")
	end
	sleep(3)
end

Then (/^I should see account login and contact details$/) do
	loginContact = query("* id:'accountdetails_logincontacttextview'",:getText).first
	if (loginContact.to_s.strip.length == 0)
		fail("Empty login and contact details.")
	else
		print("\nLogin/contact details: #{loginContact}\n")
	end
	sleep(3)
end

Then (/^I should see account rewards id$/) do
	rewardsId = query("* id:'accountdetails_idtextview'",:getText).first
	if (rewardsId.to_s.strip.length == 0)
		fail("Empty rewards id.")
	else
		print("\nRewards Id: #{rewardsId}\n")
	end
	sleep(3)
end

Then (/^I should see account tier$/) do
	tier = query("* id:'accountdetails_tiertextview'",:getText).first
	if (tier.to_s.strip.length == 0)
		fail("Empty rewards id.")
	else
		print("\nTier: #{tier}\n")
	end
	sleep(3)
end

Then (/^I should see account expiration date$/) do
	expiryDate = query("* id:'accountdetails_expirationdatetextview'",:getText).first
	if (expiryDate.to_s.strip.length == 0)
		fail("Empty Expiry Date.")
	else
		print("\nExpiry Date: #{expiryDate}\n")
	end
	sleep(3)
end








