module PDPFunctionsDSL
  extend self




  def get_prod_details_from_pdp(test_data, user_role)
    $log.trace("PDPFunctionsDSL: #{__method__}")
    details = {}
    details['name'] = prod_name[0].text
    details['platform'] = prod_platform.text
    (exists(10) { prod_release_date }) ? details['release_date'] = prod_release_date.text : details['release_date'] = ''

    details['is_in_stock'] = test_data['is_in_stock']
    details['condition'] = test_data['condition']

    reg_price, pur_price = get_price_for_test_data(user_role, test_data)
    details['price'] = reg_price
    details['pur_price'] = pur_price

    # $log.trace(details)

    print("\r\nProduct Details: #{details.inspect}\r\n")
    return details
  end

  def add_to_cart(test_data, is_18_above_pdp, is_passed_age_gate=nil)
    $log.trace("PDPFunctionsDSL: #{__method__}")
    scroll_to('DETAILS')
    container_description = click_buy_order_button(test_data)
    (container_description == 'agegate') ?
        passed_age_gate = perform_age_gate_on_pdp(test_data, is_18_above_pdp, is_passed_age_gate) :
        passed_age_gate = nil
    if passed_age_gate or passed_age_gate == nil
      if exists { buttons_container }
        pdp_continue_shopping.click
        # if exists { add_to_cart_button }
        #   $log.trace("Click 'Add to Cart' button")
        #   click_object(add_to_cart_button, 'ADD TO CART')
        # else
        #   $log.trace("Click Buy Online radiobutton")
        #   click_object(buy_online_radiobutton, 'Buy Online')
        #   $log.trace("Click 'Add to Cart' button")
        #   click_object(add_to_cart_button, 'ADD TO CART')
        # end
        sleep 5
      else
        fail("age gate prompt buttons did not pop-up after clicking buy button")
      end
    end
    return passed_age_gate
  end

  def add_to_cart_random_prod_condition
    $log.trace("PDPFunctionsDSL: #{__method__}")
    test_data = {}
    scroll_to('DETAILS')
    # swipe(540, 1100, 0, -70)
    # if exists { pdp_add_to_cart_button }
    # #   test_data['condition'] = 'New'
    # #   test_data['is_in_stock'] = 'true'
    # # elsif exists { buy_digital_instock_button }
    # #   test_data['condition'] = 'Download'
    # #   test_data['is_in_stock'] = 'true'
    # # elsif exists { buy_used_instock_button }
    # #   test_data['condition'] = 'Pre-Owned'
    # #   test_data['is_in_stock'] = 'true'
    # # elsif exists { buy_new_preorder_button }
    # #   test_data['condition'] = 'New'
    # #   test_data['is_in_stock'] = 'false'
    # # elsif exists { buy_digital_preorder_button }
    # #   test_data['condition'] = 'Download'
    # #   test_data['is_in_stock'] = 'false'
    #   pdp_add_to_cart_button.click
    # else
    #   fail("no 'ADD TO CART' button on pdp")
    # end

    old_cart_count = 0
    # swipe(540, 1100, 0, -85)
    click_buy_button(test_data)
    older_than_seventeen_button.click if exists { older_than_seventeen_button }
    buy_online_radiobutton.click if exists { buy_online_radiobutton }
    pdp_continue_shopping.click
    # add_to_cart_button.click
    #
    # new_cart = cart_count
    # (new_cart) ? new_cart_count = new_cart[0].text.to_i : new_cart_count = 0
    #
    # if new_cart_count == old_cart_count
    #   for i in 1..5
    #     click_buy_button(test_data)
    #     older_than_seventeen_button.click if exists { older_than_seventeen_button }
    #     buy_online_radiobutton.click if exists { buy_online_radiobutton }
    #     add_to_cart_button.click
    #     new_cart = cart_count
    #     (new_cart) ? new_cart_count = new_cart[0].text.to_i : new_cart_count = 0
    #     break if new_cart_count > old_cart_count
    #   end
    # end

  end

  def checkout_from_pdp(test_data, is_18_above_pdp=nil, is_passed_age_gate=nil)
    $log.trace("PDPFunctionsDSL: #{__method__}")
    # swipe(540, 1100, 0, -85)
    scroll_to('DETAILS')
    container_description = click_buy_order_button(test_data, is_passed_age_gate)

    (container_description == 'agegate') ?
        passed_age_gate = perform_age_gate_on_pdp(test_data, is_18_above_pdp, is_passed_age_gate) :
        passed_age_gate = nil

    if passed_age_gate or passed_age_gate == nil
      # if container_description == 'checkoutprompt'
      if exists { buttons_container }
        # if exists { buy_checkout_button }
        #   $log.trace("Click Checkout Now button")
        #   click_object(buy_checkout_button, 'CHECKOUT NOW')
        # else
        #   $log.trace("Click Buy Online radiobutton")
        #   click_object(buy_online_radiobutton, 'Buy Online')
        #   $log.trace("Click Checkout Now button")
        #   click_object(buy_checkout_button, 'CHECKOUT NOW')
        # end
        pdp_checkout_now.click
        check_error_on_page
      else
        fail("checkout prompt buttons did not pop-up after clicking buy button")
      end
    end
    return passed_age_gate
  end

  def click_buy_order_button(test_data, is_passed_age_gate=nil)
    $log.trace("PDPFunctionsDSL: #{__method__} #{test_data['condition']}")
    container_description = ''
    # swipe(540,1100,0,-30)
    click_buy_button(test_data)

    if (test_data['is_mature'] == 'true')
      $log.trace("look for age gate, is passed age gate once : #{is_passed_age_gate}")
      if !is_passed_age_gate
        look_for_age_gate_first = true
      else
        look_for_age_gate_first = false
      end
    else
      look_for_age_gate_first = false
    end

    if look_for_age_gate_first
      if age_gate_container == nil
        for i in 1..10
          click_buy_button(test_data)
          break if age_gate_container
          fail("Age gate prompt not showing after clicking buy button") if i == 10 and age_gate_container == nil
        end
      end
      container_description = 'agegate'
    else
      if !exists { buttons_container }
        for i in 1..10
          click_buy_button(test_data)
          bt_container = exists { buttons_container }
          break if bt_container
          fail("CheckOut prompt not showing after clicking buy button") if i == 10 and !bt_container
        end
      end
      container_description = 'checkoutprompt'
    end
    return container_description
  end

  def click_buy_button(test_data)
    # scroll_to('ADD TO CART')
    # # scroll_to(test_data['condition'])
    # # scroll_to('DETAILS')
    # if test_data['is_in_stock'] == 'false'
    #   (test_data['condition'] == 'New') ?
    #       click_object(buy_new_preorder_button, 'PRE-ORDER') :
    #       click_object(buy_digital_preorder_button, 'PRE-ORDER')
    # else
    #   if test_data['condition'] == 'New'
    #     click_object(buy_new_instock_button, 'BUY')
    #   elsif (test_data['condition'] == 'Pre-Owned' or test_data['condition'] == 'Refurbished')
    #     # buy_used_instock_button.click
    #     click_object(buy_used_instock_button, 'BUY')
    #   else
    #     click_object(buy_digital_instock_button, 'BUY')
    #   end
    # end
    # swipe(540, 1100, 0, -15)
    pdp_add_to_cart_button.click
  end

  def perform_age_gate_on_pdp(test_data, is_18_above_pdp, passed_age_gate = nil)
    if test_data['is_mature'] == 'true'
      age_gate_buttons = age_gate_container
      if age_gate_buttons
        unless passed_age_gate
          if is_18_above_pdp == 'true'
            $log.trace("Click older than 17 button")
            older_than_seventeen_button.click
            passed_age_gate = true
          else
            $log.trace("Click 17 and younger button")
            younger_than_eighteen_button.click
            passed_age_gate = false
          end
        else
          fail("PDP age gate is prompted before therefore it should not again this time")
        end
      else
        fail("PDP age gate is not prompted for mature product #{test_data['search_keywords']}")
      end
    end
    # end
    $log.trace("check for age gate =#{passed_age_gate}")
    passed_age_gate
  end

  def search_and_perform_buy(user_role, test_data, is_18_above_pdp, is_add_to_cart='false', passed_age_gate = nil)
    search_and_select_first_result(test_data)
    prod_details = get_prod_details_from_pdp(test_data, user_role)
    old_cart = cart_count
    if is_add_to_cart == 'true'
      (old_cart) ? old_cart_count = old_cart[0].text.to_i : old_cart_count = 0
      $log.trace("old cart count: #{old_cart_count}")
      passed_pdp_gate = add_to_cart(test_data, is_18_above_pdp, passed_age_gate)
      sleep 15
      new_cart = cart_count
      (new_cart) ? new_cart_count = new_cart[0].text.to_i : new_cart_count = 0
      $log.trace("new cart count: #{new_cart_count}")
      if old_cart_count >= new_cart_count
        for i in 0..10
          passed_pdp_gate = add_to_cart(test_data, is_18_above_pdp, passed_pdp_gate)
          sleep 15
          new_cart = cart_count
          (new_cart) ? new_cart_count = new_cart[0].text.to_i : new_cart_count = 0
          break if new_cart_count == (old_cart_count+1)
        end
      end
    else
      passed_pdp_gate = checkout_from_pdp(test_data, is_18_above_pdp, passed_age_gate)
      if summ_place_order_button == nil and is_18_above_pdp == 'true'
        for i in 0..10
          passed_pdp_gate = checkout_from_pdp(test_data, is_18_above_pdp, passed_pdp_gate)
          proceed_co_button = summ_place_order_button
          break if proceed_co_button
          fail("Unable to proceed checkout via CHECKOUT NOW button") if proceed_co_button == nil and i == 10
        end
      end
    end

    # $log.trace(prod_details)
    return prod_details, passed_pdp_gate
  end

  def has_puas_link
    has_link = false
    links = puas_links
    links.each do |item|
      # puts item.text
      has_link = true if (item.text == 'PICK UP AT STORE' or item.text == 'PRE-ORDER FOR PICK UP AT STORE')
    end if links
    has_link
  end

  def add_to_library(tab_name)
    $log.trace("PDPFunctionsDSL: #{__method__} #{tab_name}")
    add_to_lib_tag = prod_library_tag

    if add_to_lib_tag.text.squish == 'ADD TO MYLIBRARY'
      fail("Product already added to #{add_to_lib_tag.text.squish} library")
    else
      add_to_lib_tag.click
    end

    case tab_name
      when 'I HAD'
        add_to_i_had_button.click
      when 'I WANT'
        add_to_i_want_button.click
      else
        add_to_i_have_button.click
    end
  end

  def scoll_to_add_to_cart
    if exists{pdp_add_to_cart_button}
      swipe(540, 1100, 0, -15)
    else
      for i in 1..10
        swipe(540, 1100, 0, -15)
        if exists{pdp_add_to_cart_button}
          sleep 10
          swipe(540, 1100, 0, -15)
          break
        end
      end
    end
  end

  def scroll_to_details
    if exists{pdp_add_to_cart_button}
      swipe(540, 1100, 0, -15)
    else
      for i in 1..10
        swipe(540, 1100, 0, -15)
        if exists{pdp_add_to_cart_button}
          sleep 10
          swipe(540, 1100, 0, -15)
          break
        end
      end
    end
  end

  #==== PDP Validations
  def validate_my_library_objects
    $log.trace("PDPValidations: #{__method__}")
    # scroll_to("VIEW MY LIBRARY")
    my_library_label = add_to_library_label
    i_have_button = add_to_i_have_button
    i_want_button = add_to_i_want_button
    i_had_button = add_to_i_had_button
    view_library_button = view_my_lib_button
    $log.trace("#{my_library_label.text}")
    $log.trace("#{i_have_button.text} | #{i_want_button.text} | #{i_had_button.text}")
    $log.trace("#{view_library_button.text}")

    expect(my_library_label.text).to eq("Add to My Library")
    expect("#{i_have_button.text} | #{i_want_button.text} | #{i_had_button.text}").to eq("I HAVE | I WANT | I HAD")
    expect(view_library_button.text).to eq("VIEW MY LIBRARY")
  end

  def validate_price_label(test_data, actual_prod_details)
    $log.trace("TC128285: #{__method__}")
    # $log.trace("actual_prod_details: #{actual_prod_details}")
    if actual_prod_details['pur_price'] != nil
      has_pur_price_label = true
    else
      has_pur_price_label = false
    end


    # if actual_prod_details['condition'] == 'Pre-Owned' and test_data['user_role'] != 'purpro' and test_data['user_role'] != 'gu' then
    #   must_have_pur_price_label = false
    # else
    #   must_have_pur_price_label = true
    # end

    case test_data['user_role']
      when /gu/
        must_have_pur_price_label = true if actual_prod_details['condition'] == 'Pre-Owned'
      when 'purpro'
        must_have_pur_price_label = true if actual_prod_details['condition'] == 'Pre-Owned'
      else
        must_have_pur_price_label = false
    end


    fail("Must not have pur price label for #{actual_prod_details['name']}") if !must_have_pur_price_label and has_pur_price_label
    fail("Should have pur price label for #{actual_prod_details['name']}") if must_have_pur_price_label and !has_pur_price_label


    if must_have_pur_price_label and has_pur_price_label
      pur_price = actual_prod_details['pur_price'].match(/\$[\d.]+/)[0]
      pur_price_label = actual_prod_details['pur_price'].squish
      reg_price = actual_prod_details['price'].match(/\$[\d.]+/)[0]
      reg_price_label = actual_prod_details['price'].squish
      # $log.trace("pur_price_label: #{pur_price_label}")
      # $log.trace("reg_price_label: #{reg_price_label}")

      case test_data['user_role']
        when 'purpro'
          # expect(pur_price_label).to eq("#{pur_price} Pro Price")
          # expect(reg_price_label).to eq("#{reg_price} Regular Price")
          expect(pur_price_label).to eq("#{pur_price}")
          expect(reg_price_label).to eq("#{reg_price}")
        when 'purelite'
          expect(pur_price_label).to eq("#{pur_price} Elite Pro Price")
          expect(reg_price_label).to eq("#{reg_price} Regular Price")
        else
          expect(pur_price_label).to eq("#{pur_price} for PowerUp Rewards Pro members.") # Change to elite pro when value is on in GC
          expect(reg_price_label).to eq("#{reg_price}")
      end
    end
  end

  def get_price_for_test_data(user_role, test_data)
    # scroll_to('DETAILS')
    # swipe(540,1100,0,-30)
    reg_price = nil
    pur_price = nil
    pdp_prices = []
    overlay_prices = []
    # rls = pdp_relative_layout
    # $log.trace("rls count: #{rls.count()}")
    # rls_count = rls.count()
    if test_data['is_in_stock'] == 'true' or test_data['is_in_stock'] == 'nfs'
      if test_data['condition'] == 'New'
        reg_price = prod_new_price.text
        pdp_prices << reg_price.match(/\$[\d.]+/)[0]
        # # overlay_prices << "NEW #{reg_price.match(/\$[\d.]+/)[0]}"
        # if rls_count > 1
        #   if rls_count == 2
        #     if exists { prod_download_price }
        #       pdp_prices << prod_download_price.text.match(/\$[\d.]+/)[0]
        #       # overlay_prices << "DOWNLOAD #{prod_download_price.text.match(/\$[\d.]+/)[0]}"
        #     else
        #       pdp_prices << prod_used_price_regular.text.match(/\$[\d.]+/)[0] if exists { prod_used_price_regular }
        #       # overlay_prices << "#{test_data['condition'].upcase} #{prod_download_price.text.match(/\$[\d.]+/)[0]}"
        #     end
        #   else
        #     pdp_prices << prod_download_price.text.match(/\$[\d.]+/)[0]
        #     pdp_prices << prod_used_price_regular.text.match(/\$[\d.]+/)[0]
        #   end
        # end

      elsif test_data['condition'] == 'Download'
        reg_price = prod_download_price.text
        pdp_prices << reg_price.match(/\$[\d.]+/)[0].to_s

        # if rls_count > 1
        #   if rls_count == 2
        #     if exists(5) { prod_new_price }
        #       pdp_prices << prod_new_price.text.match(/\$[\d.]+/)[0]
        #     else
        #       prod_used_price_regular.text.match(/\$[\d.]+/)[0]
        #     end
        #   else
        #     pdp_prices << prod_new_price.text.match(/\$[\d.]+/)[0] if exists(5) { prod_new_price }
        #     pdp_prices << prod_used_price_regular.text.match(/\$[\d.]+/)[0] if exists { prod_used_price_regular }
        #   end
        # end

      else
        if test_data['category'] == 'Games'
          if user_role == 'purpro'
            reg_price = prod_used_regular_price_purpro_user.text #.match(/\$[\d.]+/)[0] #comment this out when elitepro is off
            pur_price = prod_used_price_regular.text
            # pur_price = nil
          elsif user_role == 'purbasic' or user_role=='purelite'
            reg_price = prod_used_price_regular.text
            pur_price = nil
          else
            reg_price = prod_used_price_regular.text
            pur_price = prod_used_pur_price.text
          end

          pdp_prices << reg_price.match(/\$[\d.]+/)[0] unless reg_price == nil
          pdp_prices << pur_price.match(/\$[\d.]+/)[0] unless pur_price == nil

          # if rls_count > 1
          #   if rls_count == 2
          #     if exists(5) { prod_new_price }
          #       pdp_prices << prod_new_price.text.match(/\$[\d.]+/)[0]
          #     else
          #       prod_download_price.text.match(/\$[\d.]+/)[0]
          #     end
          #   else
          #     pdp_prices << prod_new_price.text.match(/\$[\d.]+/)[0] if exists(5) { prod_new_price }
          #     pdp_prices << prod_download_price.text.match(/\$[\d.]+/)[0] if exists { prod_download_price }
          #   end
          # end
        else
          reg_price = prod_used_price_regular.text
          pdp_prices << reg_price.match(/\$[\d.]+/)[0]
          # if rls_count > 1
          #   if rls_count == 2
          #     if exists(5) { prod_new_price }
          #       pdp_prices << prod_new_price.text.match(/\$[\d.]+/)[0]
          #     else
          #       prod_download_price.text.match(/\$[\d.]+/)[0]
          #     end
          #   else
          #     pdp_prices << prod_new_price.text.match(/\$[\d.]+/)[0] if exists(5) { prod_new_price }
          #     pdp_prices << prod_download_price.text.match(/\$[\d.]+/)[0] if exists { prod_download_price }
          #   end
          # end
        end
      end
    else
      if test_data['condition'] == 'New'
        reg_price = prod_new_po_price.text
        pdp_prices << reg_price.match(/\$[\d.]+/)[0]
        # if rls_count > 1
        #   pdp_prices << prod_dlcpo_price.text.match(/\$[\d.]+/)[0]
        # end
      else
        #commented to not validate dlcpo 10.29.2018
        #reg_price = prod_dlcpo_price.text
        # pdp_prices << reg_price.match(/\$[\d.]+/)[0]
        #end comment
        # if rls_count > 1
        #   pdp_prices << prod_new_po_price.text.match(/\$[\d.]+/)[0]
        # end
      end
    end

    # $log.trace("pdp_prices: #{pdp_prices}")
    expect(pdp_prices).not_to include('$0.00')
    return reg_price, pur_price
  end

  def validate_overlay_on_pdp(pdp_details)
    $log.trace("PDPValidation: #{__method__}")
    $log.trace(pdp_details)
    rls = pdp_relative_layout
    platform = prod_platform.text
    scroll_to('Publisher')
    if exists(7) { pdp_view_more_link }
      $log.trace('Click More on pdp')
      pdp_view_more_link.click
      sleep 3
      scroll_to('Publisher')
      exists(7) { pdp_overlay_container } ? overlay_is_displayed = true : overlay_is_displayed = false
      expect("overlay is displayed: #{overlay_is_displayed}").to eq("overlay is displayed: true")
      expect("overlay pdp title: #{pdp_overlay_title.text}").to eq("overlay pdp title: #{pdp_details['name']}")

      if rls
        case (rls.count()-1)
          when 1
            price1 = pdp_overlay_price_1.text.match(/[\d.]+/)[0].to_f
            (price1 > 0) ? price_not_zero = true : price_not_zero = false

            expect("overlay price_1 #{price1} is not zero: #{price_not_zero}").to eq("overlay price_1 #{price1} is not zero: true")
          when 2
            price1 = pdp_overlay_price_1.text.match(/[\d.]+/)[0].to_f
            (price1 > 0) ? price_not_zero = true : price_not_zero = false

            expect("overlay price_1 #{price1} is not zero: #{price_not_zero}").to eq("overlay price_1 #{price1} is not zero: true")

            price2 = pdp_overlay_price_2.text.match(/[\d.]+/)[0].to_f
            (price2 > 0) ? price_2_not_zero = true : price_2_not_zero = false

            expect("overlay price_2 #{price2} is not zero: #{price_2_not_zero}").to eq("overlay price_2 #{price2} is not zero: true")
          else
        end
      else
        fail("PDP Overlay is not displayed")
      end

      $log.trace('Click Less on pdp')
      pdp_view_more_link.click
    end
    # scroll_to('DETAILS')
    # sleep 3
    # scroll_to(pdp_details['price'].gsub('$','').squish)
    swipe(500, 400, 0, 500)
  end

  def select_store_button
    if exists{bops_select_store_button}
      bops_select_store_button.click
    end
  end

  def search_for_available_store(zipCode,xCoordinate,yCoordinate,bopsTrueOrFalse)

    @count = 0
    sleep 15
    #page_scroll_down(0.50,0.30)


    if exists{bops_hops_puas_button} #and !(exists{bops_store_toggleSwitchOFF}))
      puts "CHECK STORES FOR PICKUP is clicked"
        while exists{bops_hops_puas_button} #and !(exists{bops_puas_pickUpToday} || exists{bops_puas_preOrderForPickUp}) and @count < 5
          bops_hops_puas_button.click
          sleep 5
          # if exists{allow_location_button} #access_location_message
          #   allow_location_button.click
          #   sleep 15
          # end
          allow_access_device_location(true)




          # if exists{older_than_seventeen_button}
          # age_older_than_17('yes')
          # else
          #   puts "Older than seventeen not exists."
          # end
          #sleep 5
          #page_scroll_down(0.40,0.20)
          #tap_object(268,120)




          if exists{bops_zipcode_search_field}
              bops_zipcode_search_field.click
              bops_zipcode_search_field.send_keys(zipCode)
              keypad_search_button_tap
              sleep 15
              tap_store_location(xCoordinate,yCoordinate)
              if !exists{bops_select_store_button}
                tap_store_location(xCoordinate,yCoordinate)
                sleep 3
                yCoordinate += 286
                tap_store_location(xCoordinate,yCoordinate)


              #page_scroll_down(0.50,0.30)
              end

              bops_select_store_button.click
              sleep 5

          elsif exists{bops_pay_now_button} && bopsTrueOrFalse == true
              puts 'BOPS is selected'
              bops_pay_now_button.click
              sleep 15

          elsif exists{hops_pay_in_store_button} && bopsTrueOrFalse == false
              puts 'HOPS is selected'
              hops_pay_in_store_button.click
              sleep 15

          end


          yCoordinate += 286
          @count += 1

        end

    end

  end


  def search_for_available_store_preprod(zipCode,xCoordinate,yCoordinate,bopsTrueOrFalse)

    @count = 0
    sleep 15

    if exists{bops_hops_puas_button_preprod} #and !(exists{bops_store_toggleSwitchOFF}))
      puts "CHECK STORES FOR PICKUP is clicked"
      while exists{bops_hops_puas_button_preprod} #and !(exists{bops_puas_pickUpToday} || exists{bops_puas_preOrderForPickUp}) and @count < 5
        bops_hops_puas_button_preprod.click
        sleep 5

        allow_access_device_location(true)

        if exists{bops_zipcode_search_field_preprod}
          bops_zipcode_search_field_preprod.click
          bops_zipcode_search_field_preprod.send_keys(zipCode)
          keypad_search_button_tap
          sleep 15
          tap_store_location(xCoordinate,yCoordinate)
          if !exists{bops_select_store_button_preprod}
            tap_store_location(xCoordinate,yCoordinate)
            sleep 3
            yCoordinate += 286
            tap_store_location(xCoordinate,yCoordinate)

          end

          bops_select_store_button_preprod.click
          sleep 5

        elsif exists{bops_pay_now_button_preprod} && bopsTrueOrFalse == true
          puts 'BOPS is selected'
          bops_pay_now_button_preprod.click
          sleep 15

        elsif exists{hops_pay_in_store_button_preprod} && bopsTrueOrFalse == false
          puts 'HOPS is selected'
          hops_pay_in_store_button_preprod.click
          sleep 15

        end


        yCoordinate += 286
        @count += 1

      end

    end

  end




  def ispu_zipcode_search(zipCode,xCoordinate,yCoordinate)
    if exists {access_location_message}
      allow_location_button.click
    end
    bops_zipcode_search_field.send_keys(zipCode)
    keypad_search_button_tap
    sleep 10
    tap_store_location(xCoordinate,yCoordinate)
    sleep 5
  end


  def allow_access_device_location(isTrueFalse)



        if exists{allow_location_button}
          if isTrueFalse
            allow_location_button.click

            sleep 10
          else
            deny_location_button.click
            sleep 10
          end


          keypad_search_button_tap
          if exists{yes_or_ok_link}
            yes_or_ok_link.click
            sleep 5
          end

        end

  end




  def enter_credit_card_type(enter_CreditCardType)

    case enter_CreditCardType.upcase

        when 'VISA'
          @cardnum = '4154296049522246'
          @expdate = '1220'
          @cvv = '121'

        when 'MASTERCARD'
          @cardnum = '5409933534464274'
          @expdate = '1220'
          @cvv = '121'


        when 'AMEX'
          @cardnum = '343549368572006'
          @expdate = '1220'
          @cvv = '1221'

        when 'DISCOVER'
          @cardnum = '6011111111111117'
          @expdate = '1220'
          @cvv = '121'

        when 'PURCC'
          @cardnum = '7788400030021963'

        when 'INVALIDCARD'
          @cardnum = '2233445566778899'
          @expdate = '1220'
          @cvv = '121'


    else

        puts "Card type name not enlisted..."
    end

    return  @cardnum, @expdate, @cvv

  end



  def enter_new_billing_address(billingFname)

    @firstName = billingFname

    if (exists{shipping_first_name} && exists{sameAsShippingAddress})
      sameAsShippingAddress.click
      sleep 10

    elsif exists{shipping_first_name}

    #scroll_to('First Name')
    shipping_first_name.click
    enter_text(shipping_first_name, @firstName)
    hide_keyboard
    enter_text(shipping_last_name, 'Tester')
    hide_keyboard
    select_from_dropdown(shipping_country_dropdown, 'United States of America')
    enter_text(shipping_address, '625 WESTPORT PRKWY')
    hide_keyboard
    enter_text(shipping_city, 'Grapevine')
    hide_keyboard
    select_from_dropdown(shipping_state_dropdown, 'Texas')
    enter_text(shipping_zip_code, '76051' )
    hide_keyboard
    scroll_to('SAVE')
    enter_text(shipping_phone_number, '2141234123')
    hide_keyboard
    enter_text(shipping_email_address, 'francisbarro@gamestop.com')
    hide_keyboard
    #checkout_save_button[0].click
    keypad_search_button_tap
    checkout_save_button.click
    sleep 15
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)

    end

    if exists{suggested_address_selected}
        suggested_address_selected.click
        puts "Suggested address exists"
        sleep 10
    end


    if exists{saved_addresses}


        back
        puts "Saved Address exists"
        #back_navigation.click
        #press_keycode(4)

    end

    sleep 7
    page_scroll_down(0.50,0.30)
    sleep 2
    page_scroll_down(0.30,0.50)

  end


  def enter_new_billing_address2(firstName,lastName,country,address,city,state,zipCode,phoneNbr,email)

        sleep 5
        if firstName !=''
          shipping_first_name.click
          shipping_first_name.clear
          enter_text(shipping_first_name, firstName)
        else
          shipping_first_name.click
          keypad_search_button_tap
        end

        if lastName !=''
          shipping_last_name.click
          shipping_last_name.clear
          enter_text(shipping_last_name, lastName)
        else

          shipping_last_name.click
          keypad_search_button_tap
        end

        if country !=''
          select_from_dropdown(shipping_country_dropdown, country)
          sleep 3
        end

        if address !=''
          shipping_address.click
          shipping_address.clear
          enter_text(shipping_address, address)
        else

          shipping_address.click
          keypad_search_button_tap
        end

        if city !=''
          shipping_city.click
          shipping_city.clear
          enter_text(shipping_city, city)
        else

          shipping_city.click
          keypad_search_button_tap

        end

        if state !=''
          select_from_dropdown(shipping_state_dropdown, state)
          sleep 3

        end
        page_scroll_down(0.40,0.10)

        if zipCode !=''
          shipping_zip_code.click
          shipping_zip_code.clear
          enter_text(shipping_zip_code, zipCode)
          keypad_search_button_tap
        else

          shipping_zip_code.click
          keypad_search_button_tap

        end

        if phoneNbr !=''
          shipping_phone_number.click
          shipping_phone_number.clear
          enter_text(shipping_phone_number, phoneNbr)
          keypad_search_button_tap
        else

          shipping_phone_number.click
          keypad_search_button_tap


        end

        if email !=''
          shipping_email_address.click
          shipping_email_address.clear
          enter_text(shipping_email_address, email)
          keypad_search_button_tap
        else

          shipping_email_address.click
          keypad_search_button_tap
        end


        page_scroll_down(0.10,0.40)
        checkout_save_button.click
        sleep 10


  end


  def bops_checkout_process

    cart_header_checkout_button.click
    sleep 40


  end


  def enter_promo_code(promo_code)

    sleep 5
    tap_object(540,960)
    enter_your_promo_code(promo_code)
    save_button_promotion_page.click
    sleep 5
    back

  end


  def enter_your_promo_code(promo_code)

    #sleep 5
    #tap_object(399,411)
    puts "Click promo code field"
    sleep 5
    enter_your_promo_code_input.click
    enter_your_promo_code_input.clear
    enter_your_promo_code_input.send_keys(promo_code)
    sleep 5

  end


  def enter_promo_code_normal
      promo_code_normal
  end


  def enter_gift_trade_card(gc_number, pin)

    enter_text(gc_input, gc_number )
    enter_text(gc_pin, pin )
    gc_add_icon.click
    sleep 5

    if exists{yes_or_ok_link}
      yes_or_ok_link.click
      add_billing_address.click
      enter_new_billing_address("Accept")
    end


  end

  def enter_powerUP_rewards_trade_credit(gc_number, pin)

    enter_text(purcc_input, gc_number )
    enter_text(purcc_pin, pin )
    purcc_add_icon.click
    sleep 5

  end

  def love_this_app_alert_msg


    if exists{do_you_love_this_app_YES}

        do_you_love_this_app_YES.click
        sleep 3
    end

    if exists{no_thanks_alert}
      no_thanks_alert.click
      sleep 3
    end

  end

  def love_this_app_alert_msg_preprod


    if exists{do_you_love_this_app_YES_preprod}

      do_you_love_this_app_YES_preprod.click
      sleep 3
    end

    if exists{no_thanks_alert}
      no_thanks_alert.click
      sleep 3
    end

  end


  def credit_card_payment_input(enter_CreditCardType)

     if (exists{payment_cc_number_field} && enter_CreditCardType != 'PURCC')
        card_data = enter_credit_card_type(enter_CreditCardType)
        payment_cc_number_field.click
        cc_num = card_data[0]
        payment_cc_number_field.send_keys(cc_num)

        sleep 3
        cc_exp = card_data[1]
        payment_cc_exp_date_field.click
        payment_cc_exp_date_field.send_keys(cc_exp)

        sleep 3
        cc_cvv = card_data[2]
        payment_cc_cvv_field.click
        payment_cc_cvv_field.send_keys(cc_cvv)

        sleep 5
     else
       card_data = enter_credit_card_type(enter_CreditCardType)
       cc_num = card_data[0]
       payment_cc_number_field.click
       payment_cc_number_field.send_keys(cc_num)
       sleep 5

     end





  end

  def hops_your_details_page

    yourDetails_FirstName.clear
    yourDetails_FirstName.send_keys('Francis')
    yourDetails_LastName.clear
    yourDetails_LastName.send_keys('Barro')
    yourDetails_Email.clear
    yourDetails_Email.send_keys('francisbarro@gamestop.com')
    page_scroll_down('0.50','0.30')
    yourDetails_PhoneNumber.clear
    yourDetails_PhoneNumber.send_keys('6826513171')
    #keypad_search_button_tap#(995, 1706)
    sleep 3

    if exists{continue_buttonHops}
      continue_buttonHops.click
      sleep 5
    end

  end

  def hops_your_details_page_preprod

    yourDetails_FirstName.clear
    yourDetails_FirstName.send_keys('Francis')
    yourDetails_LastName.clear
    yourDetails_LastName.send_keys('Barro')
    yourDetails_Email.clear
    yourDetails_Email.send_keys('francisbarro@gamestop.com')
    page_scroll_down('0.50','0.30')
    yourDetails_PhoneNumber.clear
    yourDetails_PhoneNumber.send_keys('6826513171')
    #keypad_search_button_tap#(995, 1706)
    sleep 3

    if exists{continue_buttonHops_preprod}
      continue_buttonHops_preprod.click
      sleep 5
    end

  end



  def edit_hops_your_details_page

    yourDetails_FirstName.clear
    yourDetails_FirstName.send_keys('Francis')
    yourDetails_LastName.clear
    yourDetails_LastName.send_keys('Gwapo')
    yourDetails_Email.clear
    yourDetails_Email.send_keys('francisbarro@gamestop.com')
    page_scroll_down('0.50','0.30')
    yourDetails_PhoneNumber.clear
    yourDetails_PhoneNumber.send_keys('6826513171')
    #keypad_search_button_tap#(995, 1706)
    sleep 3

    if exists{continue_buttonHops}
      continue_buttonHops.click
      sleep 5
    end



  end

  def hops_your_details_page2(firstName,lastName,email,phoneNumber)


    if firstName !=''
      yourDetails_FirstName.click
      yourDetails_FirstName.clear
      yourDetails_FirstName.send_keys(firstName)

    end

    if lastName !=''
      yourDetails_LastName.click
      yourDetails_LastName.clear
      yourDetails_LastName.send_keys(lastName)

    end

    if email !=''
      yourDetails_Email.click
      yourDetails_Email.clear
      yourDetails_Email.send_keys(email)

    end

    page_scroll_down('0.50','0.30')

    if phoneNumber !=''
      yourDetails_PhoneNumber.click
      yourDetails_PhoneNumber.clear
      yourDetails_PhoneNumber.send_keys(phoneNumber)
      sleep 3


    end

    if exists{continue_buttonHops}
      continue_buttonHops.click
      sleep 5
    end



  end


  def edit_hops_details_page
    if exists{edit_user_detail_page}
       edit_user_detail_page.click
    end

    edit_hops_your_details_page

  end

  def edit_hops_details_page_preprod
    if exists{edit_user_detail_page_preprod}
      edit_user_detail_page_preprod.click
    end

    edit_hops_your_details_page

  end


  def hops_checkout

    if exists{hops_pay_in_store_button}
      hops_pay_in_store_button.click
    elsif exists{hops_preOrder_for_pickUP}
      hops_preOrder_for_pickUP.click
    else
      puts "PAY IN STORE and PRE-ORDER FOR PICK UP not visible."
    end
  end


  def age_older_than_17(isYesNo)

    if exists{older_than_seventeen_button}

      if isYesNo.downcase == 'yes'
        older_than_seventeen_button.click
      else
        younger_than_eighteen_button.click
      end

    end

  end


  def cart_modify_quantity(numberOfItems)
      @count = 2
      while @count <= numberOfItems.to_i

        cart_quantity_dropdown.click
         sleep 5
         cart_number_of_items(@count).click
        sleep 5
        @count+=1

      end



  end

  def button_to_click(buttonName)

    button_name_to_click(buttonName).click
    puts "Button "+button_name_to_click(buttonName).text+' is clicked.'
    sleep 5

  end

  def click_button_again(buttonName)
    if (!exists{button_name_to_click('CHECKOUT NOW')} || exists{older_than_seventeen_button})
      button_name_to_click(buttonName).click
      sleep 5
    end
  end

  def checkout_page(promo_code, gift_card_or_trade_card,pur_trade_credit,payment_type_cc_or_paypal,enter_CreditCardType,billingFname)

    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)



          #if exists{summ_shipping_information_link}
          if (exists{confirmation_shipping_info} && confirmation_shipping_info.text == 'Shipping Information')
            summ_shipping_information_link.click
            sleep 10
            enter_new_billing_address(billingFname)
            #back
            sleep 15
          end
      
         if promo_code != '' && promo_code != nil
           promoCodes_tradeCredit_GC_icon.click
           enter_promo_code(promo_code)

         end

         if gift_card_or_trade_card != '' && gift_card_or_trade_card != nil
           my_wallet_icon.click
           gc_number = gift_card_or_trade_card.split('#')[0]
           gc_pin = gift_card_or_trade_card.split('#')[1]
           enter_gift_trade_card(gc_number,gc_pin)
           #enter_new_billing_address(billingFname)

         end

         if pur_trade_credit != '' && pur_trade_credit != nil
           available_pur_credit_applied(pur_trade_credit)

         end



         if exists{gc_or_tc_label}
           #while exists{gc_or_tc_label}
            #back
            #press_keycode(4)
           back_navigation.click
           #end

         end

         sleep 7

          if payment_type_cc_or_paypal != '' && payment_type_cc_or_paypal != 'gc'

            puts "payment_type_cc_or_paypal:#{payment_type_cc_or_paypal}"

            checkout_page_Payment(payment_type_cc_or_paypal)

            case payment_type_cc_or_paypal

            when 'cc'
              credit_card_payment_input(enter_CreditCardType)
              enter_new_billing_address(billingFname)

              # if !exists{checkout_save_button}
              #     while !exists{checkout_save_button}
              #       page_scroll_down(0.80,0.10)
              #       sleep 2
              #
              #     end
              # end

              checkout_save_button.click
              sleep 10
              # if exists{alert_message}
              #   if(alert_message.text).to eq("Please enter a valid payment card number.")
              #     puts "Please enter a valid payment card number error message prompts. "
              #     yes_or_ok_link.click
              #   end
              # end


            when 'paypal'
              page_scroll_down(0.50,0.30)
              sleep 2
              page_scroll_down(0.30,0.50)
              place_order_button1.click
              continue_paypal_checkout
              love_this_app_alert_msg
              continueShoppingConfirmation.click
            end



          end



    if payment_type_cc_or_paypal != 'paypal'

      page_scroll_down(0.50,0.30)
      sleep 2
      page_scroll_down(0.30,0.50)
      place_order_button1.click
      sleep 10
      if billingFname =='Reject'
        expect(alert_message.text).to eq('The credit card billing information you entered does not match the information on file at your financial institution. Prior to placing a new order, please verify your billing information with your financial institution to ensure all information is accurate and up to date.')

      else
        love_this_app_alert_msg
        if billingFname == 'Review'
          expect(confirmation_text_in_review.text).to eq('You have not been billed yet. We are reviewing your order. We will notify you by email when the order status changes.')
        end
        continueShoppingConfirmation.click
      end

    end

  end

  def ispu_checkout_page(payment_type_cc_or_paypal,enter_CreditCardType,billingFname)

    page_scroll_down(0.50,0.30)
    sleep 2
    page_scroll_down(0.30,0.50)
    if store_location_textField.text == 'Store Location'
      #tap_object(299,395) # temporarily tap store location field
      store_location_textField.click
      ispu_zipcode_search('76051',237,241)
      sleep 15
    end
    #tap_object(252,702) # tap payment tab
    checkout_page_Payment(payment_type_cc_or_paypal)
    credit_card_payment_input(enter_CreditCardType)
    checkout_save_button.click
    if exists{yes_or_ok_link}
      yes_or_ok_link.click
      add_edit_address.click
    end
    enter_new_billing_address(billingFname)
    #checkout_save_button[0].click
    checkout_save_button.click
    place_order_button1.click
    sleep 10
    love_this_app_alert_msg
    continueShoppingConfirmation.click


  end


  def wait_for_element

    WebDriverWait wait = WebDriverWait.new(self, 60);
    wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("about_me")));

  end

  def sku_item_search(sku_number)
    tap_search_icon
    #search_icon.click
    search_field.click
    search_field.send_keys(sku_number)
    keypad_search_button_tap
    sleep 10


    if exists{unable_to_search_item}
    @count = 0
      while exists{unable_to_search_item} and @count <= 7
        search_field.click
        keypad_search_button_tap

        # if exists{search_result_list_item}
        #   search_result_list_item.click
        # end

        @count+=1

        sleep 3

      end
    end


    ### Click again if item selected still exist #####

    if exists{search_result_list_item}
    @countItem = 0
      while exists{search_result_list_item} and @countItem <= 7
        search_result_list_item.click
        @countItem += 1
        sleep 10
      end
    else
      tap_object(586,627)
      sleep 10
    end
  end



  def sku_item_search_preprod(sku_number)
    tap_search_icon
    #search_icon.click
    search_field_preprod.click
    search_field_preprod.send_keys(sku_number)
    keypad_search_button_tap
    sleep 10


    if exists{unable_to_search_item_preprod}
      @count = 0
      while exists{unable_to_search_item_preprod} and @count <= 7
        search_field_preprod.click
        keypad_search_button_tap

        # if exists{search_result_list_item}
        #   search_result_list_item.click
        # end

        @count+=1

        sleep 3

      end
    end


    ### Click again if item selected still exist #####

    if exists{search_result_list_item_preprod}
      @countItem = 0
      while exists{search_result_list_item_preprod} and @countItem <= 7
        search_result_list_item_preprod.click
        @countItem += 1
        sleep 10
      end
    else
      tap_object(586,627)
      sleep 10
    end
  end


  def sku_item_search_noTapSearchIcon(sku_number)

    search_field.send_keys(sku_number)
    keypad_search_button_tap
    sleep 10


    if exists{unable_to_search_item}
      @count = 0
      while exists{unable_to_search_item} and @count <= 7
        search_field.click
        keypad_search_button_tap

        if exists{search_result_list_item}
          search_result_list_item.click
        end

        @count+=1

        sleep 3

      end
    end

    ### Click again if item selected still exist #####

    if exists{search_result_list_item}
      @countItem = 0
      while exists{search_result_list_item} and @countItem <= 7
        search_result_list_item.click
        @countItem += 1
        sleep 10
      end
    end

    sleep 5
  end


  def trade_item_search(item_name, item_category)

    search_field.send_keys(item_name)
    keypad_search_button_tap
    sleep 8

    case item_category.downcase

    when 'games'
          trade_games_lists_item.click

    when 'consoles', 'electronics'
          trade_console_and_electronics_list_item.click

    when 'accessories'
          trade_accessories_lists_item.click
    end

    sleep 8

  end

  def click_add_to_cart_button
     pdp_add_to_cart_button.click
     sleep 7


  end


  def shipping_address_only(billingFname)
    if (exists{confirmation_shipping_info} && confirmation_shipping_info.text == 'Shipping Information')
      summ_shipping_information_link.click
      sleep 10
      enter_new_billing_address(billingFname)
      sleep 15
    end

  end

  def shipping_address_inputFields(firstName,lastName,country,address,city,state,zipCode,phoneNumber,email)
    if (exists{confirmation_shipping_info} && confirmation_shipping_info.text == 'Shipping Information')
      summ_shipping_information_link.click
      sleep 10
      enter_new_billing_address2(firstName,lastName,country,address,city,state,zipCode,phoneNumber,email)
      sleep 15
    end

  end



  def multiple_promoCodeINPUT(promoCodes)
    if (promoCodes !='' && promoCodes != nil)
    #if (promoCodes.length !=0 )
    promoCodes_tradeCredit_GC_icon.click
    sleep 5
    tap_object(540,960)
    sleep 5

    promoCodes =  promoCodes.split(",")
    puts "Promo code length: #{promoCodes.length}"
      for i in 0...promoCodes.length
        enter_your_promo_code_input.click
        enter_your_promo_code_input.clear
        enter_your_promo_code_input.send_keys("#{promoCodes.split(",")[i]}")
        save_button_promotion_page.click
        sleep 12
        page_scroll_down(0.20,0.10)

      end
    back
    page_scroll_down(0.50,0.30)
    page_scroll_down(0.30,0.50)

    end


  end

  def multiple_giftCardINPUT(*giftCards)

    my_wallet_icon.click

    for i in 0...giftCards.length
      gc_number = giftCards[i].split('#')[0]
      gc_pin = giftCards[i].split('#')[1]
      enter_gift_trade_card(gc_number,gc_pin)
    end

    if exists{gc_or_tc_label}
      #while exists{gc_or_tc_label}
      #back
      #press_keycode(4)
      back_navigation.click
      #end

    end

  end





end



