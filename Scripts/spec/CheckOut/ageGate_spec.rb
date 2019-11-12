require_relative '../../dsl/src/dsl'

RSpec.describe 'AgeGate tests' do
  before(:all) do

    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    @config.capabilities[:caps][:fullReset] = false
    @config.capabilities[:caps][:noReset] = true
    @config.capabilities[:caps][:dontStopAppOnReset] = true
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)

    $objData = TestData.new

  end

  before(:each) do
     close_appium(@config.capabilities[:appium_lib][:port])
     close_emulator(@config.emulator_port)
    # restart_adb
    sleep 10
    start_emulator(@config.capabilities[:caps][:deviceName], @config.emulator_port)
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
    # close_emulator(@config.emulator_port)
    sleep 5
  end

  # context 'when doing checkout regression' do

  # MTM Automated Regression 33

  #Covers TCID: [69593,69769,91464,69659]
  #



  it 'should not add item to cart Age below 18 GU',:tc01 do

    $objData.insertTestData('AGEGATE','TC01')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_logout($userType.split(",")[0])
    #guest_user_only('930705',true)
    user_login_and_sku_search($userType.split(",")[1],$skuNumber,true)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    age_older_than_17('No')
    cart_icon.click
    sleep 10
    expect(exists{cart_item_remove_link[0]}).to eq(false)
    press_keycode(4)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    age_older_than_17('Yes')
    pdp_checkout_now.click
    sleep 40

    checkout_page('',$giftTradeCard,'','cc',$creditCardType,'Accept')


  end

   #Covers TCID: [69593,91464,69659]
   it 'should add item to cart Age 18 and above, PURBASIC user', :tc02 do

     $objData.insertTestData('AGEGATE','TC02')
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
     sleep 10
     page_scroll_down(0.50,0.30)
     click_add_to_cart_button
     age_older_than_17('Yes')
     pdp_continue_shopping.click
     cart_icon.click
     sleep 10
     expect(exists{cart_item_remove_link[0]}).to eq(true)
     press_keycode(4)
     allow_access_device_location(false)
     sleep 10
     page_scroll_down(0.50,0.30)
     click_add_to_cart_button
     #age_older_than_17('Yes')
     pdp_checkout_now.click
     sleep 40

     checkout_page($promoCode,'','','cc',$creditCardType,'Accept')

   end

  #Covers TCID: [91496,91456]
  it 'should prompt ageGate again after App closed/restart', :tc03 do #App crash

    $objData.insertTestData('AGEGATE','TC03')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_logout($userType.split(",")[0])
    #guest_user_only('930705',true)
    user_login_and_sku_search($userType.split(",")[1],$skuNumber,true)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    age_older_than_17('Yes')
    sleep 10
    pdp_continue_shopping.click
    cart_icon.click
    sleep 10
    expect(exists{cart_item_remove_link[0]}).to eq(true)
    press_keycode(4)
    restart_app
    sleep 15
    page_scroll_sidewards(0.90,0.10)
    sleep 5
    page_scroll_sidewards(0.10,0.90)
    tap_cart_icon
    sleep 5
    #cart_icon.click
    cart_header_checkout_button.click
    age_older_than_17('Yes')
    sleep 40

    checkout_page('',$giftTradeCard,'','cc',$creditCardType,'Accept')

  end

  #Covers TCID: [87541,87538,87539]
  it 'should only delete Mature products in cart', :tc04 do

    $objData.insertTestData('AGEGATE','TC04')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber.split(",")[0],true)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    age_older_than_17('Yes')
    pdp_continue_shopping.click

    sku_item_search($skuNumber.split(",")[1])
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_continue_shopping.click

    sku_item_search($skuNumber.split(",")[2])
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_continue_shopping.click
    back_to_home_page
    log_out
    user_login_only($userType)

    sleep 15
    page_scroll_sidewards(0.90,0.10)
    sleep 5
    page_scroll_sidewards(0.10,0.90)
    tap_cart_icon
    sleep 5
    cart_header_checkout_button.click
    age_older_than_17('No')
    yes_or_ok_link.click
    sleep 5
    expect(cart_header_count.text).to eq("2 items in cart")
    cart_header_checkout_button.click
    sleep 40

    checkout_page('',$giftTradeCard,'','cc',$creditCardType,'Accept')




  end


  #Covers TCID: [91501,91455,91457,91492,91506,91512,91533]
  it 'should prompt ageGate once logout and login again', :tc05 do # issue in the cc checkout

    $objData.insertTestData('AGEGATE','TC05')
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
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    age_older_than_17('Yes')
    pdp_continue_shopping.click
    cart_icon.click
    sleep 10
    expect(exists{cart_item_remove_link[0]}).to eq(true)
    press_keycode(4)
    allow_access_device_location(false)
    sleep 10
    back_to_home_page
    log_out

    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    age_older_than_17('Yes')
    #button_to_click('CHECKOUT NOW')
    pdp_checkout_now.click
    sleep 40

    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')

  end


end




