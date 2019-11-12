module CheckOutFunctionsDSL
  extend self

  def get_cart_items
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    names = cart_item_name_label
    fail("No items on cart") if names == nil
    platform_conditions = cart_item_platform_condition
    price_values = cart_item_price_value
    cart_items = []
    names.each_with_index { |n, i| n.text
    cart_items << {"name" => n.text, "platform_condition" => platform_conditions[i].text, "price" => price_values[i].text}
    }

    # $log.trace(cart_items)
    return cart_items
  end

  def change_quantity_in_cart(no_to_choose, item_index=0)
    $log.trace("CheckOutFunctionsDSL: #{__method__} to #{no_to_choose}")
    cart_item_quantity_dropdown[item_index].click
    cart_item_quantity_value(no_to_choose).click
  end

  def validate_single_prod_cart(prod_price, quantity)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    $log.trace(prod_price)
    $log.trace(quantity)
    new_totalitem_count = item_in_cart_label.text.delete("^0-9").to_i
    new_product_quantity = cart_item_quantity_selected_value[0].text.delete("^0-9").to_i
    new_cart_total = cart_total_value.text.delete("^0-9.").to_f
    expect(new_totalitem_count).to eq(quantity)
    expect(new_product_quantity).to eq(quantity)
    expect(new_cart_total).to eq((prod_price*quantity).round(2))
  end

  def validate_multiple_prod_cart(prices, quantities)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    new_totalitem_count = item_in_cart_label.text.delete("^0-9").to_i
    p_q = cart_item_quantity_selected_value
    prod_quantities = []
    p_q.each { |p| prod_quantities << p.text.delete("^0-9").to_i }
    scroll_to('Your Total')
    new_cart_total = cart_total_value.text.delete("^0-9.").to_f
    new_total = 0
    prices.each_with_index { |p, ind| new_total += p*quantities[ind] }
    expect(new_totalitem_count).to eq(quantities.sum)
    expect(prod_quantities).to eq(quantities)
    expect(new_cart_total).to eq(new_total.round(2))
  end

  # def clear_cart(device_type='samsung')
  #   $log.trace("CheckOutFunctionsDSL: #{__method__}")
  #   sleep 4
  #   if exists{cart_count}
  #     cart_icon.click
  #     sleep 5
  #     if cart_items_count_label
  #       loop do
  #
  #         cart_item_remove_link[0].click
  #         sleep 5
  #         yes_or_ok_link.click
  #         sleep 3
  #         break if cart_items_count_label == nil
  #       end
  #     end
  #     press_keycode(4)
  #
  #   end
  #
  # end

  def clear_cart
    sleep 5
    if exists{cart_count}
      cart_icon.click
      sleep 5

      while exists{cart_item_remove_link[0]}
        cart_item_remove_link[0].click
        sleep 5
        yes_or_ok_link.click
        sleep 3
      end
      #back_icon.click
      press_keycode(4)

    end

  end

  def clear_cart_preprod
    sleep 5
    if exists{cart_count_preprod}
      cart_icon_preprod.click
      sleep 5

      while exists{cart_item_remove_link_preprod[0]}
        cart_item_remove_link_preprod[0].click
        sleep 5
        yes_or_ok_link.click
        sleep 3
      end
      #back_icon.click
      press_keycode(4)

    end


  end







  def proceed_checkout_from_cart(test_data, close_app_on_co='false', new_data=nil)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    sleep 5
    cart_icon.click
    sleep 10
    click_header_button = true
    old_cart = cart_items_count_label
    cart_items = get_cart_items
    if old_cart
      old_cart_count = old_cart[0].text.delete("^0-9").to_i
      if click_header_button then
        $log.trace("Click checkout header button")
        cart_header_checkout_button.click
      else
        $log.trace("Click checkout footer button")
        cart_footer_checkout_button.click
      end
      check_error_on_page(false)
      returned_to_cart = perform_co_age_gate(test_data['is_18_above_co'])
      if returned_to_cart == true
        sleep 5
        new_cart = cart_items_count_label
        new_cart_count = new_cart[0].text.delete("^0-9").to_i
        $log.trace("Validate cart count after removing mature product")
        expect("cart count after removing mature prod: #{new_cart_count}").to eq("cart count after removing mature prod: #{old_cart_count-1}")
        if test_data['add_from_cart'] == 'true'
          $log.trace("Click back button")
          sleep 5
          press_keycode(4)
          search_and_perform_buy(test_data['user_role'], $search_data.get_all_data_from_row(new_data['search_keywords']), new_data['is_18_above_pdp'], 'true')
          sleep 5
          cart_icon.click
        end
        sleep 5
        click_header_button ? cart_header_checkout_button.click : cart_footer_checkout_button.click
      else
        new_cart_count_label = summ_item_in_cart_label.text
        new_cart_count = new_cart_count_label[0, 5].delete("^0-9").to_i
        $log.trace("Validate cart count is the same")
        expect("cart count after removing mature prod: #{new_cart_count}").to eq("cart count after removing mature prod: #{old_cart_count}")
      end
    else
      fail('Cant proceed checkout, no items on cart')
    end

    if test_data['return_to_cart'] == 'true'
      $log.trace("Click back button")
      sleep 5
      press_keycode(4)
      $log.trace("Click checkout button on cart")
      click_header_button ? cart_header_checkout_button.click : cart_footer_checkout_button.click
    end

    return cart_items
  end

  def perform_co_age_gate(is_mature_user)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    returned_to_cart = false
    if co_age_gate_container
      if is_mature_user == 'true'
        $log.trace("Click '17 or older' button")
        co_agate_mature_button.click
      else
        $log.trace("Click 'under 17' button")
        co_agate_immature_button.click
        sleep 5
        $log.trace("#{page_error[0].text}: #{page_error_message[0].text}")
        $log.trace("Click ok button on error message")
        yes_or_ok_link.click
        returned_to_cart = true
      end
    end

    $log.trace("Has returned to cart: #{returned_to_cart}")
    returned_to_cart
  end

  def get_items_on_checkout_page(co_page='summary')
    $log.trace("CheckOutFunctionsDSL: #{__method__} #{co_page}")
    names = summ_prod_name
    platform_conditions = summ_prod_platform_condition if co_page != 'Delivery'
    price_values = summ_prod_price
    quantity = summ_prod_quantity
    co_items = []
    names.each_with_index { |n, i|
      prod_name = n.text
      (co_page == 'Delivery') ? prod_platform_condition = '' : prod_platform_condition = platform_conditions[i].text
      prod_price = price_values[i].text
      if prod_platform_condition.include?('Download')
        prod_quantity = ''
      else
        prod_quantity = quantity[i].text
      end

      co_items << {"name" => prod_name, "platform_condition" => prod_platform_condition, "price" => prod_price, "quantity" => prod_quantity}

    }

    # $log.trace(co_items)
    return co_items
  end

  def add_shipping_details_from_summary(user_details, device_name=nil)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    summ_shipping_information_link.click
    sleep 5
    enter_user_details_on_shipping(user_details, device_name)
    $log.trace("save added shipping address")
    checkout_save_button[0].click
    # shipping_select_suggested.click # if tool_bar_title.text == 'SHIPPING VERIFICATION'
    # page_title = tool_bar_title.text
    # # $log.trace("Page title: #{page_title}")
    # expect("Page title: #{page_title}").to eq("Page title: SHIPPING VERIFICATION")
    $log.trace("select suggested address")
    suggested_rdbutton = shipping_select_suggested
    if suggested_rdbutton
      suggested_rdbutton ? suggested_rdbutton[0].click : tap_object(83, 466) #(111, 622)nexus6, (127, 708)samsungs6, (83, 466)nexus5x
    else
      check_error_on_page
    end

    check_error_on_page if summ_place_order_button == nil
  end

  def enter_user_details_on_shipping(user_details, device_name=nil)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    scroll_to('First Name')
    enter_text(shipping_first_name, user_details['firstname'])
    hide_keyboard
    enter_text(shipping_last_name, user_details['lastname'])
    hide_keyboard
    select_from_dropdown(shipping_country_dropdown, user_details['country'])
    enter_text(shipping_address, user_details['address'])
    hide_keyboard
    enter_text(shipping_city, user_details['city'])
    hide_keyboard
    select_from_dropdown(shipping_state_dropdown, user_details['state'])
    enter_text(shipping_zip_code, user_details['zip'])
    hide_keyboard
    scroll_to('SAVE')
    enter_text(shipping_phone_number, user_details['phonenumber'])
    hide_keyboard
    enter_text(shipping_email_address, user_details['email'])
    hide_keyboard
  end

  def select_delivery_option(deliv_option)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")

    deliv_options = summ_delivery_option_link
    if deliv_options
      deliv_options[0].click
    else
      delivery_options_tap(540, 576) #[(nil,878)samsung,(360,350)#cherry mobile
      sleep 8
    end

    deliv_links = delivery_option_link
    if deliv_links
      deliv_links.each_with_index { |d_link, index| click_object(d_link, deliv_option) if d_link.text.strip == deliv_option }
    end
  end

  def select_and_add_payment_method(test_data, cc_data)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    payment_link = summ_payment_information_link
    if payment_link
      payment_link[0].click
      sleep 5
    else
      payment_information_tap(540, 725) #(nil,1106)samsungS6
      sleep 10
    end
    # page_title = tool_bar_title.text
    # $log.trace("Page title: #{page_title}")
    # expect("Page title: #{page_title}").to eq("Page title: PAYMENT")

    if test_data['multi_prod']=='true' and test_data['user_role'] != 'gu'
      saved_payment_link
    else
      sleep 3
      select_payment_type(test_data)
      unless test_data['payment_type'] == 'paypal'
        add_credit_card_info(cc_data)

        unless test_data['user_role'] == 'gu'
          save_button = checkout_save_button
          (save_button) ? save_button[0].click : save_payment_tap(540, 631.5) #samsung(nil,1134)#(cherry(360,722)
        end

        $log.trace("test_data['is_ispu']: #{test_data['is_ispu']}")
        if (test_data['condition'] == 'Download' or test_data['is_ispu'] == 'true') then
          is_shipping_and_billing_same = false
        else
          is_shipping_and_billing_same = true
        end

        $log.trace("is_shipping_and_billing_same: #{is_shipping_and_billing_same}")
        if test_data['user_role'].include?('gu')
          payment_add_edit_address_link.click if cc_data['type'] == 'purcc'
          add_edit_address(is_shipping_and_billing_same, nil)
        end

        save_button = checkout_save_button
        (save_button) ? save_button[0].click : save_payment_tap(540, 979.5) #cherry(360,638)#samsung(nil,1502)

        check_error_on_page if summ_place_order_button == nil
      end
    end
  end

  def select_payment_type(test_data)
    if test_data['payment_type'] == 'paypal'
      $log.trace("Click 'Pay with Paypal'")
      paypal_link = payment_with_paypal_link
      if paypal_link
        paypal_link.each_with_index { |p_link, index| p_link.click if p_link.text.strip == 'Pay with PayPal' }
      else
        if test_data['user_role'] == 'gu'
          tap_object(540, 282) #(360, 179)cherry, (720,377)Nexus6, (720, 430)samsung
        else
          tap_object(540, 452) #(360, 302)cherry, (720, 617)nexus 6
        end
      end

    else
      $log.trace("Click 'Add New Credit Card'")
      add_cc_link = payment_add_new_cc_link

      if add_cc_link
        add_cc_link[0].click
      else
        if (test_data['user_role'] == 'gu') then
          tap_object(540, 452) #(720, 606)Nexus, (360, 296)cherry, (720, 690)samsungs6
        else
          tap_object(540, 524) #(360, 419)cherry, (720, 857)nexus6
        end
      end
    end
  end

  def add_credit_card_info(cc_info)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    # sleep 5
    # tap_object(630,378)
    sleep 5
    card_number_field = payment_cc_number_field
    if card_number_field
      enter_text(card_number_field[0], cc_info['number'])
    else
      $log.trace("Enter cc number: #{cc_info['number']}")
      tap_object(473, 311.5) #samsung(720,473)#(630,378)Nexus6, (306, 183)cherry
      cc_number = cc_info['number']
      cc_number.split('').each do |s|
        press_keycode(s.to_i + 7)
      end
    end
    unless cc_info['type'] == 'purcc'
      card_exp_field = payment_cc_exp_date_field
      if card_exp_field
        enter_text(card_exp_field[0], cc_info['expdate'])
      else
        $log.trace("Enter cc expiry: #{cc_info['expdate']}")
        tap_object(578, 311.5) #(375, 203)cherry, (772, 414)Nexus6, (882, 473)samsung
        cc_exp = cc_info['expdate']
        cc_exp.split('').each do |s|
          press_keycode(s.to_i + 7)
        end
      end

      card_cvv_field = payment_cc_cvv_field
      if card_cvv_field
        enter_text(payment_cc_cvv_field[0], cc_info['cvv'])
      else
        $log.trace("Enter cc cvv: #{cc_info['cvv']}")
        tap_object(809.5, 311.5) #(526, 203)cherry, (1080, 414)Nexus6, (1234, 473)samsungs6
        cc_cvv = cc_info['cvv']
        cc_cvv.split('').each do |s|
          press_keycode(s.to_i + 7)
        end
      end
    end
  end

  def add_edit_address(is_same_as_ship, user_billing_info)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    # $log.trace("Page title: #{tool_bar_title.text}")
    if is_same_as_ship
      $log.trace("Use same as shipping address")
      bill_same_as_ship_rdbutton.click
    else
      $log.trace("Add new billing address")
      add_user_billing_info(user_billing_info)
      save_button = checkout_save_button
      save_button ? save_button[0].click : save_payment_tap(540, 1538.5) #samsung(nil,1134)#(cherry(360,722)
    end
  end

  def add_user_billing_info(user_billing_info, device_name=nil)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    if device_name == 'samsung'
      search_button_x = 1306
      search_button_y = 2406
    end
    # scroll_to('First Name')
    enter_text(bill_first_name, 'Accept')
    enter_text(bill_last_name, 'Tester')
    select_from_dropdown(bill_country_dropdown, 'United States of America')
    enter_text(bill_address, '625 WESTPORT PRKWAY')
    enter_text(bill_city, 'GRAPEVINE')
    select_from_dropdown(bill_state_dropdown, 'Texas')
    enter_text(bill_zip_code, '76051')
    # search_button_tap(search_button_x,search_button_y)
    hide_keyboard
    scroll_to('SAVE')
    enter_text(bill_phone_number, '1234567890')
    # search_button_tap(search_button_x,search_button_y)
    hide_keyboard
    enter_text(bill_email_address, 'francisbarro@gamestop.com')
    # search_button_tap(search_button_x,search_button_y)
    hide_keyboard
    checkout_save_button[0].click
  end

  def add_gc_promo_purcc(test_data)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    promo_link = summ_promo_codes_link
    if (promo_link) then
      promo_link[0].click
    else
      if test_data['payment_type'] == 'paypal'
        tap_object(540, 1010) #(720, 1349) nexus 6
      else
        tap_object(540, 874) #(720, 1170)nexus6, (720, 1334)samsungs6
      end
      sleep 5
    end
    added_promo_gc_purcc = []
    added_promo_gc_purcc = add_promo_details(test_data, added_promo_gc_purcc)
    gc_data = {'gc_1' => [test_data['gc_number'], test_data['gc_pin']]}
    added_promo_gc_purcc = add_gc_details(test_data, added_promo_gc_purcc)
    add_purcc_details(test_data)

    sleep 5
    back
    # back_icon.click
  end

  def add_promo_details(test_data, p_list)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    if test_data['add_promo'] == 'true'
      promos_to_add = test_data['promo_code'].split(',')
      code_input = promo_code_input
      if code_input
        if promos_to_add.kind_of?(Array)
          promos_to_add.each { |c|
            enter_text(code_input[0], c)
            promo_code_add_icon.click
            sleep 8
          }
        else
          enter_text(code_input[0], promos_to_add)
          promo_code_add_icon.click
        end
      end
    end

    check_error_on_page unless test_data['promo_code'] == 'invalid'
    # sleep 15
    if test_data['add_promo'] == 'true' and test_data['promo_code'] != 'invalid'
      added_promos = added_promos_container
      gc_promo_titles = added_promos_gc_purcc_title
      added_promos ? added_promos_count = added_promos.size() : added_promos_count = 0
      expect("# of added promos: #{added_promos_count}").to eq("# of added promos: #{promos_to_add.length}")
      for i in 0..(added_promos_count-1)
        p_list << gc_promo_titles[i].text
      end

      # added_promos.each { |p| p_list << p.text }
      expect("added promo: #{p_list}").to eq("added promo: #{promos_to_add}")
    end

    if test_data['add_promo'] == 'true' and test_data['promo_code'] == 'invalid'
      p_error = page_error
      if p_error
        e_message = "#{p_error[0].text}: #{page_error_message[0].text}"
      else
        e_message = ""
      end
      expect(e_message).to eq("Error: The coupon you entered is not currently valid. Please check the spelling of the code and the expiration date of the coupon.")
    end

    return p_list
  end

  def add_gc_details(gc_data, promo_gc_list=[], validate_added_gc=false)
    $log.trace("CheckOutFunctionsDSL: #{__method__}, Do validation: #{validate_added_gc}")
    gc_list = []
    if gc_data['add_gc'] != nil and gc_data['add_gc'] == 'true'
      enter_text(gc_input, gc_data['gc_number'])
      enter_text(gc_pin, gc_data['gc_pin'])
      $log.trace("click add gc icon")
      gc_add_icon.click
      check_error_on_page

      gcs_to_add = gc_data['gc_number'].split(',')
      added_gcs = added_gc_container
      gc_promo_titles = added_promos_gc_purcc_title
      added_gcs ? added_promos_count = added_gcs.size() : added_promos_count = 0
      expect("# of added gc: #{added_promos_count}").to eq("# of added gc: #{gcs_to_add.length}")
      for i in 0..(added_promos_count-1)
        if promo_gc_list!= nil and promo_gc_list.include?(gc_promo_titles[i].text)
          is_in_list = true
        else
          is_in_list = false
        end

        if !is_in_list
          gc_list << gc_promo_titles[i].text
          if validate_added_gc
            last_four_digit = gcs_to_add[i].chars.last(4).join
            (gc_promo_titles[i].text.include?("Card ending #{last_four_digit} balance")) ?
                tc97174_passed = 'passed' :
                tc97174_passed = 'failed'
            expect("tc97174: Validate that balance is shown after successful entry of GC: #{tc97174_passed}").to eq("tc97174: Validate that balance is shown after successful entry of GC: passed")
          end
        end
      end
      # expect("added gc: #{gc_list}").to eq("added gc: #{gcs_to_add}")
      promo_gc_list.push(*gc_list) if promo_gc_list != nil
    end

    if (promo_gc_list != nil)
      return promo_gc_list
    else
      return gc_list
    end
  end

  def validate_added_gc_on_co_screen
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    applied_gc_on_co = confirmation_promo_title.text
    (applied_gc_on_co.include?('GC applied')) ? tc97175_passed = 'passed' : tc97175_passed = 'failed'
    (applied_gc_on_co.delete("^0-9.").to_f > 0) ? more_than_zero = true : more_than_zero = false
    expect("applied credit value is not equal to zero: #{more_than_zero}").to eq("applied credit value is not equal to zero: true")
    $log.trace("applied credit value is not equal to zero: #{more_than_zero}")
    expect("tc97175: Validate applied gc credit on checkout screen: #{tc97175_passed}").to eq("tc97175: Validate applied gc credit on checkout screen: passed")
    $log.trace("tc97175: Validate applied gc credit on checkout screen: #{tc97175_passed}")
  end

  def validate_max_number_of_gcs(test_data, added_gc)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    summ_promo_codes_link[0].click

    added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901215', 'gc_pin' => '7323'}, added_gc, false)
    # added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901223', 'gc_pin' => '7657'}, added_gc, false)
    # added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901231', 'gc_pin' => '2014'}, added_gc, false)
    # added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901249', 'gc_pin' => '8743'}, added_gc, false)
    # added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901256', 'gc_pin' => '2487'}, added_gc, false)
    scroll_to("PowerUp Rewards Trade Credit")
    added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901272', 'gc_pin' => '2178'}, added_gc, false)
    scroll_to("PowerUp Rewards Trade Credit")
    # added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901280', 'gc_pin' => '3764'}, added_gc, false)
    scroll_to("PowerUp Rewards Trade Credit")
    added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901298', 'gc_pin' => '0485'}, added_gc, false)
    # scroll_to("PowerUp Rewards Trade Credit")
    # added_gc = add_gc_details({'add_gc' => 'true', 'gc_number' => '6006493711999901306', 'gc_pin' => '3907'}, added_gc, false)

    gc_list = added_promos_gc_purcc_title
    (gc_list.size() > 3) ? tc97176_passed = 'passed' : tc97176_passed = 'failed'
    expect("tc97176: app allows entry more than 3 GC: #{tc97176_passed}").to eq("tc97176: app allows entry more than 3 GC: passed")
    $log.trace("tc97176: app allows entry more than 3 GC: passed")
  end

  def add_purcc_details(test_data)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    if test_data['add_purcc'] != nil and test_data['add_purcc'] == 'true'
      enter_text(purcc_input, test_data['purcc_number'])
      enter_text(purcc_pin, test_data['purcc_pin'])
      purcc_add_icon.click
    end
  end

  def remove_promo_gc(test_data, number_to_remove)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    promo_link = summ_promo_codes_link
    if (promo_link) then
      promo_link[0].click
    else
      if test_data['payment_type'] == 'paypal'
        tap_object(540, 1010) # (540, 874), (720, 1349nexus
      else
        tap_object(540, 874) #(720, 1334)samsungs6, (720, 1170) nexus6
      end
      sleep 5
    end

    added_promos = added_promos_gc_purcc_title
    added_promos ? added_promos_count = added_promos.size() : added_promos_count = 0

    for i in 0..(number_to_remove-1)
      remove_promo_icon[0].click
      sleep 8
    end
    new_promo = added_promos_gc_purcc_title
    new_promo ? new_promo_count = new_promo.size() : new_promo_count = 0

    expect("remaining promo: #{new_promo_count}").to eq("remaining promo: #{added_promos_count-number_to_remove}")
  end

  def place_order_by_footer_button
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    # click_object(summ_place_order_button_2, 'PLACE ORDER')
    summ_place_order_button_2.click
    e, inapp = check_error_on_page
    # $log.trace("Confirmation number: #{confirmation_number.text}")
    return e, inapp
  end

  def place_order_by_header_button(expect_error=false)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    if summ_place_order_button
      summ_place_order_button[0].click
    else
      sleep 10
      tap_object(903, 250.5) #(1170, 382)samsungs6, (605, 163)cherry, (1203, 334)nexus6, tap place order button
      sleep 5
    end

    e, inapp = check_error_on_page(expect_error)
    # $log.trace("Confirmation number: #{confirmation_number.text}")
    # puts "Confirmation number: #{confirmation_number.text}"
    return e, inapp
  end

  def continue_paypal_checkout

    pay_pal_email='bf_ecp1@qagsecomprod.oib.com'
    pay_pal_psword='T3sting!@#'
    sleep 5
    pay_with_paypal_button.click
    sleep 5

    if exists{paypal_email}
    paypal_email.clear
    enter_text(paypal_email, pay_pal_email)
    enter_text(paypal_pword, pay_pal_psword)
    paypal_login_button.click
    sleep 20

    end
    tap_object(420,706)
    sleep 2
    tap_object(540,960)
    sleep 2

    paypal_pay_button.click

    sleep 25


  end

  def continue_co_after_cart(test_data, shipping_data, card_data)
    sleep 5
    if test_data['user_role'] == 'gu'
      unless test_data['condition'] == 'Download'
        add_shipping_details_from_summary(shipping_data, test_data['device_name'])
        # select_delivery_option('Value')
      end
    end
    select_and_add_payment_method(test_data, card_data,)
    add_gc_promo_purcc(test_data) if test_data['add_gc'] =='true'
    place_order_by_header_button(false)
  end

  def continue_co_from_summary(test_data, shipping_data, card_data)
    if test_data['user_role'] == 'gu'
      unless test_data['condition'] == 'Download'
        add_shipping_details_from_summary(shipping_data, test_data['device_name'])
        # select_delivery_option('Value')
      end
    end
    select_and_add_payment_method(test_data, card_data,) if test_data['user_role'] == 'gu' or test_data['payment_type'] == 'paypal'
    add_gc_promo_purcc(test_data) if (test_data['add_gc'] =='true' or test_data['add_promo'] =='true' or test_data['add_purcc'] =='true')

    validate_values_on_summary(test_data['add_promo']) if test_data['add_promo'] == 'true' and !test_data['promo_level'].include?('Shipping')

    if test_data['add_promo'] == 'true' and !test_data['promo_level'].include?('Shipping') then
      e, has_inapp = place_order_by_footer_button
    else
      e, has_inapp = place_order_by_header_button(false)
    end
    e, has_inapp = continue_paypal_checkout('bf_gsdc11@qagsecomprod.oib.com', 'T3sting!@#') if (test_data['payment_type'] == 'paypal')

    # confirmation_in_app_dismiss.click if exists { confirmation_in_app_title }
    close_inapp_review(has_inapp)

    $log.trace("Confirmation number: #{confirmation_number.text}")
    validate_values_on_summary(test_data['add_promo']) if test_data['add_promo'] == 'true' and !test_data['promo_level'].include?('Shipping')
  end

  def perform_complete_guest_checkout(test_data, shipping_data, card_data)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    test_data['user_role'].include?('reject') ? error_on_submission = true : error_on_submission = false
    search_and_select_first_result(test_data)
    prod_details = get_prod_details_from_pdp(test_data, test_data['user_role'])

    #disable validate price label 10.29.2018
    #validate_price_label(test_data, prod_details)
    #end comment

    # validate_overlay_on_pdp(prod_details)
    checkout_from_pdp(test_data)
    if summ_place_order_button == nil
      for i in 0..10
        checkout_from_pdp(test_data, 'true')
        proceed_co_button = summ_place_order_button
        break if proceed_co_button
        fail("Unable to proceed checkout via CHECKOUT NOW button") if proceed_co_button == nil and i == 10
      end
    end

    unless test_data['condition'] == 'Download'
      add_shipping_details_from_summary(shipping_data, test_data['device_name'])
      # select_delivery_option('Value')
    end

    # select_delivery_option('Value')
    select_and_add_payment_method(test_data, card_data,)

    #/'gc', '6006493711999901256', '2487'
    add_gc_promo_purcc(test_data) if (test_data['add_gc'] =='true' or test_data['add_promo'] =='true' or test_data['add_purcc'] =='true')
    validate_values_on_summary(test_data['add_promo']) if test_data['add_promo'] == 'true' and !test_data['promo_level'].include?('Shipping')

    if test_data['add_promo'] == 'true' and !test_data['promo_level'].include?('Shipping')
      error_message, has_inapp = place_order_by_footer_button
    else
      error_message, has_inapp = place_order_by_header_button(error_on_submission)
    end

    e, has_inapp = continue_paypal_checkout('bf_gsdc11@qagsecomprod.oib.com', 'T3sting!@#') if (test_data['payment_type'] == 'paypal')
    if error_on_submission
      expect(error_message).to eq('Error: The credit card billing information you entered does not match the information on file at your financial institution. Prior to placing a new order, please verify your billing information with your financial institution to ensure all information is accurate and up to date.')
    else
      # confirmation_in_app_dismiss.click if exists { confirmation_in_app_title }
      close_inapp_review(has_inapp)
      validate_summary_verbiage(test_data, shipping_data)
      validate_values_on_summary(test_data['add_promo']) if test_data['add_promo'] == 'true' and !test_data['promo_level'].include?('Shipping')
      validate_whats_next
    end
  end

  def go_to_home_from_pdp
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    sleep 10
    $log.trace("click device back button")
    press_keycode(4)
    if exists{deny_location_button}
      $log.trace("Click deny location")
      deny_location_button.click
    end
    sleep 5
    $log.trace("click device back button")
    press_keycode(4)
    if exists{deny_location_button}
      $log.trace("Click deny location")
      deny_location_button.click
    end
    # press_keycode(AndroidApp.KEYCODE_BACK)
    sleep 5
    $log.trace("click device back button")
    press_keycode(4)
    sleep 5
    # press_keycode(4)
    $log.trace("hide device keyboard")
    hide_keyboard

    sleep 5
    $log.trace("click device back button")
    press_keycode(4)
  end


  def go_to_home_from_co(number_of_pdp=1)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    sleep 10
    press_keycode(4)
    for i in 1..number_of_pdp
      go_to_home_from_pdp
    end
  end

  def calculate_sub_total_value
    product_prices = summ_prod_price
    product_quantities = summ_prod_quantity
    sub_total = 0
    # $log.trace("prod size: #{product_prices.size()}")
    product_prices.each_with_index do |price, index|
      single_prod_price = price.text.slice!(price.text.index('$')..price.text.length).delete("^0-9.").to_f
      prod_multiplier = product_quantities[index].text.delete("^0-9.").to_f #.to_i #.delete("^0-9.").to_f
      # $log.trace("prodPrice: #{single_prod_price}, quantity: #{prod_multiplier}")
      sub_total = sub_total + (single_prod_price * prod_multiplier)
      # $log.trace("temp calculated sub total: #{sub_total}")
    end if product_prices
    # $log.trace("final calculated sub total: #{sub_total}")
    sub_total
  end

  def calculate_order_total(sub_, ship_, dis_, tax_)
    calculated_order_total = sub_ + ship_ - dis_ + tax_
    # $log.trace("calculated order total: #{calculated_order_total}")
    calculated_order_total
  end

  def proceed_ispu_from_pdp_to_cart
    $log.trace("CheckOutFunctionsDSL: #{__method__}")
    cart_icon.click
    check_error_on_page
    ispu_rb = cart_puas_rb
    ispu_rb ? ispu_rb[0].click : fail("no ispu rb in cart")
    check_error_on_page
    cart_header_checkout_button.click
    check_error_on_page
  end

  #Validations
  def validate_values_on_summary(has_promo)
    $log.trace("CheckOutFunctionsDSL: #{__method__}")

    scroll_to("Order Total")
    summary_sub_total = summ_sub_total.text.delete("^0-9.").to_f
    summary_shipping = summ_shipping_price.text.delete("^0-9.").to_f
    if (has_promo == 'true') then
      summary_discount = summ_discount_price.text.delete("^0-9.").to_f
      expect("Promo value: #{summary_discount}").not_to be("Promo value: 0")
    else
      summary_discount = 0
    end
    summary_tax = summ_estimated_tax.text.delete("^0-9.").to_f
    summary_order_total = summ_order_total.text.delete("^0-9.").to_f
    # $log.trace("#{summary_sub_total},, #{summary_shipping},, #{summary_discount},, #{summary_tax},, #{summary_order_total}")

    expect("subtotal: #{'%.2f' % summary_sub_total}").to eq("subtotal: #{'%.2f' % calculate_sub_total_value}")
    expect("order total: #{'%.2f' % summary_order_total}").to eq("order total: #{'%.2f' % calculate_order_total(summary_sub_total, summary_shipping, summary_discount, summary_tax)}")
    calculate_sub_total_value
  end

  def validate_summary_verbiage(test_data, user_details)
    $log.trace("CheckOutValidationsDSL: #{__method__}")
    confirm_header = confirmation_header.text
    $log.trace("Confirmation header: #{confirm_header}")
    expect(confirm_header).to eq('THANK YOU!')
    confirm_header_email = confirmation_header_email.text
    expect(confirm_header_email).to eq("Your order is complete. A copy of the receipt has been sent to #{user_details['email']}")
    $log.trace("Confirmation header email: #{confirm_header_email}")
    $log.trace("Confirmation number: #{confirmation_number.text}")

    case test_data['user_role']
      when /review/
        confirm_in_review_text = confirmation_text_in_review.text
        expect(confirm_in_review_text).to eq('You have not been billed yet. We are reviewing your order. We will notify you by email when the order status changes.')
        $log.trace("Confirmation review status: #{confirm_in_review_text}")
      else
        in_review_text_exist = exists { confirmation_text_in_review }
        fail("#{user_details['name']} should not have in review text") if in_review_text_exist
    end
  end

  def validate_error_validation
    $log.trace("CheckOutValidationsDSL: #{__method__}")
    is_err_msg = exists { first_name_err_msg }
    expect("tc97166: error on first name field: #{is_err_msg}").to eq("tc97166: error on first name field: true")
    expect("tc97166: error msg on fname: '#{first_name_err_msg.text}'").to eq("tc97166: error msg on fname: 'Please enter a valid first name.'")

    is_err_msg = exists { last_name_err_msg }
    expect("tc97166: error on last name field: #{is_err_msg}").to eq("tc97166: error on last name field: true")
    expect("tc97166: error msg on lname: '#{last_name_err_msg.text}'").to eq("tc97166: error msg on lname: 'Please enter a valid last name.'")

    is_err_msg = exists { country_err_msg }
    expect("tc97166: error on country field: #{is_err_msg}").to eq("tc97166: error on country field: true")
    expect("tc97166: error msg on country: '#{country_err_msg.text}'").to eq("tc97166: error msg on country: 'Required.'")

    is_err_msg = exists { address_err_msg }
    expect("tc97166: error on address field: #{is_err_msg}").to eq("tc97166: error on address field: true")
    expect("tc97166: error msg on address: '#{address_err_msg.text}'").to eq("tc97166: error msg on address: 'Please enter a valid address.'")

    is_err_msg = exists { city_err_msg }
    expect("tc97166: error on city field: #{is_err_msg}").to eq("tc97166: error on city field: true")
    expect("tc97166: error msg on city: '#{city_err_msg.text}'").to eq("tc97166: error msg on city: 'Please enter a valid city.'")

    is_err_msg = exists { state_err_msg }
    expect("tc97166: error on state field: #{is_err_msg}").to eq("tc97166: error on state field: true")
    expect("tc97166: error msg on state: '#{state_err_msg.text}'").to eq("tc97166: error msg on state: 'Required.'")

    is_err_msg = exists { zip_err_msg }
    expect("tc97166: error on zip field: #{is_err_msg}").to eq("tc97166: error on zip field: true")
    expect("tc97166: error msg on zip: '#{zip_err_msg.text}'").to eq("tc97166: error msg on zip: 'Please enter a valid postal code.'")

    scroll_to('SAVE')

    is_err_msg = exists { phone_number_err_msg }
    expect("tc97166: error on phonenumber field: #{is_err_msg}").to eq("tc97166: error on phonenumber field: true")
    expect("tc97166: error msg on phonenumber: '#{phone_number_err_msg.text}'").to eq("tc97166: error msg on phonenumber: 'Please enter a valid phone number.'")

    s_err_msg = exists { email_add_err_msg }
    expect("tc97166: error on emailad field: #{is_err_msg}").to eq("tc97166: error on emailad field: true")
    expect("tc97166: error msg on emailad: '#{email_add_err_msg.text}'").to eq("tc97166: error msg on emailad: 'Please enter a valid email address.'")
    $log.trace("tc97166: Validate that error message are displayed for each fields that fails validation: passed")
  end

  def validate_whats_next
    $log.trace("CheckOutValidationsDSL: tc100853 #{__method__}")
    scroll_to(("What's Next?"))
    scroll_to("serves as your receipt")
    next_header = confirmation_whats_next_header.text
    $log.trace("#{next_header}")
    expect(next_header).to eq("What's Next?")
    next_text_1 = confirmation_whats_next_text_1.text
    expect(next_text_1).to eq("Within the next hour, we will send you an e-mail confirming receipt of your order. Once your order has shipped, you will receive a second e-mail detailing the contents of the shipment and tracking information.")
    $log.trace("#{next_text_1}")
    next_text_2 = confirmation_whats_next_text_2.text
    expect(next_text_2).to eq("You will not be billed until the order ships. If you have preordered digital products, you will not be billed until item is available for download.")
    $log.trace("#{next_text_2}")
    next_text_3 = confirmation_whats_next_text_3.text
    expect(next_text_3).to eq("The packing slip included in each shipment also serves as your receipt.")
    $log.trace("#{next_text_3}")
  end

  def error_validation_for_zip
    errors = page_error
    (errors.size() > 0) ? error_exists = true : error_exists = false
    expect("There is an error on adding zip: #{error_exists}").to eq("There is an error on adding zip: true")
    expect("#{page_error_message[0].text}").to eq("Please enter a valid Zip/postal code in the format ##### or #####-####.")
  end

  def paypal_display_on_summary
    payment_type = summ_payment_type.text
    (payment_type == 'PayPal') ? tc97182_passed = true : tc97182_passed = false
    tc97182_passed ? $log.trace("tc97182: paypal is dislayed: passed") : fail("tc97182: paypal is dislayed - FAILED")
  end

  def validate_gc_paypal_disclaimer
    gc_disclaimer_exists = exists { gc_paypal_disclaimer }
    gc_disclaimer_exists ? tc97184_passed = true : tc97184_passed = false
    tc97184_passed ?
        $log.trace("tc97184: gc_paypal disclaimer is displayed: passed") :
        fail("tc97184: gc_paypal disclaimer is displayed -  FAILED")
  end

  def validate_pur_paypal_disclaimer
    pur_disclaimer_exists = exists { pur_paypal_disclaimer }
    pur_disclaimer_exists ? tc97185_passed = true : tc97185_passed = false
    tc97185_passed ?
        $log.trace("tc97185: pur_paypal disclaimer is displayed: passed") :
        fail("tc97185: pur_paypal disclaimer is displayed - FAILED")
  end

  def validate_paypal_unselect
    summ_payment_information_link[0].click
    sleep 5
    payment_types = payment_with_paypal_link
    payment_types.each do |p|
      if p.text.strip != 'Pay with PayPal'
        p.click
        break
      end
    end
    sleep 5
    payment_type = summ_payment_type.text
    (payment_type != 'PayPal') ? tc97183_passed = true : tc97183_passed = false
    tc97183_passed ?
        $log.trace("tc97183: paypal can be unselected: passed") :
        fail("tc97183: paypal option can be unselected - FAILED")
  end

  def validate_prod_details_on_summ_and_deliv(prod_details)
    validate_prod_details_in_checkout(prod_details, 'Summary')
    summ_delivery_option_link[0].click
    validate_prod_details_in_checkout(prod_details, 'Delivery')
    press_keycode(4)
  end

  def validate_prod_details_in_checkout(prod_details, page_name)
    $log.trace("CheckOutValidationsDSL: #{__method__} #{page_name}")
    scroll_to("Cart Subtotal") unless page_name == 'Delivery'
    co_items = get_items_on_checkout_page(page_name)
    validate_prod_details(prod_details, co_items, page_name)
  end

  def validate_prod_details(expected_details, actual_details, page_name)
    expect("#{page_name}- prod name: #{actual_details[0]['name']}").to eq("#{page_name}- prod name: #{expected_details['name']}")
    summ_prod_price = actual_details[0]["price"].slice!(actual_details[0]["price"].index('$')..actual_details[0]["price"].length).delete("^0-9.").to_f
    expect("#{page_name}- product price: #{summ_prod_price}").to eq("#{page_name}- product price: #{expected_details['price'].delete('^0-9.').to_f}")
  end

  def validate_default_promo_for_user(user_role, prod_condition)
    added_promos = summ_added_promo_title
    has_promo = false
    if (added_promos.size() > 0) then
      added_promos.each { |p|
        if p.text.squish != 'Promo Codes, Trade Credit or Gift Cards'
          has_promo = true
        end
      }
    end

    must_have_promo = false
    if user_role == 'purpro' or user_role == 'purelite'
      must_have_promo = true if prod_condition == 'Pre-Owned' or prod_condition == 'Refurbished'
    end

    $log.trace("must_have_promo: #{must_have_promo},,has_promo: #{has_promo} ")
    fail("tc80989: there should not be default promo for #{user_role} and #{prod_condition} product") if has_promo and !must_have_promo
    fail("tc68792: there should be default promo for #{user_role} and #{prod_condition} product") if !has_promo and must_have_promo

    if has_promo
      promo_text = added_promos[0].text
      elite_promo_message = 'PowerUp Rewards Elite Pro(TM) Pre-owned'
      promo_text.include?(elite_promo_message) ? has_elite_messaging = true : has_elite_messaging = false
    end

    fail("tc127112: there should be promo messaging for #{user_role}") if has_promo and user_role == 'purelite' and prod_condition == 'Pre-Owned' and !has_elite_messaging
    fail("tc127112: there should be NO promo messaging for #{user_role}") if has_promo and user_role != 'purelite' and has_elite_messaging
  end

  #== common functions
  #NOTE:TODO, put this functions in a common function file

  def select_from_dropdown(drop_down, text_value)
    $log.trace("CommonFunctionsDSL: #{__method__} : #{text_value}")
    drop_down.click
    scroll_to(text_value)
    # Appium::Android::scroll_to_exact(text_value)
    for i in 0..(drop_down_list_items.size()-1)
      if drop_down_list_items[i].text == text_value
        return drop_down_list_items[i].click
      end
    end
  end

  def enter_text(object, text)

    $log.trace("enter text: #{text}")

    object.click
    object.send_keys(text)

  end

  def click_object(object, text)
    scroll_to(text)
    object.click
  end

  def check_error_on_page(expect_error=false)
    $log.trace("CommonFunctionsDSL: #{__method__}")

    has_inapp_review = false
    has_error = false
    e_message = nil

    p_error = page_error
    if p_error then
      has_error = true
      e_message = "#{p_error[0].text.strip}: #{page_error_message[0].text}"
      $log.trace(e_message)
    else
      if app_modal_message
        modal_msg = app_modal_message[0].text.squish
        $log.trace(modal_msg)
        has_inapp_review = true if modal_msg == 'Do you love this app?'
      end
    end

    fail(e_message) if expect_error == false and has_error == true
    fail("expecting an error message but did not appear") if expect_error and has_error == false

    # $log.trace("e_message: #{e_message}, has_inapp_review: #{has_inapp_review}")
    return e_message, has_inapp_review
  end

  def close_inapp_review(has_inapp)
    $log.trace("CommonFunctionsDSL: #{__method__} : #{has_inapp}")
    if has_inapp
      app_modal_close_button[0].click
    end
  end


  def get_keycode_number(num)
    case num
      when '0'
        7
      when '1'
        8
      when '2'
        9
      when '3'
        10
      when '4'
        11
      when '5'
        12
      when '6'
        13
      when '7'
        14
      when '8'
        15
      when '9'
        16
      else
        $log.trace("invalid number")
    end
  end


  def checkout_page_Payment(cc_OR_paypal)

    checkout_payment_icon.click
    sleep 10
    page_scroll_down(0.80,0.50)

    case cc_OR_paypal.downcase

    when
          'cc'
              sleep 5
              page_scroll_down(0.95,0.50)
              bops_add_new_credit_card_icon.click
              sleep 5

    when  'paypal'
              pay_with_paypal_link.click
              sleep 5


    end

  end


  def available_pur_credit_applied(pur_trade_credit)
    pur_creditCB.click
    sleep 5
    if exists{purcc_enter_the_pin_text}
      purcc_rewards_pin_CB1.click
      pin_num = pur_trade_credit.split('#')[1]
      pin_num.split('').each do |ccn|
        press_keycode(ccn.to_i + 7)
      end

      purccReward_add_icon.click

      sleep 5
    end
  end


  #== common functions
end

