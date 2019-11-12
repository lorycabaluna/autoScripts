require_relative '../../dsl/src/dsl'




RSpec.describe 'Cart tests' do


  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    #close_appium(@config.capabilities[:appium_lib][:port])
    #close_emulator(@config.emulator_port)
    #

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
    #close_new_user_tutorial
    #close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    # back_to_home_page
    # log_out_user_account
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 7
  end

  after(:all) do
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 5
  end


  # MTM Automated Regression 33

  #Covers TCID: [87651]
  #


    it 'tc87651: should modify single item', :tc01 do


      $objData.insertTestData('CART','TC01')

      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      close_new_user_tutorial
      #guest_user_only('952007',true)
      user_login_and_sku_search($userType,$skuNumber,true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      sleep 5
      pdp_continue_shopping.click
      sleep 5
      cart_icon.click
      sleep 10
      cart_modify_quantity(3)
      expect(cart_header_count.text).to eq("3 items in cart")

    end

    #Covers TCID: [87652]
    it 'tc87652: should modify multiple item',:tc02 do


      $objData.insertTestData('CART','TC02')

      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"


      close_new_user_tutorial
      #guest_user_only('952007',true)
      user_login_and_sku_search($userType,$skuNumber.split(",")[0],true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      sleep 5
      pdp_continue_shopping.click
      sleep 5
      search_for_item($skuNumber.split(",")[1])
      allow_access_device_location(false)
      #button_to_click('PRE-ORDER')
      click_add_to_cart_button
      pdp_continue_shopping.click
      cart_icon.click
      sleep 10
      cart_modify_quantity(3)
      page_scroll_down('0.90','0.20')
      cart_modify_quantity(3)
      sleep 10
      puts cart_header_count.text
      expect(cart_header_count.text).to eq("5 items in cart")

    end

    #Covers TCID: [73863,87886]
    it 'tc03: Merge items from GU to AU- Cart version merge', :tc03 do



      $objData.insertTestData('CART','TC03')

      puts "user type:#{$userType}"
      puts "sku number: #{$skuNumber}"
      puts "zip code: #{$zipCode}"
      puts "promo code: #{$promoCode}"
      puts "giftTrade card: #{$giftTradeCard}"
      puts "pur cc: #{$purRC}"
      puts "credit card type: #{$creditCardType}"

      user_login_and_logout($userType.split(",")[0])
      #guest_user_only('952007',true)
      user_login_and_sku_search($userType.split(",")[1],$skuNumber.split(",")[0],true)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.50,0.30)
      click_add_to_cart_button
      sleep 5
      pdp_continue_shopping.click
      sleep 5
      back_to_home_page
      user_login_and_sku_search($userType.split(",")[0],$skuNumber.split(",")[1],false)
      allow_access_device_location(false)
      sleep 10
      page_scroll_down(0.30,0.50)
      click_add_to_cart_button
      pdp_continue_shopping.click
      sleep 10
      cart_icon.click
      sleep 10
      expect(cart_header_count.text).to eq("2 items in cart")

    end


  it 'tc87651: should add multiple digital items to cart', :tc04 do


    $objData.insertTestData('CART','TC04')

    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952007',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 10
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    sleep 5
    pdp_continue_shopping.click
    sleep 5
    click_add_to_cart_button
    pdp_continue_shopping.click
    sleep 5
    cart_icon.click
    sleep 10
    expect(cart_header_count.text).to eq("2 items in cart")

  end



end

