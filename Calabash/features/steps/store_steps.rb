class StoreInfo
	def initialize (testId,storeZip,storeAddress,paymentCardType)
		@testId  = testId
		@storeZip = storeZip
		@storeAddress = storeAddress
		@paymentCardType = paymentCardType
	end
	
	def testId
		@testId
	end
	
	def storeZip
		@storeZip
	end
	
	def storeAddress
		@storeAddress
	end
	
	def paymentCardType
		@paymentCardType
	end
	
	def self.getCSVData(tcId)
		CSV.foreach('C:\Users\c101433\Desktop\ECOM\GS APK\New Releases\SmokeTestData.csv') do |row|
		  break if row[0].nil?
		  
		  if(!row[0].nil? && row[0] != "TestID")
			 if(row[0]== tcId)
			    @testId = row[0]
				@storeZip = row[6].to_i
				@storeAddress = row[34]
				@paymentCardType = row[35]
			 end
		  end
		  
		end
		return new(@testId,@storeZip,@storeAddress,@paymentCardType)
	end	
	
end

Then (/^I find store and set as Home Store$/) do 
	storeInfo = StoreInfo.getCSVData($currentTestId)
	
	if(storeInfo.storeZip.nil?)
		fail("Failed: No Store Zip code provided in the Test Data.csv")
	end
	
	steps %Q{
		Then I tap find store
		Then I enter "#{storeInfo.storeZip}" into zip code address bar text
		Then I tap list store
		Then I select the first item from store list result
		Then I set Home Store for the selected location
	}

end

Then (/^I tap find store$/) do
	sleep(3)
	tap_when_element_exists("* id:'action_stores'")
end

Then (/^I tap list store$/) do
	sleep(10)
	tap_when_element_exists("* id:'actionlayout_search_stores_listmaptextview'")
end

Then (/^I search store with zip "([^\"]*)" then select "(HoldNew|HoldPreOwned|FirstItem)"$/) do |zipCode,selectType|
	sleep(10)
	enter_text("* id:'actionlayout_search_stores_edittext'", zipCode)
	press_user_action_button
	
	sleep(20)
	if(selectType=="FirstItem")
		
		firstItem = query("* id:'stores_listitem_title_textview'")
		if(firstItem.empty?)
			fail("No item to be selected.")
		else
			tap_when_element_exists("* id:'#{firstItem[0]["id"]}'")
		end
	elsif (selectType=="HoldPreOwned" || selectType=="HoldNew")
		steps %Q{
			Then I look for item with Hold New or Hold PreOwned
		}
		
		sleep(3)
		tap_when_element_exists("* {text CONTAINS[c] 'CONTINUE'}")
	end
	
end
Then (/^I continue to finish HOPS$/) do 
	
	sleep(5)
	tap_when_element_exists("* {text CONTAINS[c] 'FINISH'}")
	
end

Then (/^I enter "([^\"]*)" into zip code address bar text$/) do |text|
  sleep(20)
  enter_text("* id:'actionlayout_search_stores_edittext'", text)
  press_user_action_button
end

Then (/^I select the first item from store list result$/) do
	sleep(20)
	firstItem = query("* id:'stores_listitem_title_textview'")
	if(firstItem.empty?)
		fail("No item to be selected.")
	else
		tap_when_element_exists("* id:'#{firstItem[0]["id"]}'")
	end
	sleep(5)
end

Then (/^I set Home Store for the selected location$/) do
  sleep(5)
  homeStore = query("* id:'store_detail_setashomestoretextview'")
  if(homeStore.empty?)
	fail("Set As Home Store not found.")
  else
	tap_when_element_exists("* id:'store_detail_setashomestoretextview'")
	print("\nHome Store is set\n")
  end
  sleep(10)
end

Then (/^I select Hold New or Hold PreOwned$/) do
	sleep(5)
	holdNew = query("* id:'stores_listitem_new_textview'")
	holdPreOwned = query("* id:'stores_listitem_preowned_textview'")
	
	if(holdNew.empty? && holdPreOwned.empty?)
		fail("No item to be on hold.")
	else
		if(!holdNew.empty?)
			tap_when_element_exists("* id:'#{holdNew[0]["id"]}'")
		elsif (holdNew.empty? && !holdPreOwned.empty?)
			tap_when_element_exists("* id:'#{holdPreOwned[0]["id"]}'")
		end
		
	end
	sleep(5)
end

Then (/^I look for item with Hold New or Hold PreOwned$/) do
	sleep(10)
	#query list
	resultList = query("* id:'stores_listitem_title_textview'")
	
	if(resultList.empty?)
		fail("\nUnable to retrieve store list item.\n")
	end
	
	foundHold = false
	#Loop thru item list
	loopStart = 0
	listCount = resultList.count-1
	while loopStart <=  listCount 
		if(resultList[loopStart]["id"].to_s.strip.length > 0)
			#Click item
			#tap_when_element_exists("* id:'#{resultList[loopStart]["id"]}'")
			tap_when_element_exists("* {text CONTAINS[c] '#{resultList[loopStart]["text"]}'}")
			
			#Look if Hold New or Hold PreOwned
			holdNew = query("* id:'storeavailability_listitem_holdnewtextview'")
			holdPreOwned = query("* id:'storeavailability_listitem_holdpreownedtextview'")
			
			if(!holdNew.empty?)
				foundHold = true
				tap_when_element_exists("* id:'#{holdNew[0]["id"]}'")
				break
			elsif (holdNew.empty? && !holdPreOwned.empty?)
				foundHold = true
				tap_when_element_exists("* id:'#{holdPreOwned[0]["id"]}'")
				break
			end
			
		end
		loopStart+=1
		if(loopStart == 6)
			scroll_down
		end
	end
	
	if (foundHold == false)
		scroll_down
		
		resultList = query("* id:'stores_listitem_title_textview'")
		foundHold = false
		#Loop thru item list
		loopStart = 0
		listCount = resultList.count-1
		while loopStart <=  listCount 
			if(resultList[loopStart]["id"].to_s.strip.length > 0)
				#Click item
				#tap_when_element_exists("* id: '#{resultList[loopStart]["id"]}'")
				tap_when_element_exists("* {text CONTAINS[c] '#{resultList[loopStart]["text"]}'}")
				
				#Look if Hold New or Hold PreOwned
				holdNew = query("* id:'storeavailability_listitem_holdnewtextview'")
				holdPreOwned = query("* id:'storeavailability_listitem_holdpreownedtextview'")
				
				if(!holdNew.empty?)
					foundHold = true
					tap_when_element_exists("* id:'#{holdNew[0]["id"]}'")
				elsif (holdNew.empty? && !holdPreOwned.empty?)
					foundHold = true
					tap_when_element_exists("* id:'#{holdPreOwned[0]["id"]}'")
				end
				
			end
			loopStart += 1
			
			if(loopStart == 6)
				scroll_down
			end
			
		end
	end
	
	if (foundHold == false)
		fail("No available for Hold New or Hold PreOwned from the result.")
	end
	
	foundHold = false
	sleep(5)
end

