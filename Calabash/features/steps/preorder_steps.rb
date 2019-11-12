Then (/^I verify PreOrders$/) do

	if(query("* id:'drawer_bottomview_preorderstextview'").empty?)
		fail("\nNo Pre Orders link.\n")
	else
		tutorial = query("* id:'tutorial_ximageview'")
		
		if(!tutorial.empty?)
			pan_left
		end
		
		tap_when_element_exists("* id:'drawer_bottomview_preorderstextview'")
		
		tutorial = query("* id:'tutorial_ximageview'")
		
		if(!tutorial.empty?)
			pan_left
		end
		
		
	end
	steps %Q{
		Then I get preOrders count
		Then I select first item from PreOrders
		Then I see my preOrder balance
	}
end

Then (/^I get preOrders count$/) do
	sleep(10)
	if(query("* id:'toolbar_title'").empty?)
		fail("\nNot in Pre Orders Page.\n")
	else
		tutorial = query("* id:'tutorial_ximageview'")
		
		if(!tutorial.empty?)
			pan_left
		end
		
		pageTitle = query("* id:'toolbar_title'")
		
		if(pageTitle[0]["text"] != "PRE-ORDERS")
			fail("\nNot in Pre-Orders Page.\n")
		end
	end
	
	preOrders = query("* id:'results'",:getText).first
	
	if(preOrders.length > 0)
		preOrderCount = preOrders.gsub(/ pre-orders/,"")
		
		print("\nPre Order Count:#{preOrderCount}\n")
	else
		print("\n No Pre-Orders.\n")
	end
	
end

Then (/^I select first item from PreOrders$/) do
	emptyPreOrder = query("* id:'listheader_empty_textview'")
	
	if(!emptyPreOrder.empty?)
		print("\n#{emptyPreOrder[0]["text"]}\n")
	else
		orders = query("* id:'preorder_root'")
		
		if(orders.count > 0)
			tap_when_element_exists("* id:'preorder_root' index:1")
		else
			print("\n No Pre-Orders.\n")
		end
	end
end

Then (/^I see my preOrder balance$/) do
	sleep(3)
	preOrderBal = query("* id:'balance_due'")
	
	if(!preOrderBal.empty?)
		print("\n#{preOrderBal[0]["text"]}.\n")
	else
		print("\nNo balance to display.\n")
	end
	
end 
