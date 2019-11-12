require_relative '../../dsl/src/dsl'

RSpec.describe 'CheckOut ISPU tests' do
  before(:all) do
    #$test_data = DataFunctions.new()
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    # close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
    #
    $objData = TestData.new

  end
  before(:each) do
    # close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
    # restart_adb
    sleep 8
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
    # close_emulator(@config.emulator_port)
    sleep 5
  end



  #Covers TCID: [69592,119929]
  it 'tc69592: Preorder PUAS using PURCC - GU',:tc01 do
    # @params = $test_data.get_all_data_from_row('tc69592')
    # user_data = get_user_data(@params['user_role'], @params['payment_type'])
    # first_prod_data = $search_data.get_random_product_from_csv({"condition"=>'New',"is_ispu" => 'true'})
    # search_and_perform_buy(@params['user_role'],first_prod_data, 'true','true')
    # proceed_ispu_from_pdp_to_cart
    # summ_store_information_link.click
    # sleep 10
    # store_search_field.send_keys('76051')
    # search_button_tap(995,1706)#,(1306,2406) samsung (659,1133)#cherry mobile
    # if store_list_name == nil
    #   for i in 1..5
    #     search_store_field.click
    #     search_button_tap(995,1706)#,(1306,2406) samsung (659,1133)#cherry mobile
    #     break if store_lists_count
    #     fail("NO stores found near 76051") if store_list_name == nil and i == 5
    #   end
    # end
    # sleep 10
    # store_list_name[0].click
    # select_and_add_payment_method(@params, user_data.card_data)
    # place_order_by_header_button(false)
    # $log.trace("Confirmation number: #{confirmation_number.text}")


    $objData.insertTestData('ISPU','TC01')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('100161',false)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button #PRE-ORDER
    pdp_continue_shopping.click
    cart_icon.click
    sleep 5
    button_to_click('Pick Up At Store')
    cart_header_checkout_button.click
    sleep 40
    #store_location_checkout_icon.click
    ispu_checkout_page('cc',$creditCardType,'Accept')


  end

  #Covers TCID: [68804]
  it 'tc68804: Preorder PUAS using PURCC - AU',:tc02 do
    # @params = $test_data.get_all_data_from_row('tc68804')
    # user_data = get_user_data(@params['user_role'], @params['payment_type'])
    # sign_in_as_authenticated_user('bf_gsdc230@qagsecomprod.oib.com', 'T3sting1')
    # clear_cart
    # first_prod_data = $search_data.get_random_product_from_csv({"condition"=>'New',"is_ispu" => 'true'})
    # search_and_perform_buy('purpro',first_prod_data, 'true','true')
    # proceed_ispu_from_pdp_to_cart
    # summ_store_information_link.click
    # sleep 10
    # store_search_field.send_keys('76051')
    # search_button_tap(995,1706)#,(1306,2406) samsung (659,1133)#cherry mobile
    # if store_list_name == nil
    #   for i in 1..5
    #     search_store_field.click
    #     search_button_tap(995,1706)#,(1306,2406) samsung (659,1133)#cherry mobile
    #     break if store_lists_count
    #     fail("NO stores found near 76051") if store_list_name == nil and i == 5
    #   end
    # end
    # sleep 10
    # store_list_name[0].click
    # # select_and_add_payment_method(@params, user_data.card_data)
    # e, has_inapp = place_order_by_header_button(false)
    # close_inapp_review(has_inapp)
    # # confirmation_in_app_dismiss.click if exists { confirmation_in_app_title }
    # $log.trace("Confirmation number: #{confirmation_number.text}")

    $objData.insertTestData('ISPU','TC02')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,false)
    allow_access_device_location(false)
    page_scroll_down('0.50','0.30')
    click_add_to_cart_button # PRE-ORDER
    pdp_continue_shopping.click
    cart_icon.click
    sleep 5
    button_to_click('Pick Up At Store')
    cart_header_checkout_button.click
    sleep 40
    ispu_checkout_page('cc',$creditCardType,'Accept')



  end

end



