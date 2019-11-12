require_relative '../../dsl/src/dsl'


RSpec.describe 'Error Test' do
  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    #close_appium(@config.capabilities[:appium_lib][:port])
    #close_emulator(@config.emulator_port)

    $objData = TestData.new

  end
  before(:each) do
    # --close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    # restart_adb
    sleep 10
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    clear_data
    @app = AndroidApp.new(@config)
    start_driver
    set_wait(20)
    close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 7
  end

  after(:all) do
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 5
  end


  it 'tc01: should prompt error for invalid input billing address as GU',:tc01 do

    $objData.insertTestData('ERRORCHECK','TC01')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"

    close_new_user_tutorial
    #guest_user_only('952007',true) #PreOwned
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    #page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)
    if (confirmation_shipping_info.text == 'Shipping Information')
      summ_shipping_information_link.click
      sleep 10
    end

    #BLANK INPUTS
    enter_new_billing_address2('','','','','','','','','')
    expect(shipping_first_name.text).to eq('First Name')

    #INVALID FIRST NAME
    enter_new_billing_address2('!@#$%','tester','United States of America','625 WESTPORT PRKWY','GRAPEVINE','Texas','76051','2141234123','francisbarro@gamestop.com')
    expect(alert_message.text).to eq("Please enter a valid FirstName.Special characters are not allowed.")
    sleep 2
    yes_or_ok_link.click

    #INVALID LAST NAME
    enter_new_billing_address2('Accept','!@#$%','United States of America','625 WESTPORT PRKWY','GRAPEVINE','Texas','76051','2141234123','francisbarro@gamestop.com')
    expect(alert_message.text).to eq("Please enter a valid LastName.Special characters are not allowed.")
    sleep 2
    yes_or_ok_link.click
    page_scroll_down(0.40,0.10)

    #INVALID ADDRESS
    enter_new_billing_address2('Accept','tester','United States of America','!@#$%','GRAPEVINE','Texas','76051','2141234123','francisbarro@gamestop.com')
    expect(alert_message.text).to eq("Please enter a valid Address. Special characters are not allowed.")
    sleep 2
    yes_or_ok_link.click
    page_scroll_down(0.40,0.10)

    #INVALID CITY
    enter_new_billing_address2('Accept','tester','United States of America','625 WESTPORT PRKWY','!@#$%','Texas','76051','2141234123','francisbarro@gamestop.com')
    expect(alert_message.text).to eq("Please enter a valid City. Special characters are not allowed.")
    sleep 2
    yes_or_ok_link.click
    page_scroll_down(0.40,0.10)


    #INVALID ZIP CODE
    enter_new_billing_address2('Accept','tester','United States of America','625 WESTPORT PRKWY','GRAPEVINE','Texas','1234567890','2141234123','francisbarro@gamestop.com')
    expect(alert_message.text).to eq("Please enter a valid Zip/postal code in the format ##### or #####-####.")
    sleep 2
    yes_or_ok_link.click
    page_scroll_down(0.40,0.10)


    #INVALID PHONE NUMBER ( NO ERROR PROMPT )
    # enter_new_billing_address2('','','','','','','76051','1234567890','')
    # expect(page_error_message.text).to eq('Please enter a valid LastName.Special characters are not allowed.')
    # yes_or_ok_link.click


    #INVALID EMAIL ( NO ERROR PROMPT )
    # enter_new_billing_address2('','','','','','','','2141234123','!@#$%')
    # expect(page_error_message.text).to eq('Please enter a valid LastName.Special characters are not allowed.')
    # yes_or_ok_link.click
    #page_scroll_down(0.10,0.80)
    #enter_new_billing_address2('','','','','','','76051','','')


  end


  it 'tc02: should prompt error for invalid input HOPS as GU',:tc02 do


    $objData.insertTestData('ERRORCHECK','TC02')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"

    close_new_user_tutorial
    #guest_user_only('100161',true)
    user_login_and_sku_search($userType2,$skuNumber2,true)
    allow_access_device_location(true)
    page_scroll_down(0.50, 0.40)
    search_for_available_store($zipCode2,237,241,false) # tap 'Hebron Parkway' with x and y coordinates.


    #INVALID FIRST NAME
    hops_your_details_page2('!@#$%','Wade','francisbarro@gamestop.com','2141234123')
    expect(first_name_err_msg.text).to eq('Please enter a valid first name.')

    #INVALID LAST NAME
    hops_your_details_page2('DWAYNE','!@#$%','francisbarro@gamestop.com','2141234123')
    expect(hops_last_name_error.text).to eq('Please enter a valid last name.')

    #INVALID EMAIL
    hops_your_details_page2('DWAYNE','Wade','!@#$%','2141234123')
    sleep 2
    expect(alert_message.text).to eq('Invalid email.')
    sleep 2
    yes_or_ok_link.click

    # APPIUM CAN NO LONGER DETECT

    # #INVALID PHONE NUMBER
    # hops_your_details_page2('DWAYNE','Wade','francisbarro@gamestop.com','2#######')
    # sleep 2
    # expect(alert_message.text).to eq('Invalid phone number.')
    # sleep 2
    # yes_or_ok_link.click
    #
    # hops_your_details_page2('DWAYNE','Wade','francisbarro@gamestop.com','2141234123')
    # yourDetails_Finish_button.click
    # sleep 15
    # love_this_app_alert_msg
    # continue_buttonHops.click



  end



  it 'tc03: should prompt error for invalid payment card number input Auth',:tc03 do

    $objData.insertTestData('ERRORCHECK','TC03')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    #checkout_page('','','','cc',$creditCardType,'Accept')
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)

    checkout_payment_icon.click
    sleep 5
    page_scroll_down(0.95,0.50)
    bops_add_new_credit_card_icon.click
    sleep 5

    credit_card_payment_input($creditCardType)
    while (!exists{checkout_save_button})
      page_scroll_down(0.80,0.10)
      sleep 2

    end
    checkout_save_button.click
    sleep 10
    if exists{alert_message}
      expect(alert_message.text).to eq("Please enter a valid payment card number.")
      yes_or_ok_link.click

    end

  end


end