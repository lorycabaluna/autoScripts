require_relative '../../dsl/src/dsl'


RSpec.describe 'CheckOut Tests' do
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
    clear_data
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    #clear_data
    @app = AndroidApp.new(@config)
    start_driver
    set_wait(20)
    #close_new_user_tutorial
    #close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    #back_to_home_page
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







  #Covers TCID: [68780,69474,93012]
  it 'tc01: checkout as AUTHENTICATED using VISA and coupon, PreOwned item',:tc01 do

    $objData.insertTestData('CHECKOUT','TC01')
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
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


  end

  #Covers TCID: [139836,93339,139931]
  it 'tc02: checkout as PURPRO using MASTERCARD, Download item',:tc02 do

    $objData.insertTestData('CHECKOUT','TC02')
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
    checkout_page('','','','cc',$creditCardType,'Accept')


  end

  # Change to GC instead of PUR Trade rewards card
  #PUR credit field not read

  #Covers TCID: [139933, 89719,93339]
  it 'tc03: checkout as NONPUR using AMEX, PreOrder New',:tc03 do

    $objData.insertTestData('CHECKOUT','TC03')
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
    click_add_to_cart_button #PRE-ORDER button click
    pdp_checkout_now.click
    sleep 40
    checkout_page('','','','cc',$creditCardType,'Accept')


  end

  # PURBASIC not working
  # NEEDED TRADE CARD HERE TEMPORARILY USES GIFT CARD > Exceeds allowable purchase
  #Covers TCID: [139929,139934,139935]
  it 'tc04: checkout as AUTHENTICATED using GC,Refurb',:tc04 do

    $objData.insertTestData('CHECKOUT','TC04')
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
    checkout_page('',$giftTradeCard,'','','','Accept')


  end



  #Covers TCID: [139928]
  it 'tc05: checkout as PURPRO using PURCC and coupon,Digital item',:tc05 do

    $objData.insertTestData('CHECKOUT','TC05')
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
    click_add_to_cart_button #PRE-ORDER button click
    pdp_checkout_now.click
    sleep 40
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


  end

  #Covers TCID: [139932]
  it 'tc06: checkout as PURPRO using Discover with coupon,Online',:tc06 do

    $objData.insertTestData('CHECKOUT','TC06')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true) #640214
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


  end
  # TO
  #Covers TCID: [139925,139924]
  it 'tc07: checkout as GUEST using PURCC with coupon,PreOwned',:tc07 do

    $objData.insertTestData('CHECKOUT','TC07')
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
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')


  end

  #Covers TCID: [68782,69475,69478,139922,139927,93059]
  it 'tc08: checkout as GU using VISA coupon,PreOwned',:tc08 do

    $objData.insertTestData('CHECKOUT','TC08')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952040',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    #page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page($promoCode,'','','cc',$creditCardType,'Accept')

  end

  #Covers TCID: [139837]
  it 'ECOMDEV-10971: checkout as AU using PayPal and coupon, Online',:tc09 do

    $objData.insertTestData('CHECKOUT','TC09')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true) #640214
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page($promoCode,'','','paypal','','Accept')


  end


   #promo code not link not clicked.
  #Covers TCID: [139921,139930]
  it 'ECOMDEV-10972: checkout as GU using PayPal and coupon, New',:tc10 do

    $objData.insertTestData('CHECKOUT','TC10')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('111253',true) #600132 Digital
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    #older_than_seventeen_button.click
    pdp_checkout_now.click
    sleep 40
    checkout_page($promoCode,'','','paypal','','Accept')


  end

  #Covers TCID: [139923]
  it 'ECOMDEV-11141: checkout as Non PUR using PayPal and coupon, New',:tc11 do

    $objData.insertTestData('CHECKOUT','TC11')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true) #640214
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page($promoCode,'','','paypal','','Accept')


  end


  it 'ECOMDEV-11142: checkout as PUR Pro using PayPal and coupon, New',:tc12 do

    $objData.insertTestData('CHECKOUT','TC12')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true) #640214
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page($promoCode,'','','paypal','','Accept')


  end


  it 'ECOMDEV-11143: PayPal payment not available for DLC, Dowload',:tc13 do


    $objData.insertTestData('CHECKOUT','TC13')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber,true) #640214
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)
    sleep 2
    checkout_payment_icon.click
    sleep 5
    page_scroll_down(0.90,0.50)
    expect(exists{pay_with_paypal_link}).to eq(false)


  end

  it 'TBD: confirmation info display for Review Order status,Discover',:tc14 do

    $objData.insertTestData('CHECKOUT','TC14')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952040',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page('','','','cc',$creditCardType,'Review')


  end

  it 'TBD: cannot place an order for Reject Order status,Discover',:tc15 do

    $objData.insertTestData('CHECKOUT','TC15')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952040',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page('','','','cc',$creditCardType,'Reject')


  end

  #Covers TCID: [89720]
  it 'TBD: multiple line items with multiple promo code,PayPal',:tc16 do

    $objData.insertTestData('CHECKOUT','TC16')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    @billingFname = 'Accept'
    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber.split(",")[0],true)
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_continue_shopping.click
    sku_item_search($skuNumber.split(",")[1])                      #Pre-Order New
    allow_access_device_location(false)
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_continue_shopping.click
    sku_item_search($skuNumber.split(",")[2])                      #Refurbished
    allow_access_device_location(false)
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)
    shipping_address_only(@billingFname)
    multiple_promoCodeINPUT($promoCode)
    checkout_payment_icon.click
    sleep 10
    page_scroll_down(0.80,0.50)
    pay_with_paypal_link.click
    sleep 5
    place_order_button1.click
    continue_paypal_checkout
    love_this_app_alert_msg
    continueShoppingConfirmation.click


  end


  it 'TBD: multiple line items with multiple GC/TC,Amex',:tc17 do

    $objData.insertTestData('CHECKOUT','TC17')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    @billingFname = 'Accept'
    close_new_user_tutorial
    user_login_and_sku_search($userType,$skuNumber.split(",")[0],true) #PreOwned
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_continue_shopping.click
    sku_item_search($skuNumber.split(",")[1])                     #Download
    allow_access_device_location(false)
    click_add_to_cart_button
    pdp_continue_shopping.click
    sku_item_search($skuNumber.split(",")[2])                      #Pre-Order New
    allow_access_device_location(false)
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_continue_shopping.click
    # sku_item_search($skuNumber.split(",")[3])                      #Refurbished
    # allow_access_device_location(false)
    # page_scroll_down(0.50,0.30)
    # click_add_to_cart_button
    # pdp_checkout_now.click
    sleep 40
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)
    shipping_address_only(@billingFname)
    multiple_giftCardINPUT($giftTradeCard.split(",")[0],$giftTradeCard.split(",")[1])
    checkout_page_Payment('cc')
    credit_card_payment_input($creditCardType)
    enter_new_billing_address(@billingFname)
    while !exists{checkout_save_button}
      page_scroll_down(0.80,0.10)
      sleep 2

    end
    checkout_save_button.click
    sleep 10

    page_scroll_down(0.50,0.30)
    sleep 2
    page_scroll_down(0.30,0.50)
    place_order_button1.click
    sleep 10
    love_this_app_alert_msg
    continueShoppingConfirmation.click


  end


  it 'TBD: should be able to delete promo code',:tc18 do

    $objData.insertTestData('CHECKOUT','TC18')
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

    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)
    promoCodes_tradeCredit_GC_icon.click
    sleep 5
    tap_object(540,960)
    sleep 5
    enter_your_promo_code_input.click
    enter_your_promo_code_input.clear
    enter_your_promo_code_input.send_keys($promoCode)
    save_button_promotion_page.click
    sleep 12
    page_scroll_down(0.20,0.10)
    sleep 5
    #tap_object(1005,1155)
    if exists{remove_promo_icon}
      remove_promo_icon.click
      puts "Remove icon was clicked."
    end


  end

  it 'TBD: should be able to delete gift card',:tc19 do

    $objData.insertTestData('CHECKOUT','TC19')
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
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)

    @gift_card_or_trade_card = $giftTradeCard
    if @gift_card_or_trade_card != ''
      my_wallet_icon.click
      gc_number = @gift_card_or_trade_card.split('#')[0]
      gc_pin = @gift_card_or_trade_card.split('#')[1]
      enter_gift_trade_card(gc_number,gc_pin)

      if exists{remove_gc_icon}
        remove_gc_icon.click
        puts "Gift card remove icon is clicked."
        sleep 5
      end

    end



  end


  it 'TBD: Authenticated user pay using Gift Card',:tc20 do

    $objData.insertTestData('CHECKOUT','TC20')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952040',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page('',$giftTradeCard,'','gc','','Accept')


  end

  it 'TBD: Guest user with Name/Surname have spaces',:tc21 do

    $objData.insertTestData('CHECKOUT','TC21')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"
    puts "zip code: #{$zipCode}"
    puts "promo code: #{$promoCode}"
    puts "giftTrade card: #{$giftTradeCard}"
    puts "pur cc: #{$purRC}"
    puts "credit card type: #{$creditCardType}"

    close_new_user_tutorial
    #guest_user_only('952040',true)
    user_login_and_sku_search($userType,$skuNumber,true)
    allow_access_device_location(false)
    sleep 15
    page_scroll_down(0.50,0.30)
    click_add_to_cart_button
    pdp_checkout_now.click
    sleep 40
    checkout_page('',$giftTradeCard,'','gc','','Mike Tyson II')

  end




end