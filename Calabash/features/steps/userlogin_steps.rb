require 'spreadsheet' 
require 'csv'

$currentTestId = 0
class User
	  
	  def initialize(username,password,preowned,storezip,reusername,repassword,phoneNumber,emailAddStart,preOrderSku,newSku,downloadSku,onlineSku,myTestId)
		@username = username
		@password = password
		@preowned = preowned
		@storezip = storezip
		@reusername =reusername
		@repassword = repassword
		@phoneNumber = phoneNumber
		@emailAddStart = emailAddStart
		@preOrderSku = preOrderSku
		@newSku = newSku
		@downloadSku = downloadSku
		@onlineSku = onlineSku
		@myTestId = myTestId
		
	  end
	  
	  def username
		@username
	  end

	  def password
		@password
	  end
	  
	  def reusername
		@reusername
	  end

	  def repassword
		@repassword
	  end
	  
	  def preOwned
		@preowned
	  end
	  
	  def newSku
		@newSku
	  end
	  
	  def downloadSku
		@downloadSku
	  end
	  
	  def onlineSku
		@onlineSku
	  end
	  
	  def preOrderSku
		@preOrderSku
	  end
	  
	  def storeZip
		@storezip
	  end
	  
	  def phoneNumber
		@phoneNumber
	  end
	  
	  def emailAddStart
		@emailAddStart
	  end
	  
	  def myTestId
		@myTestId
	  end
	 
    def self.getCSVData(testId)
		CSV.foreach('SmokeTestData.csv') do |row|
		  break if row[0].nil?
		  
		  if(!row[0].nil? && row[0] != "TestID")
			 if(row[0]== testId)
				@validUser = row[1]
				@validPass = row[2]
				@preowned = row[3].to_i
				@storezip = row[6].to_i
				@reusername = row[7]
				@repassword = row[8]
				@phoneNumber = row[9]
				@emailAddStart = row[10]
				@preOrderSku = row[30]
				@newSku = row[31]
				@downloadSku = row[32]
				@onlineSku = row[33]
				@myTestId = testId
			 end
		  end
		  
		end
		return new(@validUser,@validPass,@preowned,@storezip,@reusername,@repassword,@phoneNumber,@emailAddStart,@preOrderSku,@newSku,@downloadSku,@onlineSku,@myTestId)
	end	
	
end

Then (/^my test Id is "([^\"]*)"$/) do |testId|
	$currentTestId = testId
end

Then (/^I get CSV Data$/) do
	csvData = User.getCSVData(ENV["testid"])
end

Then (/^I get users from xls$/) do

	users = User.GetUsers(ENV["testid"])
	if(users.username.nil?)
		fail("Failed Test Id provided not found in users.xls")
	else
		steps %Q{
			Then I login using the default users
		}
	end
end

Then (/^I login$/) do

		if($currentTestId == 0)
			fail("Print Test ID could not be null or empty.")
			
		else
		
		users = User.getCSVData($currentTestId)
		#print("Current TestID: #{users.myTestId}")
		
		#users = User.getCSVData(ENV["testid"])
		
		if(users.username.nil?)
			fail("Failed Test Id provided not found in users.csv")
		end
		
	    #users = User.getValidUser
		
		steps %Q{
			Then I Sign in with user "#{users.username}" and password "#{users.password}"
		}
		
		end
		
end

Then (/^I do Forgot Password and Forgot Email$/) do
	csvData = User.getCSVData($currentTestId)
	
	if(csvData.username.nil?)
			fail("Failed Test Id provided not found in users.csv")
	end
	
	steps %Q{
		Then I click on Forgot Password
		Then I click on Forgot Email Address
		Then I enter Phone Number "#{csvData.phoneNumber}" associated to email address
		Then I touch the "SUBMIT" text
		Then I select email address containing "#{csvData.emailAddStart}"
		Then I touch the "SUBMIT" text
		Then I click on Back to Sign In
	}
end

Then (/^I do Forgot Password to retreive email$/) do
	steps %Q{
		Then I click on Forgot Password
		Then I click on Submit to retrieve email address
		Then I click on Back to Sign In
	}
end

		

Then (/^I Sign-out$/) do
	sleep(2)
	steps %Q{
		Then I press ellipsis button
		Then I validate if tutorial device pop-up is visible
	}
	
	signoutFound = false
	
	while(signoutFound == false)
		sleep(2)
		if(!query("* marked:'SIGN OUT'").empty?)
			signoutFound = true
		else
			scroll_down
		end
	end
	
	if(signoutFound == true)
		steps %Q{
			Then I touch the "SIGN OUT" text
		}
	end
	
end

Then (/^I re-login$/) do
		csvData = User.getCSVData(ENV["testid"])
		
		if(csvData.reusername.nil?)
			fail("Failed Test Id provided not found in users.csv")
		end
		
	    #reuser = User.getReValidUser
		
		sleep(5)
		signIn = query("* marked:'SIGN IN'")
		if(signIn.empty?)
			fail("Cannot find SIGN IN button")
		end
		
		#print("\nreuser: #{csvData.reusername}")
		#print("\nrepass: #{csvData.repassword}")
		
	    sleep(2)
	    enter_text("android.widget.EditText index:0", csvData.reusername)
		
	    sleep(2)
	    enter_text("android.widget.EditText index:1", csvData.repassword)
		
		sleep(3)
		tap_when_element_exists("* {text CONTAINS[c] 'SIGN IN'}")
end

Then (/^I Purchase PreOwned item$/) do

	users = User.getCSVData($currentTestId)
	#User.GetUsers(ENV["testid"])
	print("PreOwned:#{users.preOwned}")
	
	steps %Q{
		Then I Purchase "PreOwned" item with SKU "#{users.preOwned}" for "PickupAtStore"
	}
