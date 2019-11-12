module SearchForElement

   driver = $driver

  # First App Launch
   @open_your_dashboard = driver.find_element("id","tutorial_ximageview")
   @enable_finger_print = driver.find_element("xpath","//android.widget.Button[@text='OK']")


  # HOME PAGE

   @dashboard_menu =  driver.find_element("xpath","//android.widget.ImageButton[@content-desc='GameStop']")
   @store_icon_hp = driver.find_element("id","action_stores")
   @cart_icon_hp = driver.find_element("id","actionlayout_cart_imageview")
   @search_icon_hp = driver.find_element("xpath","//android.widget.TextView[@content-desc='Search'][@index='2']")


   @home_tab = driver.find_element("xpath","//android.widget.TextView[@text='HOME'][@index='0']")
   @trade_tab = driver.find_element("xpath","//android.widget.TextView[@text='TRADE'][@index='0']")
   @shop_tab = driver.find_element("xpath","//android.widget.TextView[@text='SHOP'][@index='0']")


  # Search item field

   @search_gamestop_field = driver.find_element("id","com.gamestop.powerup.gti:id/actionlayout_search_edittext")
   @search_select_first_item = driver.find_element("xpath","(//android.widget.ImageView[@content-desc='GameStop'])[1]")
   @sort_by_list = driver.find_element("xpath","//android.widget.Spinner[@content-desc='search_sortspinner']/android.widget.TextView")
   @best_sellers = driver.find_element("xpath","//android.widget.TextView[@text='Best Sellers']")
   @release_date = driver.find_element("xpath","//android.widget.TextView[@text='Release Date']")
   @price_ascending = driver.find_element("xpath","//android.widget.TextView[@text='Price Ascending']")
   @price_descending = driver.find_element("xpath","//android.widget.TextView[@text='Price Descending']")
   @filter = driver.find_element("xpath","//android.widget.TextView[@text='FILTER']")

   # def search_button_tap
   #   #Appium::Core::TouchAction.new(self).press('x': x, 'y': y).release.perform
   #   # press_keycode(84)
   #   # # ruby_lib_core example
   #   # @driver.touch_action.single_tap(element).perform
   #   #
   #   Appium::Core::TouchAction.new(self).press(x: 984, y: 1703).release.perform
   #
   # end


   # PRODUCT DETAILS PAGE

   @check_store_availability = driver.find_element("xpath","//android.widget.TextView[contains(@text='CHECK')]")
   @allow_device_location_deny = driver.find_element("xpath","//android.widget.Button[@text='DENY']")
   @allow_device_location_allow = driver.find_element("xpath","//android.widget.Button[@text='ALLOW']")

   def store_selected(store_line_number)

     @element = driver.find_element("xpath","//android.support.v7.widget.RecyclerView[@content-desc='bops_stores_listview']/android.widget.RelativeLayout[#{store_line_number}]")
     driver.touch_action.single_tap(@element).perform

   end


   @pdp_select_store = driver.find_element("xpath","//android.widget.TextView[@text='SELECT STORE']")
   @pdp_call_store = driver.find_element("xpath","//android.widget.TextView[@text='CALL STORE']")
   @toggle_switch_off = driver.find_element("xpath","//android.widget.Switch[@text='OFF']")
   @toggle_switch = driver.find_element("id","com.gamestop.powerup.gti:id/product_detail_switch")
   @pdp_add_to_cart_button = driver.find_element("xpath","//android.widget.TextView[@text='ADD TO CART']")
   @pdp_continue_shopping_button = driver.find_element("id","add_to_cart_prompt_continue")
   @pdp_checkout_now_button = driver.find_element("id","add_to_cart_prompt_checkoutnow")
   @pdp_im17_or_older = driver.find_element("id","checkoutagegate_pass_textview")
   @pdp_im_under17 = driver.find_element("id","checkoutagegate_fail_textview")
   @pdp_details_tab = driver.find_element("xpath","//android.widget.TextView[@text='DETAILS']")
   @pdp_videos_tab = driver.find_element("xpath","//android.widget.TextView[@text='VIDEOS']")
   @pdp_images_tab = driver.find_element("xpath","//android.widget.TextView[@text='IMAGES']")


   # CART PAGE

   @items_in_cart = driver.find_element("id","com.gamestop.powerup.gti:id/cart_header_count_textview")
   @checkout_button = driver.find_element("id","com.gamestop.powerup.gti:id/cart_header_checkout_textview")
   @quantity_dropdown = driver.find_element("id","com.gamestop.powerup.gti:id/cart_listitem_quantityspinner")

   def quantity_number_of_items(number_of_items)

     # @no_of_items = number_of_items.to_i
     # #@price = driver.find_element("id","com.gamestop.powerup.gti:id/cart_listitem_totalvaluetextview").text
     # @price = @price.gsub("$","").to_d
     # @expected_total_price = "$"+(@price * @no_of_items).to_s

     driver.find_element("xpath","//android.widget.TextView[@text='#{number_of_items}']")


   end

   @ship_to_me_rbutton = driver.find_element("xpath","//android.widget.TextView[@text='Ship To Me']")
   @pick_up_at_store_rbutton = driver.find_element("xpath","//android.widget.TextView[@text='Pick Up At Store']")
   @remove_link = driver.find_element("xpath","//android.widget.TextView[@text='REMOVE']")
   #@your_total = driver.find_element("id","com.gamestop.powerup.gti:id/cart_footer_yourtotalvaluetextview").text
   @sign_in_option_for_guest = driver.find_element("xpath","//android.widget.TextView[@text='SIGN IN']")


   # CHECKOUT PAGE

   @store_location = driver.find_element("xpath","//android.widget.TextView[@text='Store Location']")
   @delivery_options = driver.find_element("xpath","//android.widget.TextView[@text='Delivery Options']")
   @my_wallet_gamestop_credit = driver.find_element("xpath","//android.widget.TextView[@text='My Wallet (GameStop Credit)']")
   @promotional_codes = driver.find_element("xpath","//android.widget.TextView[@text='Promotional Codes']")
   @payment = driver.find_element("xpath","//android.widget.TextView[@text='Payment']")
   @place_order_button = driver.find_element("id","com.gamestop.powerup.gti:id/checkout_place_order_1")


   # MY WALLET PAGE

    @gift_cards_trade_cards = driver.find_element("id","com.gamestop.powerup.gti:id/txt_gift_card")
    @gc_pin = driver.find_element("id","com.gamestop.powerup.gti:id/txt_gift_card_pin")
    @gc_add_icon = driver.find_element("id","com.gamestop.powerup.gti:id/img_icon_add_gift_card")
    @gc_add_billing_address = driver.find_element("id","com.gamestop.powerup.gti:id/txt_gift_card_add_address")


    @pur_trade_credit = driver.find_element("id","com.gamestop.powerup.gti:id/txt_trade_credit")
    @pur_pin = driver.find_element("id","com.gamestop.powerup.gti:id/txt_trade_credit_pin")
    @pur_add_icon = driver.find_element("id","com.gamestop.powerup.gti:id/img_icon_add_trade_credit")
    @pur_add_billing_address = driver.find_element("id","com.gamestop.powerup.gti:id/txt_trade_credit_add_address")

    @alert_billing_error_msg_OK = driver.find_element("xpath","//android.widget.Button[@text='OK']")


   # BILLING ADDRESS PAGE

   @first_name = driver.find_element("id","com.gamestop.powerup.gti:id/txt_first_name")
   @last_name = driver.find_element("id","com.gamestop.powerup.gti:id/txt_last_name")

   def country(country_name)
   driver.find_element("xpath","//android.widget.TextView[@text=#{country_name}]")
   end
   @address = driver.find_element("id","com.gamestop.powerup.gti:id/txt_address")
   @city = driver.find_element("id","com.gamestop.powerup.gti:id/txt_city")

   def state(state_name)
     driver.find_element("xpath","//android.widget.TextView[@text=#{state_name}]")
   end

   @zipcode = driver.find_element("id","com.gamestop.powerup.gti:id/txt_postal_code")
   @phone_number = driver.find_element("id","com.gamestop.powerup.gti:id/txt_phone")
   @email_address = driver.find_element("id","com.gamestop.powerup.gti:id/txt_email")
   @save_button = driver.find_element("id","com.gamestop.powerup.gti:id/app_checkout_save")


   # PROMOTIONS PAGE

   #@enter_your_promo_code_here(tap)
   @enter_your_promo_code = driver.find_element("id","com.gamestop.powerup.gti:id/edittext_promo_input")
   @save_promo_code = driver.find_element("id","com.gamestop.powerup.gti:id/textview_promo_save")



   # PAYMENT PAGE
   @pay_with_paypal = driver.find_element("xpath","//android.widget.TextView[@text='Pay with PayPal']")
   @add_new_credit_card = driver.find_element("xpath","//android.widget.TextView[@text='Add New Credit Card']")
   @credit_card_field = driver.find_element("id","com.gamestop.powerup.gti:id/txt_cc_number")
   @expiry_date = driver.find_element("id","com.gamestop.powerup.gti:id/txt_cc_expiry")
   @cvv = driver.find_element("id","com.gamestop.powerup.gti:id/txt_cc_cvv")
   @add_or_edit_address = driver.find_element("xpath","//android.widget.TextView[@text='Add or Edit Address']")

   @save_credit_card_button = driver.find_element("id","com.gamestop.powerup.gti:id/app_checkout_save")


   # PAYPAL PAYMENT

   @pay_with_paypal = driver.find_element("xpath","//android.widget.ImageView[@content-desc='PayPal']")
   @pay_with_card = driver.find_element("xpath","//android.widget.TextView[@text='Pay with Card']")
   @paypal_email = driver.find_element("xpath","//android.widget.EditText[@content-desc='Email']")
   @paypal_password = driver.find_element("xpath","//android.widget.EditText[@content-desc='Password']")
   @paypal_login_button = driver.find_element("xpath","//android.widget.TextView[@text='Log In']")
   @paypal_pay_button = driver.find_element("xpath","//android.widget.TextView[@text='Pay']")



  # THANK YOU PAGE

   @do_you_love_this_app_no = driver.find_element("id","com.gamestop.powerup.gti:id/tv_no")
   @do_you_love_this_app_yes = driver.find_element("id","com.gamestop.powerup.gti:id/tv_yes")
   @no_thanks = driver.find_element("xpath","//android.widget.TextView[@text='NO THANKS']")
   @rate = driver.find_element("xpath","//android.widget.TextView[@text='RATE']")
   @continue_shopping_button = driver.find_element("xpath","//android.widget.TextView[@text='CONTINUE SHOPPING']")

  # DASHBOARD MENU PAGE

   @sign_in = driver.find_element("xpath","//android.widget.TextView[@text='SIGN IN']") #[@index='0']")
   @powerup_rewards = driver.find_element("xpath","//android.widget.TextView[@text='POWERUP REWARDS']")#[@index='0']")
   @messages = driver.find_element("xpath","//android.widget.TextView[@text='MESSAGES']")#[@index='2']")
   @game_informer_news = driver.find_element("xpath","//android.widget.TextView[@text='GAME INFORMER NEWS']")#[@index='3']")
   @settings = driver.find_element("xpath","//android.widget.TextView[@text='SETTINGS']")#[@index='4']")
   @about_feedback= driver.find_element("xpath","//android.widget.TextView[@text='ABOUT/FEEDBACK']")#[@index='5']")
   @my_wallet = driver.find_element("xpath","//android.widget.TextView[@text='MY WALLET']")#[@index='0']")
   @pre_orders = driver.find_element("xpath","//android.widget.TextView[@text='PRE_ORDERS']")
   @saved_trades = driver.find_element("xpath","//android.widget.TextView[@text='SAVED TRADES']")
   @active_offers = driver.find_element("xpath","//android.widget.TextView[@text='ACTIVE OFFERS']")
   @my_library = driver.find_element("xpath","//android.widget.TextView[@text='MY LIBRARY']")
   @digital_locker = driver.find_element("xpath","//android.widget.TextView[@text='DIGITAL LOCKER']")
   @sign_out = driver.find_element("xpath","//android.widget.TextView[@text='SIGN OUT']")



 # TRADE TAB

  @find_trade_values = driver.find_element("xpath","//android.widget.TextView[@text='FIND TRADE VALUES']")
  @current_trade_offers = driver.find_element("xpath","//android.widget.TextView[@text='CURRENT TRADE OFFERS']")
  @learn_more_link = driver.find_element("xpath","//android.widget.TextView[@text='LEARN MORE']")
  @ok_button =  driver.find_element("xpath","//android.widget.TextView[@text='OK']")
  @learn_more_title = driver.find_element("xpath","//android.widget.TextView[@text='LEARN MORE']")
  @trade_instructions_link = driver.find_element("xpath","//android.widget.TextView[@text='TRADE INSTRUCTIONS']")
  @estimate_disclosures_link =  driver.find_element("xpath","//android.widget.TextView[@text='ESTIMATE DISCLOSURE']")



 # FIND TRADE VALUES

   @trade_games = driver.find_element("xpath","//android.widget.TextView[@text='GAMES']")
   @trade_consoles = driver.find_element("xpath","//android.widget.TextView[@text='CONSOLES']")
   @trade_electronics = driver.find_element("xpath","//android.widget.TextView[@text='ELECTRONICS']")
   @trade_accessories = driver.find_element("xpath","//android.widget.TextView[@text='ACCESSORIES']")



 # CURRENT TRADE OFFERS

   @view_eligible_games_link = driver.find_element("xpath","//android.view.View[@text='View Eligible Games.']")
   @select_first_item = driver.find_element("xpath","//android.widget.Image[@index='0']")


 # SHOP TAB

   @my_saved_searches_header = driver.find_element("xpath","//android.widget.TextView[@text='MY SAVED SEARCHES']")
   @shop_coming_soon_link = driver.find_element("xpath","//android.widget.TextView[@text='COMING SOON']")
   @coming_soon_select_item = driver.find_element("xpath","(//android.widget.ImageView[@content-desc='GameStop'])[1]")

   @shop_games_link = driver.find_element("xpath","//android.widget.TextView[@text='GAMES']")
   @shop_consoles_link = driver.find_element("xpath","//android.widget.TextView[@text='CONSOLES']")
   @shop_electronics_link = driver.find_element("xpath","//android.widget.TextView[@text='ELECTRONICS']")
   @shop_accessories_link = driver.find_element("xpath","//android.widget.TextView[@text='ACCESSORIES']")





end