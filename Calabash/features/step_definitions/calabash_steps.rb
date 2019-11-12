Then (/^I check if alert notification appears$/) do
  sleep(2)
  if query("android.widget.TextView {text LIKE[c] 'Notifications'}").empty?
	print "No alert display."
  else
  tap_when_element_exists("* id:'button2'")
    
  end
  
end

Then /^I navigate back$/ do
  press_back_button
end


Then (/^I should see "([^\"]*)" button is disabled$/) do |text_name|
   sleep(1)
   actualValue = query("* id:'#{id_value}'",:getText).first
   
   if (actualValue.include? text_value)
    print("\n'#{text_name}:#{text_value}' is found in screen.\n")
   else
	fail("Expected value:'#{text_name}:#{text_value} but the value shown is: #{actualValue}'")
   end
end

Then (/^I should see back button$/) do 
   sleep(1)
   if element_exists("android.widget.ImageButton index:0")
    print("\nCancel navigation is found in screen.\n")
  end
end

Then (/^I should see "([^\"]*)" navigation arrow Id "([^\"]*)"$/) do |text_value,id_value|
   sleep(1)
   if query("* id:'#{id_value}'}")
    print("\n'#{text_value}' navigation is found in screen.\n")
  end
end

Then (/^I should see icon with Id "([^\"]*)"$/) do |id_value|
   sleep(1)
   if query("* id:'#{id_value}'}")
    print("\n'#{id_value}' icon is found in screen.\n")
  end
end

Then (/^I should see "([^\"]*)" with Id "([^\"]*)"$/) do |text_value,id_value|
   sleep(1)
   actualValue = query("* id:'#{id_value}'",:getText).first
   
   if actualValue.include? text_value
    print("\n'#{text_value}:#{text_value}' is found in screen.\n")
   else
	fail("Expected value:'#{text_value}:#{text_value} but the value shown is: #{actualValue}'")
   end
end

Then (/^I should see "([^\"]*)" "([^\"]*)" with Id "([^\"]*)"$/) do |text_name,text_value,id_value|
   sleep(1)
   actualValue = query("* id:'#{id_value}'",:getText).first
   
   if (actualValue.include? text_value)
    print("\n'#{text_name}:#{text_value}' is found in screen.\n")
   else
	fail("Expected value:'#{text_name}:#{text_value} but the value shown is: #{actualValue}'")
   end
end

Then (/^I (?:should)? see the button "([^\"]*)"$/) do |text1|
  sleep(1)
  if query("android.widget.TextView {text LIKE[c] '#{text1}'}")
    print("\n'#{text1}' is found in screen\n")
  end
end

Then (/^I wait for "([^\"]*)" in main screen$/) do |text|
  #MyHelperClass.method_name()
  wait_for_text(text)
  sleep(5)
 end

Then (/^I swipe "(left|right|up|down)"$/) do |dir|
 sleep(3)
 if(dir == "left")
	print("scrolling left...")
	pan_left
 elsif (dir == "right")
 print("scrolling right...")
	pan_right
 elsif (dir == "down")
 print("scrolling down...")
	pan_down
 elsif (dir == "up")
 print("scrolling up...")
	pan_up
 end
end

Then (/^I press ellipsis button$/) do

	if(query("* marked:'HOME'").empty?)
		press_back_button
	end
	
  tap_when_element_exists("android.widget.ImageButton index:0")
end

# Then (/^I touch the "([^\"]*)" text$/) do |text|
  # sleep(3)
  # tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
  # sleep(3)
# end

Then (/^I enter "([^\"]*)" into email field$/) do |text|
  sleep(3)
  enter_text("android.widget.EditText index:0", text)
end

Then (/^I enter "([^\"]*)" into password field$/) do |text|
  enter_text("android.widget.EditText index:1", text)
end

Then (/^I click on SIGN IN button$/) do
	signIn = query("* marked:'SIGN IN'")
	if(signIn.empty?)
		fail("Cannot find SIGN IN button")
	else
		tap_when_element_exists("* id:'#{signIn[0]["id"]}'")
	end
end

Then (/^I click on Im 17 or older button$/) do
	tap_when_element_exists("* id:'checkoutagegate_pass_textview'")
end

Then (/^I click on checkout pickup on store button$/) do
	tap_when_element_exists("* id:'checkoutprompt_pickupatstore_textview'")
end

