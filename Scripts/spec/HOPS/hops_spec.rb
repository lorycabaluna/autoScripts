require_relative '../../dsl/src/dsl'


RSpec.describe 'Hold Order Pick Up at Store' do
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


  #Covers TCID: [40953,40954,40955,40956]
  it 'tc01: should place New PreOrder product as GU',:tc01 do
    $objData.insertTestData('HOPS','TC01')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('100161','true')
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    page_scroll_down(0.50, 0.40)
    search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
    # sleep 20
    # page_scroll_down('0.50','0.30')
    # hops_checkout
    # sleep 5
    hops_your_details_page
    edit_hops_details_page
    yourDetails_Finish_button.click
    sleep 15
    love_this_app_alert_msg
    continue_buttonHops.click



  end

  #Covers TCID: [139940,139945]
  it 'tc02: should place Download condition product as AU',:tc02 do
    $objData.insertTestData('HOPS','TC02')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
    # sleep 20
    # page_scroll_down('0.50','0.30')
    # hops_checkout
    # sleep 5
    hops_your_details_page
    yourDetails_Finish_button.click
    sleep 15
    love_this_app_alert_msg
    continue_buttonHops.click


  end


  it 'tc03: should place Pre_owned product as Purbasic user',:tc03 do
    $objData.insertTestData('HOPS','TC03')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"


    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
    # sleep 20
    #     # page_scroll_down('0.50','0.30')
    #     # #bops_pick_up_today_button.click
    #     # bops_puas_pickUpToday.click
    #     # age_older_than_17('yes')
    #     # hops_checkout
    #     # sleep 5
    hops_your_details_page
    yourDetails_Finish_button.click
    sleep 15
    love_this_app_alert_msg
    continue_buttonHops.click



  end

  #Covers TCID: [139942,139943]
  it 'tc04: should place Refurbished condition product as Nonpur user',:tc04 do
    $objData.insertTestData('HOPS','TC04')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"



    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
    #sleep 20
    #page_scroll_down('0.50','0.30')
    #bops_pick_up_today_button.click
    #bops_puas_pickUpToday.click
    #age_older_than_17('yes')
    #hops_checkout
    #sleep 5
    hops_your_details_page
    yourDetails_Finish_button.click
    sleep 15
    love_this_app_alert_msg
    continue_buttonHops.click


  end

  #Covers TCID: [139941]
  it 'tc05: should place New condition product as Purpro user',:tc05 do
    $objData.insertTestData('HOPS','TC05')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
    # sleep 20
    # page_scroll_down('0.50','0.30')
    # #bops_pick_up_today_button.click
    # bops_puas_pickUpToday.click
    # age_older_than_17('yes')
    # hops_checkout
    # sleep 5
    hops_your_details_page
    yourDetails_Finish_button.click
    sleep 15
    love_this_app_alert_msg
    continue_buttonHops.click


  end

  #Covers TCID: [139944]
  it 'tc06: should place New PreOrder product as AU',:tc06 do
    $objData.insertTestData('HOPS','TC06')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    search_for_available_store($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
    # sleep 20
    # page_scroll_down('0.50','0.30')
    # hops_checkout
    # sleep 5
    hops_your_details_page
    yourDetails_Finish_button.click
    sleep 15
    love_this_app_alert_msg
    continue_buttonHops.click



  end


end