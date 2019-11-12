module DriverModules
  module CheckOut
    extend self
    # class << self
    #Cart objects
    def item_in_cart_label
      FindersDef.new(self).find_element("id","cart_header_count_textview",__method__)
    end

    def cart_items_count_label
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/cart_header_count_textview",__method__)
    end

    def cart_header_checkout_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/cart_header_checkout_textview",__method__)
      # FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@resource-id,'cart_header_checkout_textview') and @text='CHECKOUT']",__method__)
    end


    def cart_item_count(expectedResult)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@index='1' and @text='#{expectedResult}']",__method__)
    end

    def cart_list
      FindersDef.new(self).find_elements("xpath","//android.widget.ListView[contains(@resource-id,'cart_listview')]/android.widget.LinearLayout",__method__)
    end

    def cart_item_name_label
      FindersDef.new(self).find_elements("id","cart_listitem_titletextview",__method__)
    end

    def cart_item_platform_condition
      FindersDef.new(self).find_elements("id","cart_listitem_platformconditiontextview",__method__)
    end

    def cart_item_image
      FindersDef.new(self).find_elements("id","cart_listitem_artimageview",__method__)
    end

    def cart_item_quantity_dropdown
      FindersDef.new(self).find_elements("id","cart_listitem_quantityspinner",__method__)
    end

    def cart_item_quantity_value(value)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='#{value}']",__method__)
    end

    def cart_item_quantity_selected_value
      FindersDef.new(self).find_elements("xpath","//android.widget.Spinner/android.widget.TextView",__method__)
    end

    def cart_item_price_label
      FindersDef.new(self).find_elements("id","cart_listitem_totaltextview",__method__)
    end

    def cart_item_price_value
      FindersDef.new(self).find_elements("id","cart_listitem_totalvaluetextview",__method__)
    end

    def cart_item_remove_link
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/cart_listitem_removeitemtextview",__method__)
    end

    def cart_item_remove_link_preprod
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.preprod:id/cart_listitem_removeitemtextview",__method__)
    end



    def cart_total_label
      FindersDef.new(self).find_element("id","cart_footer_yourtotaltextview",__method__)
    end

    def cart_total_value
      FindersDef.new(self).find_element("id","cart_footer_yourtotalvaluetextview",__method__)
    end

    def cart_footer_checkout_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/cart_footer_checkoutttextview",__method__)
    end

    def cart_sign_in_link
      FindersDef.new(self).find_element("xpath","//android.widget.LinearLayout[contains(@resource-id,'ll_sign_in']/android.widget.TextView[@index='1']",__method__)
    end

    def co_age_gate_container
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/checkoutagegate_main_linearlayout",__method__)
    end

    def co_agate_mature_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutagegate_pass_textview",__method__)
    end

    def co_agate_immature_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkoutagegate_fail_textview",__method__)
    end

    def cart_ship_to_me_rb
      FindersDef.new(self).find_element("id","cart_shiptome_textview",__method__)
    end

    def cart_puas_rb
      FindersDef.new(self).find_elements("id","cart_pickupatstore_textview",__method__)
    end

    #Cart Objects

    #Checkout Summary Objects
    def summ_item_in_cart_label
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@resource-id,'text_header_info')]",__method__)
    end

    def summ_place_order_button
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/checkout_place_order_1",__method__)
    end

    def place_order_button1
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkout_place_order_1",__method__)
    end

    def summ_store_information_link
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/ll_store_information",__method__)
    end

    def summ_shipping_information_link
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/ll_shipping_information",__method__)
    end

    def summ_delivery_option_link
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/ll_delivery_information",__method__)
    end

    def summ_payment_information_link
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/ll_payment_information",__method__)
    end

    def summ_payment_type
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_payment",__method__)
    end

    def checkout_payment_icon
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_payment",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_payment",__method__)

    end

    def bops_add_new_credit_card_icon
      #FindersDef.new(self).find_element("id","txt_add_credit_card",__method__)
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Add New Credit Card']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_add_credit_card",__method__)

    end

    def summ_promo_codes_link
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/ll_discount_information",__method__)
    end

    def summ_added_promo_title
      FindersDef.new(self).find_elements("id","txt_discount",__method__)
    end

    def promoCodes_tradeCredit_GC_icon
      #FindersDef.new(self).find_element("id","txt_discount",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_promo_code",__method__)
    end

    def promotional_codes
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Promotional Codes']",__method__)
    end

    def enter_your_promocode_here
      FindersDef.new(self).find_element("xpath","//android.widget.ImageView[@package='com.gamestop.powerup.gti'][@index='0']",__method__)
    end


    def add_edit_address
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_add_address",__method__)
    end

    def saved_addresses
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_saved_addresses",__method__)
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@content-desc='txt_saved_addresses'][@index=0]",__method__)
    end


    # def summ_prod_list
    #   # #wait(20) { find_element(:id, "com.gamestop.powerup.gti:id/lt_producontainer") }
    #   #wait(20) { find_element(:xpath, "//[contains(@resource-id,'lt_producontainer')]") }
    # end

    def summ_prod_name #(index)
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/cart_titletextview",__method__)
    end

    def summ_prod_platform_condition #(index)
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/cart_conditiontextview",__method__)
    end

    def summ_prod_price
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/cart_pricetextview",__method__)
    end

    def summ_prod_quantity #(index)
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/cart_quantitytextview",__method__)
    end

    def summ_sub_total
      FindersDef.new(self).find_element("id","txt_summary_cart_subtotal",__method__)
    end

    def summ_shipping_price
      FindersDef.new(self).find_element("id","txt_summary_shipping",__method__)
    end

    def summ_discount_price
      FindersDef.new(self).find_element("id","txt_summary_discount",__method__)
    end

    def summ_estimated_tax
      FindersDef.new(self).find_element("id","txt_summary_estimated_tax",__method__)
    end

    def summ_order_total
      FindersDef.new(self).find_element("id","txt_summary_order_total",__method__)
    end

    def summ_place_order_button_2
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/checkout_place_order_2",__method__)
    end

    # Summary Objects

    #Shipping Page Objects
    def shipping_first_name
      FindersDef.new(self).find_element("id","txt_first_name",__method__)
    end

    def shipping_last_name
      FindersDef.new(self).find_element("id","txt_last_name",__method__)
    end

    def shipping_country_dropdown
      FindersDef.new(self).find_element("xpath","//android.widget.Spinner[contains(@resource-id,'spn_country')]",__method__)
    end

    def shipping_selected_country
      FindersDef.new(self).find_element("id","android:id/text1",__method__)
    end

    def shipping_address
      FindersDef.new(self).find_element("xpath","//android.widget.EditText[contains(@resource-id,'txt_address')]",__method__)
    end

    def shipping_city
      FindersDef.new(self).find_element("xpath","//android.widget.EditText[contains(@resource-id,'txt_city')]",__method__)
    end

    def shipping_state_dropdown
      FindersDef.new(self).find_element("xpath","//android.widget.Spinner[contains(@resource-id,'spn_state_province')]",__method__)
    end

    def shipping_selected_state
      FindersDef.new(self).find_element("id","android:id/text1",__method__)
    end


    def shipping_zip_code
      FindersDef.new(self).find_element("id","txt_postal_code",__method__)
    end

    def shipping_phone_number
      FindersDef.new(self).find_element("id","txt_phone",__method__)
    end

    def shipping_email_address
      FindersDef.new(self).find_element("id","txt_email",__method__)
    end

    def summ_ship_verification_label
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Please select the appropriate address.']",__method__)
    end

    def shipping_select_suggested
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/selectSuggestedAddress",__method__)
    end

    def shipping_select_entered
      FindersDef.new(self).find_element("id","selectEnteredAddress",__method__)
    end

    # def shipping_save_button
    #   # #wait(20) { find_element(:id, "app_checkout_save") }
    #   #wait(20) { find_element(:xpath, "//android.widget.TextView[contains(@resource-id,'app_checkout_save')]") }
    # end

    def drop_down_list_items
      FindersDef.new(self).find_elements("id","android:id/text1",__method__)
    end

    # SHIPPING OBJECTS

    # DELIVERY OBJECTS
    def delivery_option_link
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/txt_title",__method__)
    end

    def store_location_checkout_icon
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Store Location']",__method__)
    end

    # DELIVERY OBJECTS

    # PAYMENT Objects

    def saved_payment_link
      FindersDef.new(self).find_element("xpath","//android.widget.LinearLayout[contains(@resource-id,'ll_container')]/android.widget.LinearLayout[@index=0]",__method__)
    end

    def payment_with_paypal_link
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/txt_payment",__method__)
    end

    def payment_add_new_cc_link
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/ll_add_credit_card",__method__)
    end

    def payment_add_edit_address_link
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/ll_add_address",__method__)
    end

    def payment_cc_number_container
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/ll_cc_container",__method__)
    end

    def payment_cc_number_field
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_cc_number",__method__)
    end

    def payment_cc_exp_date_field
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_cc_expiry",__method__)

    end

    def payment_cc_cvv_field
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_cc_cvv",__method__)

    end

    # PAYMENT Objects

    # BILLING OBJECTS
    def bill_same_as_ship_rdbutton
      FindersDef.new(self).find_element("id","selectSameAsShippingAddress",__method__)
    end

    def bill_first_name
      FindersDef.new(self).find_element("id","txt_first_name",__method__)
    end

    def bill_last_name
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_last_name",__method__)
    end

    def bill_country_dropdown
      FindersDef.new(self).find_element("xpath","//android.widget.Spinner[contains(@resource-id,'spn_country')]",__method__)
    end

    def bill_selected_country
      FindersDef.new(self).find_element("id","android:id/text1",__method__)
    end

    def bill_address
      FindersDef.new(self).find_element("id","txt_address",__method__)
    end

    def bill_city
      FindersDef.new(self).find_element("id","txt_city",__method__)
    end

    def bill_state_dropdown
      FindersDef.new(self).find_element("xpath","//android.widget.Spinner[contains(@resource-id,'spn_state_province')]",__method__)
    end

    def bill_selected_state
      FindersDef.new(self).find_element("id","android:id/text1",__method__)
    end


    def bill_zip_code
      FindersDef.new(self).find_element("id","txt_postal_code",__method__)
    end

    def bill_phone_number
      FindersDef.new(self).find_element("id","txt_phone",__method__)
    end

    def bill_email_address
      FindersDef.new(self).find_element("id","txt_email",__method__)
    end

    def checkout_save_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/app_checkout_save",__method__)
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@content-desc='app_checkout_save'][@index=5]",__method__)

    end

    def save_my_payment_method_checkbox
      FindersDef.new(self).find_elements("id","save_payment_method_checkbox",__method__)
    end




    # BILLING OBJECTS

    # PROMO CODES
    #


    def promo_code_normal
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_promo_code",__method__)
    end

    def enter_your_promo_code_input
      #FindersDef.new(self).find_element("xpath","//android.widget.EditText[@text='Enter your promo code.'][@index='1']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/edittext_promo_input",__method__)

    end

    def save_button_promotion_page
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SAVE'][@index='2']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/textview_promo_save",__method__)

    end

    def promo_code_add_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_icon_add_promo_code",__method__)
    end

    def added_promos_container
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/ll_promo_code_container",__method__)
    end

    def added_promos_gc_purcc_title
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/txt_title",__method__)
    end

    def remove_promo_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_remove",__method__)
    end

    def added_promos_description
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/txt_description",__method__)
    end

    def gc_input
      FindersDef.new(self).find_element("id","txt_gift_card",__method__)
    end

    def gc_pin
      FindersDef.new(self).find_element("id","txt_gift_card_pin",__method__)
    end

    def gc_add_icon
      FindersDef.new(self).find_element("id","img_icon_add_gift_card",__method__)
    end

    def added_gc_container
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/ll_gift_card_container",__method__)
    end

    def gc_paypal_disclaimer
      FindersDef.new(self).find_element("id","giftCard_paypal_disclaimer",__method__)
    end

    def purcc_input
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_trade_credit",__method__)
    end

    def purcc_pin
      FindersDef.new(self).find_element("id","txt_trade_credit_pin",__method__)
    end

    def purcc_enter_the_pin_text
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/text_pinentry_desc",__method__)
    end

    def purcc_rewards_pin_CB1
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='-'][@index=0]",__method__)
    end

    def purcc_rewards_pin_CB2
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='-'][@index=1]",__method__)
    end

    def purcc_rewards_pin_CB3
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='-'][@index=2]",__method__)
    end

    def purcc_rewards_pin_CB4
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='-'][@index=3]",__method__)

    end

    def purcc_add_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_icon_add_trade_credit",__method__)
    end

    def purccReward_add_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/action_pin_add",__method__)
    end

    def pur_paypal_disclaimer
      FindersDef.new(self).find_element("id","tradeCredit_paypal_disclaimer",__method__)
    end

    def pur_creditCB
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/cb_checkout_wallet_selector",__method__)
    end


    def page_error
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/alertTitle",__method__)
    end

    def page_error_message
      FindersDef.new(self).find_elements("id","android:id/message",__method__)
    end

    def app_modal
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/modal",__method__)
    end

    def app_modal_message
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/body",__method__)
    end

    def no_thanks_alert
      FindersDef.new(self).find_element("id","tv_no",__method__)
    end

    def rate_alert
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='RATE'][@index='2']",__method__)
    end

    def app_modal_close_button
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/dismiss",__method__)
    end

    def app_modal_YES_button
      FindersDef.new(self).find_elements("xpath","//android.widget.Button[@text='YES']",__method__)
    end

    def do_you_love_this_app_YES
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/tv_yes",__method__)
    end

    def do_you_love_this_app_YES_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/tv_yes",__method__)
    end

    def do_you_love_this_app_NO
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/tv_no",__method__)
    end

    def do_you_love_this_app_NO_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/tv_no",__method__)
    end

    def power_gs_icon
      FindersDef.new(self).find_element("id","iv_gs_icon",__method__)
    end

    def app_modal_NO_button
      FindersDef.new(self).find_elements("xpath","//android.widget.Button[@text='NO']",__method__)
    end


    # PROMO CODES

    # PAYPAL OBJECTS
    def pay_with_paypal_button
      FindersDef.new(self).find_element("xpath","//android.widget.ImageView[@content-desc='PayPal']",__method__)
    end

    def pay_with_paypal_link
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Pay with PayPal']",__method__)
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/img_payment",__method__)
      #FindersDef.new(self).find_element("resource-id","com.gamestop.powerup.gti:id/img_payment",__method__)
    end

    def paypal_email
      FindersDef.new(self).find_element("xpath","//android.widget.EditText[@content-desc='Email']",__method__)
    end

    def paypal_pword
      FindersDef.new(self).find_element("xpath","//android.widget.EditText[@content-desc='Password']",__method__)
    end

    def paypal_login_button
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Log In']",__method__)
    end

    def paypal_pay_button
      #FindersDef.new(self).find_element("xpath","//android.widget.LinearLayout/android.widget.TextView[@text='Pay']",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Pay']",__method__)


    end

    # PAYPAL OBJECTS

    # CONFIRMATION OBJECTS
    def confirmation_email
      FindersDef.new(self).find_element("id","text_header_email",__method__)
    end

    def confirmation_number
      FindersDef.new(self).find_element("id","text_conf_number",__method__)
    end

    def confirmation_shipping_info
      FindersDef.new(self).find_element("id","txt_shipping_info",__method__)
    end

    def confirmation_delivery_options
      FindersDef.new(self).find_element("id","txt_delivery_options",__method__)
    end

    def confirmation_payment_method
      FindersDef.new(self).find_element("id","txt_payment",__method__)
    end

    def confirmation_payment_value
      FindersDef.new(self).find_element("id","txt_payment_value",__method__)
    end

    def confirmation_promo_title
      FindersDef.new(self).find_element("id","txt_discount",__method__)
    end

    def confirmation_in_app_title
      FindersDef.new(self).find_element("id","heading",__method__)
    end

    def confirmation_in_app_dismiss
      FindersDef.new(self).find_element("id","dismiss",__method__)
    end

    def confirmation_header
      FindersDef.new(self).find_element("id","text_header_info",__method__)
    end

    def confirmation_header_email
      FindersDef.new(self).find_element("id","text_header_email",__method__)
    end

    def confirmation_header_text
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Confirmation Number']",__method__)
    end

    def confirmation_text_in_review
      FindersDef.new(self).find_element("id","text_in_review",__method__)
    end

    def confirmation_whats_next_header
      FindersDef.new(self).find_element("id","text_whats_next_header",__method__)
    end

    def confirmation_whats_next_text_1
      FindersDef.new(self).find_element("id","text_whats_next_p1",__method__)
    end

    def confirmation_whats_next_text_2
      FindersDef.new(self).find_element("id","text_whats_next_p2",__method__)
    end

    def confirmation_whats_next_text_3
      FindersDef.new(self).find_element("id","text_whats_next_p3",__method__)
    end

    # CONFIRMATION OBJECTS

    #Validation error messages
    def first_name_err_msg
      FindersDef.new(self).find_element("id","first_name_error_textview",__method__)
    end

    def last_name_err_msg
      FindersDef.new(self).find_element("id","last_name_error_textview",__method__)
    end

    def country_err_msg
      FindersDef.new(self).find_element("id","country_error_textview",__method__)
    end

    def address_err_msg
      FindersDef.new(self).find_element("id","address_line_error_textview",__method__)
    end

    def city_err_msg
      FindersDef.new(self).find_element("id","city_error_textview",__method__)
    end

    def state_err_msg
      FindersDef.new(self).find_element("id","state_error_textview",__method__)
    end

    def zip_err_msg
      FindersDef.new(self).find_element("id","zip_error_textview",__method__)
    end

    def phone_number_err_msg
      FindersDef.new(self).find_element("id","phone_number_error_textview",__method__)
    end

    def email_add_err_msg
      FindersDef.new(self).find_element("id","email_error_textview",__method__)
    end

    def store_location_textField
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/txt_store_info",__method__)
    end



    #Validation error messages
  end
end

# module Kernel
#   def pdp
#     DriverModules::CheckOut
#   end
# end