Then (/^I verify Saved Trades as "(NonPUR|PUR)"$/) do |purType|
	print("\nVerifying Saved Trades Section...\n")
	sleep(5)
	
	if(purType == "NonPUR")
		havePur = query("* id:'drawer_bottomview_nonpur_savedtradestextview'")
		purId = "drawer_bottomview_nonpur_savedtradestextview"
	end
	
	if(purType == "PUR")
		havePur = query("* id:'drawer_bottomview_savedtradestextview'")
		purId = "drawer_bottomview_savedtradestextview"
	end
	
	if(havePur.empty?)
		fail("\nNo Saved Trades link.\n")
	else
		steps %Q{
			Then I validate if tutorial device pop-up is visible
		}
		
		tap_when_element_exists("* id:'#{purId}'")
		
		steps %Q{
			Then I validate if tutorial device pop-up is visible
		}
		
	end
	
	steps %Q{
		Then I see credit total value
		Then I see cash total value
		Then I see saved trade list items header
	}
end

Then (/^I see credit total value$/) do
 sleep(10)
 credittv = query("* id:'savedtrades_credittotalvalue'",:getText)
 
 if(credittv.length >0)
	print("\nCredit Total Value:#{credittv}\n")
 else
	print("\nNo Credit Total Value.\n")
 end
end

Then (/^I see cash total value$/) do
 cashtv = query("* id:'savedtrades_cashtotalvalue'",:getText)
 
 if(cashtv.length >0)
	print("\nCash Total Value:#{cashtv}\n")
 else
	print("\nNo Cash Total Value.\n")
 end
end

Then (/^I see saved trade list items header$/) do
	sleep(5)
	
	if(query("* id:'toolbar_title'").empty?)
		fail("\nNot in Saved Trades Page.\n")
	else
		steps %Q{
			Then I validate if tutorial device pop-up is visible
		}
		
		pageTitle = query("* id:'toolbar_title'")
		
		if(pageTitle[0]["text"] != "SAVED TRADES")
			fail("\nNot in Saved Trades Page.\n")
		end
	end
	
	lstHeaders = query("* id:'savedtrade_listitem_headertextview'")
	
	if(lstHeaders.count > 0)
		i = 0
		num = lstHeaders.count

		while i < num  do
			print("\n#{lstHeaders[i]["text"]}\n" )
		    i+=1
		end
		
		# for i in 0..lstHeaders.count
		   # print "#{lstHeaders[i]}"
		# end
	else
		print("\nNo Saved Trades to display.\n")
	end
end


