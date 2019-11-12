
Then (/^I View Messages as Guest$/) do
	steps %Q{
		Then I click on Messages Menu as Guest
		Then I select first item from messages
		Then I go back
		Then I click on edit link
		Then I tap Select All messages
		Then I tap DeSelect All messages
		Then I select first item from messages
		Then I tap Delete message
	}
end

Then (/^I View Messages as Auth$/) do
	steps %Q{
		Then I scroll up
		Then I click on Messages Menu as Auth
		Then I select first item from messages
		Then I go back
		Then I click on edit link
		Then I tap Select All messages
		Then I tap DeSelect All messages
		Then I select first item from messages
		Then I tap Delete message
	}
end

Then (/^I click on Messages Menu as Auth$/) do
	tap_when_element_exists("* id:'dashboard_top_message_imageview'")
end

Then (/^I click on Messages Menu as Guest$/) do
	tap_when_element_exists("* id:'drawer_bottomview_nonpur_messagestextview'")
end

Then (/^I select first item from messages$/) do
	sleep(10)
	msgs = query("* id:'view_message_listitem_titletextview'")
	
	if(msgs.count >0)
		tap_when_element_exists("* id:'#{msgs[0]["id"]}'")
	else
		fail("\nNo Messages found.\n")
	end
	#tap_when_element_exists("android.widget.CheckBox index:1")
	#tap_when_element_exists("android.widget.RelativeLayout index:4")
	sleep(5)
end

Then (/^I click on edit link$/) do
	sleep(5)
	tap_when_element_exists("* id:'action_edit'")
end

Then (/^I tap Select All messages$/) do
	sleep(5)
	tap_when_element_exists("* {text CONTAINS[c] 'SELECT ALL'}")
end

Then (/^I tap DeSelect All messages$/) do
	sleep(5)
	tap_when_element_exists("* {text CONTAINS[c] 'DESELECT ALL'}")
end

Then (/^I tap Delete message$/) do
	sleep(5)
	tap_when_element_exists("* {text CONTAINS[c] 'DELETE'}")
	print("\nMessage Deleted.\n")
end
