require_relative '../../dsl/src/dsl'


RSpec.describe 'PreProd Only-Tests' do
  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    #close_appium(@config.capabilities[:appium_lib][:port])
    #close_emulator(@config.emulator_port)
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

  it 'tc01: should display HOPS velocity error as AUTH',:tc01 do

    $objData.insertTestData('PREPROD','TC01')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"
    close_new_user_tutorial

    pre_prod_user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(true)
    page_scroll_down(0.50, 0.40)
    search_for_available_store_preprod($zipCode,1005,403,false) # tap 'Hebron Parkway' with x and y coordinates.
    # sleep 20
    # page_scroll_down('0.50','0.30')
    # hops_checkout
    # sleep 5
    hops_your_details_page_preprod
    yourDetails_Finish_button_preprod.click
    sleep 15
    love_this_app_alert_msg_preprod
    continue_buttonHops_preprod.click


  end



end