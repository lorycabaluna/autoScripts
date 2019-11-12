Then (/^I test sigin$/) do 
	touch("view marked:'icon drawer white'")
	touch("view marked:'SIGN IN'")
	keyboard_enter_text "Accept"
	keyboard_enter_char 'Return'
	keyboard_enter_text "Test"
	keyboard_enter_char 'Return'
end

Then (/^I Sign in with user "([^\"]*)" and password "([^\"]*)"$/) do |email,password|
		sleep(20)
        wait_for_text("HOME",:timeout=> 30,:retry_frequency => 10)
		
		sleep(10)
		pan_left
		
		sleep(2)
		hamburger = query("android.widget.ImageButton index:0")
		
		if(hamburger.empty?)
			fail("Hamburger button not found.")
		else
			tap_when_element_exists("android.widget.ImageButton index:0")
		end
		
		sleep(5)
		signIn = query("* marked:'SIGN IN'")
		if(signIn.empty?)
			fail("Cannot find SIGN IN button")
		else
			tap_when_element_exists("* id:'#{signIn[0]["id"]}'")
		end
		
	    sleep(2)
	    enter_text("android.widget.EditText index:0", email)
		
	    sleep(2)
	    enter_text("android.widget.EditText index:1", password)
		
		sleep(3)
		tap_when_element_exists("* {text CONTAINS[c] 'SIGN IN'}")
		
		
end

Then (/^I'm on main page$/) do
		sleep(3)
		
		steps %Q{
			Then I validate if it has pop-up screen message
		}
		
		pan_left
		
		wait_for_text("HOME",:timeout_message => "Login Error, please check profile service.",:timeout => 20)
		
		sleep(2)
	    if (!query("android.widget.TextView {text LIKE[c] 'Notifications'}").empty?)
			tap_when_element_exists("* id:'button2'")
		end
		
		sleep(2)
		pan_left
end

Then (/^I validate if it has pop-up screen message$/) do
	sleep(20)
	msg = query("* id:'message'")
	
	if(!msg.empty?)
		cancel = query("* marked:'Cancel'")
		if(!cancel.empty?)
			tap_when_element_exists("* marked:'Cancel'")
	    else
			fail("Pop-up Message:#{msg[0]["text"]}")
		end
	
	end
end

Then (/^I validate Home Banners$/) do
	sleep(3)
	splash = query("* {id CONTAINS[c] 'fragment_home_splashindicator'}")
	
	if(splash.count > 5)
		print("\nBanner count is: #{splash.count-1}\n")
	else
		fail("\nBanner count is only #{splash.count-1}.\n")
	end
end


Then (/^I click on Forgot Password$/) do
	sleep(3)
	forgotPassword = query("* id:'signin_forgotpassword_textview'")
	if(forgotPassword.empty?)
		fail("Forgot Password is not found on screen.")
	else
		tap_when_element_exists("* id:'signin_forgotpassword_textview'")
	end
end

Then (/^I click on Forgot Email Address$/) do
	sleep(3)
	forgotPassword = query("* id:'forgotpassword_forgotusername_textview'")
	if(forgotPassword.empty?)
		fail("Forgot Email Address is not found on screen.")
	else
		tap_when_element_exists("* id:'forgotpassword_forgotusername_textview'")
	end
end

Then (/^I enter Phone Number "([^\"]*)" associated to email address$/) do |phoneNumber|
	sleep(3)
	phoneNum = query("* id:'forgot_username_phonenumber_edittext'")
	if(phoneNum.empty?)
		fail("Phone number field is not found on screen.")
	else
		enter_text("* id:'forgot_username_phonenumber_edittext'",phoneNumber)
		press_user_action_button
	end
	sleep(3)
end

Then (/^I click on Submit to retrieve email address/) do
	sleep(5)
	btnSubmit = query("* id:'forgot_password_continue_textview'")
	if(btnSubmit.empty?)
		fail("Submit button not found on screen.")
	else
		tap_when_element_exists("* id:'forgot_password_continue_textview'")
	end
end

Then (/^I select email address containing "([^\"]*)"$/) do |text|
	sleep(5)
	email = query("* {text CONTAINS[c] '#{text}'}",:getText).first
	if(email.length == 0)
		fail("Email like '#{text}' is not found on the choices.")
	else
		tap_when_element_exists("* {text CONTAINS[c] '#{text}'}")
	end
end

Then (/^I click on Submit after selecting the email address$/) do
	sleep(3)
	btnSubmit = query("* id:'select_username_continue_textview'")
	if(btnSubmit.empty?)
		fail("Submit button not found on screen.")
	else
		tap_when_element_exists("* id:'select_username_continue_textview'")
	end
end

Then (/^I click on Back to Sign In$/) do
	sleep(3)
	backToSignIn = query("* id:'forgotpassword_confirm_backToSignIn_textview'")
	if(backToSignIn.empty?)
		fail("Back to Sign In not found on screen.")
	else
		tap_when_element_exists("* id:'forgotpassword_confirm_backToSignIn_textview'")
	end
end





