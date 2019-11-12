
#require 'selenium-webdriver'

module DriverModules
  module PDP
    extend self
    # class << self

    def puas_links
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/product_checkotheravailabilitytextview",__method__)
    end

    def prod_library_tag
      FindersDef.new(self).find_element("id","product_librarycorner_textview",__method__)
    end

    def prod_name
      FindersDef.new(self).find_elements("id","product_variant_title_textview",__method__)
    end

    def prod_var_title
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_variant_title_textview",__method__)
    end


    def prod_platform
      FindersDef.new(self).find_element("id","product_platform_textview",__method__)
    end

    def prod_release_date
      FindersDef.new(self).find_element("id","product_releasedate_textview",__method__)
      # wait(20) { find_elements(:id, "com.gamestop.powerup.gti:id/product_releasedate_textview")[0] }
    end

    def prod_new_price
      FindersDef.new(self).find_element("id","product_new_price_textview",__method__)
    end

    def prod_used_pur_price
      FindersDef.new(self).find_element("id","product_detail_member_discount",__method__)
    end

    def prod_used_price_regular
      #purpro - product_preowned_price_label_textview
      FindersDef.new(self).find_element("id","product_preowned_regprice_textview",__method__)
    end

    def prod_used_regular_price_purpro_user
      FindersDef.new(self).find_element("id","product_preowned_price_label_textview",__method__)
    end

    def prod_download_price
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@resource-id,'product_download_price_textview')]",__method__)
    end

    def prod_new_po_price
      FindersDef.new(self).find_element("id","product_preorder_price_textview",__method__)
    end

    def prod_dlcpo_price
      FindersDef.new(self).find_element("id","product_preorderdownload_price_textview",__method__)
    end

    def puas_link
      FindersDef.new(self).find_element("id","product_checkotheravailabilitytextview",__method__)
    end

    def puas_container
      FindersDef.new(self).find_element("id","product_detail_bops_root",__method__)
    end

    def choose_store_link
      # FindersDef.new(self).find_element("id","product_detail_bops_change_store",__method__)
      FindersDef.new(self).find_element("id","product_homestoreavailability_container",__method__)
    end

    def check_store_availability_link
      # FindersDef.new(self).find_element("id","product_detail_bops_change_store",__method__)
      #FindersDef.new(self).find_element("id","product_availableathomestoretextview",__method__)
      FindersDef.new(self).find_element("xpath","//*[@text='CHECK OTHER STORES']",__method__)
    end

    def bops_zipcode_search_field
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/actionlayout_bops_search_stores_edittext",__method__)

    end

    def bops_zipcode_search_field_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/actionlayout_bops_search_stores_edittext",__method__)

    end


    def bops_store_toggleSwitch
      FindersDef.new(self).find_element("xpath","//android.widget.Switch[@content-desc='product_detail_switch' and @text='ON']",__method__)

    end

    def bops_store_toggleSwitchOFF
      FindersDef.new(self).find_element("xpath","//android.widget.Switch[@content-desc='product_detail_switch']",__method__)
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_detail_switch",__method__)

    end

    def bops_pick_up_today_button
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@content-desc='product_detail_bops_checkout']",__method__)

    end

    def bops_puas_pickUpToday
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@content-desc='product_detail_bops_puas'][@text='PICK UP TODAY']",__method__)
    end

    def bops_puas_preOrderForPickUp
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@content-desc='product_detail_bops_puas'][@text='PRE-ORDER FOR PICK UP']",__method__)
    end

    def bops_puas_checkStoresForPickUp
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@content-desc='product_detail_bops_puas'][@text='CHECK STORES FOR PICK UP']",__method__)
    end

    def bops_hops_puas_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_detail_bops_puas",__method__)
    end

    def bops_hops_puas_button_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/product_detail_bops_puas",__method__)
    end


    def bops_pay_now_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutprompt_pay_now_layout",__method__)
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='PAY NOW'][@content-desc='checkoutprompt_pay_now_layout']",__method__)

    end

    def bops_pay_now_button_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/checkoutprompt_pay_now_layout",__method__)
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='PAY NOW'][@content-desc='checkoutprompt_pay_now_layout']",__method__)

    end

    def hops_pay_in_store_button
      #FindersDef.new(self).find_element("xpath","//*[@text='PAY IN STORE']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutprompt_pay_later_layout",__method__)
    end

    def hops_pay_in_store_button_preprod
      #FindersDef.new(self).find_element("xpath","//*[@text='PAY IN STORE']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/checkoutprompt_pay_later_layout",__method__)
    end


    def hops_preOrder_for_pickUP
        #FindersDef.new(self).find_element("id","product_details_bops_checkout",__method__)
        FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='PRE-ORDER FOR PICK UP']",__method__)


    end




    def bops_check_other_stores_link
      #FindersDef.new(self).find_element("id","product_detail_bops_change_store",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'CHECK')]",__method__)
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text='CHECK')]",__method__)

    end

    def no_items_in_the_cart
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='You have no items in your cart.']",__method__)
    end

    def cart_remove_link
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='REMOVE']",__method__)
    end


    def tap_store_location(x,y)

      #FindersDef.new(self).find_elements("id","product_mainlayout",__method__)
      # a = FindersDef.new(self).find_element("xpath","//android.support.v7.widget.RecyclerView[@content-desc='bops_stores_listview']/android.widget.RelativeLayout[3]/android.widget.RelativeLayout/android.widget.TextView[1]",__method__)
      # print "\r\nwwwwwwwwwwwwwwwwwwwwww" + a.value
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'76182')])",__method__)
      #FindersDef.new(self).find_element("xpath","//android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout[@resource-id='action_bar_root']/android.widget.FrameLayout[@resource-id='android:id/content']/android.support.v4.widget.DrawerLayout[@resource-id='drawer_layout']/android.widget.FrameLayout/android.widget.FrameLayout[@resource-id='modal_fragment_container']/android.widget.RelativeLayout[@content-desc='NO_RESOURCE_NAME']/android.support.v7.widget.RecyclerView[@content-desc='bops_stores_listview']/android.widget.RelativeLayout[4]/android.widget.RelativeLayout/android.widget.TextView[1]",__method__)
      # TouchAction action = TouchAction.new(FindersDef.new(self))
      # action.single_tap(find_element().perform
      #

        Appium::Core::TouchAction.new(self).press(x:x,y:y).release.perform

    end

    def page_scroll_down(percent_startY,percent_endY)

      size = window_size
      starty = size.height * percent_startY.to_f
      endy = size.height * percent_endY.to_f
      startx = size.width / 2;


      #Swipe action Bottom To Top
      # sleep(5)
      # Appium::TouchAction.new.swipe(:start_x => startx, :start_y => starty, :end_x => startx, :end_y => endy, :duration => 1000).perform
      # sleep(5)

      Appium::TouchAction.new(self).press(x:startx, y:starty).wait(2000).move_to(x:startx, y:endy).release.perform
      sleep(5)

    end

    def page_scroll_sidewards(percent_startX, percent_endX)
      size = window_size
      startx = size.width * percent_startX.to_f
      endx = size.width * percent_endX.to_f
      starty = size.height / 2;
      Appium::TouchAction.new(self).press(x:startx, y:starty).wait(2000).move_to(x:endx, y:starty).release.perform
      sleep(5)

    end

    def bops_select_store_button
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'SELECT STORE')]",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/bops_listitem_select_store_textview",__method__)

    end

    def bops_select_store_button_preprod
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'SELECT STORE')]",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/bops_listitem_select_store_textview",__method__)

    end


    def bops_call_store_button
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='CALL STORE']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/bops_listitem_call_store_textview",__method__)

    end


    def yourDetails_FirstName
      FindersDef.new(self).find_element("id","hops_firstname_edittext",__method__)

    end

    def yourDetails_LastName
      FindersDef.new(self).find_element("id","hops_lastname_edittext",__method__)

    end

    def yourDetails_Email
      FindersDef.new(self).find_element("id","hops_email_edittext",__method__)

    end

    def yourDetails_PhoneNumber
      FindersDef.new(self).find_element("id","hops_phonenumber_edittext",__method__)

    end

    def yourDetails_Continue_button
      FindersDef.new(self).find_element("xpath","//*[@text='CONTINUE']",__method__)

    end

    def yourDetails_Finish_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/hops_submit_textview",__method__)

    end

    def yourDetails_Finish_button_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/hops_submit_textview",__method__)

    end

    def edit_user_detail_page
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/hops_editText",__method__)
    end

    def edit_user_detail_page_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/hops_editText",__method__)
    end

    def my_wallet_icon
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='My Wallet (GameStop Credit)']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_wallet",__method__)
    end

    def pdp_add_to_cart_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_detail_bops_checkout",__method__)
    end

    def add_to_cart_buttonV2
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='ADD TO CART']",__method__)

    end

    def button_name_to_click(buttonName)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='#{buttonName}']",__method__)
    end

    def pdp_details_view
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text='DETAILS')]",__method__)
    end

    def pdp_videos_view

      FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'VIDEOS')]",__method__)


    end


    def pdp_images_view
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'IMAGES')]",__method__)


    end

    def sameAsShippingAddress
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/selectSameAsShippingAddress",__method__)
    end




    def continueShoppingConfirmation
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_continue_shopping_1",__method__)
    end

    def continue_buttonHops
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/hops_submit_textview",__method__)

    end

    def continue_buttonHops_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/hops_submit_textview",__method__)

    end

    def pickup_atstore_radiobutton
      FindersDef.new(self).find_element("id","checkoutprompt_pickupatstore_textview",__method__)
    end

    def buy_online_radiobutton
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutprompt_payonline_textview",__method__)
    end

    def buy_radiobutton_count
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutprompt_payonline_textview",__method__)
    end

    # def buttons_container
    #   FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutprompt_main_linearlayout",__method__)
    # end

    def buttons_container
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/add_to_cart_prompt_main_linearlayout",__method__)
    end

    def buy_checkout_button
      FindersDef.new(self).find_element("id","checkoutprompt_checkoutnow_textview",__method__)
    end

    def add_to_cart_button
      FindersDef.new(self).find_element("id","checkoutprompt_addtocart_textview",__method__)
    end

    def unable_to_search_item

      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Unable to search.']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/listheader_empty_textview",__method__)
    end

    def unable_to_search_item_preprod

      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Unable to search.']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/listheader_empty_textview",__method__)
    end

    def remove_gc_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_remove",__method__)
    end

    def gc_or_tc_label
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/app_gift_card_prompt",__method__)
      FindersDef.new(self).find_element("id","app_gift_card_prompt",__method__)
    end

    def pdp_continue_shopping
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/add_to_cart_prompt_continue",__method__)
    end

    def pdp_checkout_now
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/add_to_cart_prompt_checkoutnow",__method__)
    end

    def age_gate_container
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/checkoutagegate_main_linearlayout",__method__)
    end

    def older_than_seventeen_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutagegate_pass_textview",__method__)
      # wait(20) { find_element(:id, 'checkoutagegate_pass_textview') }
    end

    def younger_than_eighteen_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutagegate_fail_textview",__method__)
      # wait(20) { find_element(:id, 'checkoutagegate_fail_textview') }
    end

    def add_to_library_label
      FindersDef.new(self).find_element("id","product_addtomygamelibrary_textview",__method__)
    end

    def add_to_i_have_button
      FindersDef.new(self).find_element("id","product_ihave_textview",__method__)
    end

    def add_to_i_want_button
      FindersDef.new(self).find_element("id","product_iwant_textview",__method__)
    end

    def add_to_i_had_button
      FindersDef.new(self).find_element("id","product_ihad_textview",__method__)
    end

    def view_my_lib_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_viewmylibrary_textview",__method__)
    end

    def pdp_view_more_link
      FindersDef.new(self).find_element("id","view_product_more_textview",__method__)
    end

    def pdp_overlay_container
      FindersDef.new(self).find_element("id","product_buyoverlay",__method__)
    end

    def pdp_overlay_title
      FindersDef.new(self).find_element("id","product_buyoverlay_title_textview",__method__)
    end

    def pdp_overlay_price_1
      FindersDef.new(self).find_element("id","product_buyoverlay_prices_textview",__method__)
    end

    def pdp_overlay_price_2
      FindersDef.new(self).find_element("id","product_buyoverlay_prices2_textview",__method__)
    end

    def pdp_relative_layout
      # FindersDef.new(self).find_elements("xpath","//android.widget.RelativeLayout/android.widget.LinearLayout",__method__)
      FindersDef.new(self).find_elements("xpath","//android.widget.RelativeLayout/android.widget.TextView",__method__)
    end

    def pdp_online_only_label
      FindersDef.new(self).find_element("id","product_onlineonly_textview",__method__)
    end

    def pdp_item_rating_1
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/product_ratingstarimageview1",__method__)
    end
    def pdp_item_rating_2
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/product_ratingstarimageview2",__method__)
    end
    def pdp_item_rating_3
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/product_ratingstarimageview3",__method__)
    end
    def pdp_item_rating_4
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/product_ratingstarimageview4",__method__)
    end
    def pdp_item_rating_5
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/product_ratingstarimageview5",__method__)
    end

    def pdp_item_rating_text
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/product_ratingtextview",__method__)
    end


    def cart_quantity_dropdown
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/cart_listitem_quantityspinner",__method__)
    end

    def cart_number_of_items(value)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='#{value}']",__method__)

    end

    def cart_header_count
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/cart_header_count_textview",__method__)

    end

    def suggested_address_selected
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/selectSuggestedAddress",__method__)
      
    end


    def add_billing_address
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_gift_card_add_address",__method__)
    end

    def hops_last_name_error
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/hops_last_name_error_textview",__method__)
    end




  end
end

# module Kernel
#   def pdp
#     Pages::PDP
#   end
# end