Then (/^I wait for ([^\"]*) to appear$/) do |text|
  wait_for_text(text)
end



Then (/^I click on payment icon$/) do
	sleep(3)
	tap_when_element_exists("* id:'img_payment'")
end

Then (/^I select "([^\"]*)" from the list$/) do |item|
	sleep(3)
	tap_when_element_exists("android.widget.TextView {text CONTAINS[c] '#{item}'}")
	sleep(5)
end

Then (/^I click on buy button$/) do
	sleep(3)
	tap_when_element_exists("android.widget.RelativeLayout {contentDescription LIKE[c] 'product_preowned'}")
	#tap_when_element_exists("android.widget.RelativeLayout index:4")
	
end



Then (/^I check if message Are you sure you want to pre\-order another copy\?$/) do
	sleep(3)
	if (!query("* {text CONTAINS[c] 'Are you sure you want to pre-order another copy'}").empty?)
		print("\nClick OK to continue pre-order.\n")
		tap_when_element_exists("* id:'button1'")
	end
end

Then (/^I click on buy preorder button$/) do
	sleep(1)
	tap_when_element_exists("* id:'product_preorder'}")
end

Then (/^I enter "([^\"]*)" into zip code text$/) do |text|
  sleep(10)
  enter_text("* id:'txt_search_term'", text)
end

Then (/^I click on store location button$/) do
	sleep(3)
	tap_when_element_exists("* id:'img_store_info_disclosure'}")
end

Then (/^I click on pickup store button$/) do
	sleep(1)
	tap_when_element_exists("* id:'cart_pickupatstore_textview'}")
	sleep(3)
end

Then (/^I click on cart icon$/) do
	sleep(3)
	tap_when_element_exists("* id:'actionlayout_cart_imageview'}")
end

Then (/^I click on checkout button$/) do
	sleep(3)
	tap_when_element_exists("* id:'checkoutprompt_checkoutnow_textview'")
	sleep(3)
end

Then (/^I click on cart checkout button$/) do
	sleep(20)
	
	if(query("* id:'cart_header_checkout_textview'").empty?)
		msg = query("* id:'message'")
	
		if(!msg.empty?)
			cancel = query("* marked:'Cancel'")
			if(!cancel.empty?)
				tap_when_element_exists("* marked:'Cancel'")
			else
				fail("\nPop-up Message:#{msg[0]["text"]}.\n")
			end
		end
	else
		tap_when_element_exists("* id:'cart_header_checkout_textview'")
	end
	
	sleep(3)
end



Then (/^I click back to go to checkout screen$/) do
  #tap_when_element_exists("android.widget.ImageButton {contentDescription LIKE[c] 'Navigate up'}")
  sleep(3)
  press_back_button
  sleep(3)
end

Then (/^I see "([^\"]*)" text$/) do |text1|
  sleep(10)
  
  loop=0
  
  while loop < 3 do
    loop +=1
	
	if(query("* {text CONTAINS[c] '#{text1}'}").empty?)
	 scroll_down
	else
	  break
    end
  end
  
  macro %Q|I should see "#{text1}"|
end

Then (/^I click on place order button$/) do
    
	sleep(3)
	steps %Q{
		Then I wait for "PLACE ORDER" to appear
	}
	
	order1 = query("* id:'checkout_place_order_1'")
	order2 = query("* id:'checkout_place_order_2'")
	
	if(!order1.empty?)
		tap_when_element_exists("* id:'checkout_place_order_1'")
	elsif(!order2.empty?)
	    scroll_down
		tap_when_element_exists("* id:'checkout_place_order_2'")
	else
		sleep(2)
		press_back_button
	end
	
	sleep(3)
end

Then (/^I should see confirmation number$/) do
	#wait_for_text("Confirmation Number",:timeout => 20,:timeout_message=>"")
	loop=0
	
	while loop <= 20 do
		loop +=1
		sleep(1)
		
		conf = query("* id:'text_conf_number'")
		
		if(!conf.empty?)
			loop = 20
			break
		end
	end
	
	conf = query("* id:'text_conf_number'")
		
	if(conf.empty?)
		msg = query("* id:'message'")
	
		if(!msg.empty?)
			cancel = query("* marked:'Cancel'")
			if(!cancel.empty?)
				tap_when_element_exists("* marked:'Cancel'")
			else
				fail("\nPop-up Message:#{msg[0]["text"]}.\n")
			end
		else
			fail("\nUnable to place order.\n")
		end
	else
		print("\nConfirmation Number:#{conf[0]["text"]}\n")
	end
	
	
	sleep(3)
end

Then (/^I should see the "([^\"]*)" text$/) do |text1|
  sleep(5)
  scroll_down
  q = query("* text:'#{text1}'")
  if(!q.empty?)
	print("\n#{text1} is displayed on sreen.\n")
  end
end

Then (/^I scroll "(left|right|up|down)"$/) do |dir|
  sleep(3)
  if(dir =="left")
	scroll_left
  elsif (dir == "right")
	scroll_right
  elsif (dir == "up")
	scroll_up
  elsif (dir == "down")
	scroll_down
  end
end



Then(/^I scroll until "([^\"]*)" is visible$/) do |arg1|
 print("\nSelect this from list:#{arg1}\n")
  max_scroll_tries = 22
  found = 0
   (0..max_scroll_tries).each do |i|
      #print("scroll count:#{i}")
	  found = query("* text:'#{arg1}'").length 
      break if found > 0
	  #print("Scrolling down...")
      scroll("android.widget.ListView", :down)
   end
   
   if found == 0
	
	(0..max_scroll_tries).each do  |i|
	  #print("scroll count:#{i}")
	  found = query("* text:'#{arg1}'").length 
      break if found > 0
	  #print("Scrolling up...")
      scroll("android.widget.ListView", :up)
	end
   
   end
   
   if(found > 0)
    sleep(2)
    #print("clicking..#{arg1}")
	isselected = query("* text:'#{arg1}'")
	print("\nSelected from the list: #{isselected[0]["text"]}\n")
	tap_when_element_exists("* text:'#{arg1}'")
   end
   
end

