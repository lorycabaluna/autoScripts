Then (/^I choose "(Value|Two Day|Express|Midnight|Standard|Day One|One Day)" delivery option$/) do |option|
	sleep(5)
	
	loop = 0
	
	while loop <=3
		loop += 1
		
		if(!query("* marked:'#{option}'").empty?)
			loop = 3
			
			tap_when_element_exists("* marked:'#{option}'")
			
			break
		else
			scroll_down
		end
		
	end
	
	
end

Then (/^I set delivery option as "([^\"]*)"$/) do |deliveryOption|
	steps %Q{
		Then I validate if it has pop-up screen message
	}
	
	delivery = query("* id:'img_delivery_info_disclosure'")
	
	if(delivery.empty?)
		fail("\nFail: Delivery link not on screen\n")
	else
		tap_when_element_exists("* id:'img_delivery_info_disclosure'")
	end
	
	steps %Q{
		Then I choose "#{deliveryOption}" delivery option
	}
end

Then (/^I select first item from delivery option$/) do 
	sleep(5)
	tap_when_element_exists("android.widget.TableRow index:0")
end

Then (/^I pick first item from delivery options$/) do 
	sleep(3)
	tap_when_element_exists("* id:'img_delivery_info_disclosure'")
	
	sleep(5)
	tap_when_element_exists("android.widget.TableRow index:0")
end

Then (/^I loop through available delivery options$/) do 
	sleep(3)
	tap_when_element_exists("* id:'img_delivery_info_disclosure'")
	
	sleep(3)
	scroll_down
	deliveryOptions = query("* id:'txt_title'")
	
	ctr = 0
	
	begin
	   sleep(3)
	   scroll_down
	   print("\nSelecting delivery option '#{deliveryOptions[ctr]["text"]}'\n")
	   tap_when_element_exists("* marked:'#{deliveryOptions[ctr]["text"]}'")
	   
	   if(ctr < deliveryOptions.count-1)
		   sleep(3)
		   #Click Delivery options again
		   steps %{
			Then I click on Delivery Options
		   }
	   end
	   	   
	   ctr +=1
	   
	end while ctr < deliveryOptions.count
end

Then (/^I should see delivery options equal to "([^\"]*)"$/) do |text_value|
   sleep(10)
   if query("* id:'txt_delivery_options'",:getText).first == text_value
    print("'#{text_value}' as delivery option.")
	else
	fail("Delivery option should be '#{text_value}'")
  end
end