end

Then (/^I hold item "(New|PreOrder|PreOwned|Download|Online)" as "(PickUpAtHomeStore|CheckOtherStoreAvailability)"$/) do |purchaseType,storeOption|

	csvData = User.getCSVData($currentTestId)
	
	if(purchaseType == "New")
		itemSku= csvData.newSku
	elsif (purchaseType == "PreOrder")
		itemSku= csvData.preOrderSku
	elsif (purchaseType == "PreOwned")
		itemSku= csvData.preOwned
		purchaseType = "Pre-Owned"
	elsif (purchaseType == "Download")
		itemSku= csvData.downloadSku
	elsif (purchaseType == "Online")
		itemSku= csvData.onlineSku
	end
	
	steps %Q{
	 Then I search item with SKU "#{itemSku}"
	}
	
	if(storeOption == "PickUpAtHomeStore")
		sleep(5)
		tap_when_element_exists("* id:'product_availableathomestoretextview'")
		
		sleep(2)
		tap_when_element_exists("* marked:'#{purchaseType}'")
		
		sleep(5)
		steps %Q{
			Then I touch the "CONTINUE" text
			Then I continue to finish HOPS
		}
	
	elsif (storeOption == "CheckOtherStoreAvailability")
		sleep(3)
		
		tap_when_element_exists("* id:'product_checkotheravailabilitytextview'")
		
		sleep(5)
		steps %Q{
			Then I search store location and Hold New or HoldPreOwned
			Then I continue to finish HOPS
		}
	end
	
end

Then (/^I Purchase "(New|PreOrder|PreOwned|Download|Online)" item as "(PickupAtStore|BuyOnline|Default)"$/) do |purchaseType,pickOrBuy|
    #print("currentTestId: #{$currentTestId}")
	csvData = User.getCSVData($currentTestId)
	#print("PurchaseType:#{purchaseType}")
	
	if(purchaseType == "New")
		itemSku= csvData.newSku
	elsif (purchaseType == "PreOrder")
		itemSku= csvData.preOrderSku
	elsif (purchaseType == "PreOwned")
		itemSku= csvData.preOwned
	elsif (purchaseType == "Download")
		itemSku= csvData.downloadSku
	elsif (purchaseType == "Online")
		itemSku= csvData.onlineSku
	end
	
	print("\nSKU:#{itemSku}\n")
	
	steps %Q{
		Then I Purchase "#{purchaseType}" item with SKU "#{itemSku}" for "#{pickOrBuy}"
	}
end

Then (/^I Purchase "(New|PreOrder|PreOwned|Download|Online)" item as "(PickupAtStore|BuyOnline|Default)" then "(CheckOut|AddToCart)"$/) do |purchaseType,pickOrBuy,checkOutOrAddToCart|
	csvData = User.getCSVData($currentTestId)
	#print("PurchaseType:#{purchaseType}")
	
	if(purchaseType == "New")
		itemSku= csvData.newSku
	elsif (purchaseType == "PreOrder")
		itemSku= csvData.preOrderSku
	elsif (purchaseType == "PreOwned")
		itemSku= csvData.preOwned
	elsif (purchaseType == "Download")
		itemSku= csvData.downloadSku
	elsif (purchaseType == "Online")
		itemSku= csvData.onlineSku
	end
	#print("SKU:#{itemSku}")
	steps %Q{
		Then I Purchase "#{purchaseType}" item with SKU "#{itemSku}" for "#{pickOrBuy}" then "#{checkOutOrAddToCart}"
	}
end

Then (/^I search store location and Hold New or HoldPreOwned$/) do

	users = User.getCSVData($currentTestId)
	#User.GetUsers(ENV["testid"])
	print("StoreZip:#{users.storeZip}")
	steps %Q{
		Then I search store with zip "#{users.storeZip}" then select "HoldPreOwned"
	}
end

Then (/^I validate checkout screen$/) do
	steps %Q{
		Then I validate if it has pop-up screen message
		Then I should see back button
		Then I should see text containing "item in cart" 
		Then I should see the button "PLACE ORDER" 
		Then I should see "Shipping" navigation arrow Id "img_shipping_info_disclosure"
		Then I should see "Delivery" navigation arrow Id "img_delivery_info_disclosure"
		Then I should see "Payment" navigation arrow Id "img_payment_info_disclosure"
		Then I should see "Promo" navigation arrow Id "img_discount_info_disclosure"
		Then I should see text containing "Price..........................$"
		Then I should see text containing "Quantity:"
		Then I should see Product Title
		Then I should see icon with Id "cart_boxartimageview"
		Then I scroll down
		Then I should see Cart Subtotal
		Then I should see Shipping summary
		Then I should see Estimated Tax 
		Then I should see Order Total	
	}
end

Then (/^I Place Order$/) do
	
	steps %Q{
		Then I click on place order button
		Then I validate if it has pop-up screen message
		Then I should see confirmation number
	}
	$currentTestId=0
end

Then (/^I place order and see save$/) do
	steps %Q{
		Then I click on place order button
		Then I validate if it has pop-up screen message
		Then I should see confirmation number
	}
	
	foundSave=0
	loopFound = 0
	sleep(5)
	while foundSave == 0 do
		loopFound+=1
		if(query("* marked:'You Saved!'").empty?)
			scroll_down
		else
		   foundSave = 1
		end
		
		if(loopFound >=10)
			break
		end
	end
	
	if(foundSave ==1)
		discount = query("* id:'txt_summary_discount'")
		print("\nYou Saved!...#{discount[0]["text"]}\n")
	end
	
	$currentTestId=0
end





		


