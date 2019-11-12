module PUASFunctionsDSL
  extend self

  def click_puas_link(is_in_stock)
    $log.trace("PUASFunctionsDSL: #{__method__}")
    $log.trace("Click PUAS link")
    puas_link.click if has_puas_link
    $log.trace("Click deny location")
    deny_location_button.click
  end

  def click_choose_store_link
    $log.trace("PUASFunctionsDSL: #{__method__}")
    $log.trace("Click CHOOSE STORE link")
    choose_store_link.click
    $log.trace("Click deny location")
    deny_location_button.click
  end

  def search_and_select_store(search_term, product_condition, device_name=nil)
    $log.trace("PUASFunctionsDSL: #{__method__}")
    $log.trace("enter #{search_term} on search field")
    search_store_field.send_keys(search_term)
    $log.trace("Click search button")
    search_button_tap(995,1706)#(1306,2406)samsung,(659,1133)#cherry mobile
    store_list = store_lists_count
    if store_list == nil
      for i in 1..5
        search_store_field.click
        search_button_tap(995,1706)#,(1306,2406) samsung (659,1133)#cherry mobile
        break if store_lists_count
        fail("NO stores found for #{product_condition} product on #{search_term}") if store_lists_count == nil and i == 5
      end
    end
    sleep 10
    select_available_store(product_condition)
  end

  def select_available_store(condition)
    $log.trace("PUASFunctionsDSL: #{__method__}")
    st_list = store_lists_count
    st_names = store_names
    for i in 0..st_list.size()
      storename = st_names[i].text
      st_list[i].click
      if condition == 'New'
        new_buttons = hold_new_button
        if new_buttons
          new_buttons[0].click
          $log.trace("#{storename} is selected")
          return storename
        else
          st_list[i].click
        end
      else
        used_buttons = hold_preowned_button
        if used_buttons
          used_buttons[0].click
          $log.trace("#{storename} is selected")
          return storename
        else
          st_list[i].click
        end
      end
      fail("No available store for #{condition} product") if i == st_list.size()
    end

    sleep 5
  end

  def enter_user_details(user_data)
    $log.trace("PUASFunctionsDSL: #{__method__}")
    $log.trace("Enter #{user_data['firstname']} on first name field")
    enter_text(user_details_fname, user_data['firstname'])
    $log.trace("Enter #{user_data['lastname']} on last name field")
    enter_text(user_details_lname, user_data['lastname'])
    hide_keyboard
    $log.trace("Enter #{user_data['email']} on email field")
    enter_text(user_details_email, user_data['email'])
    # search_button_tap(1306,2406)
    hide_keyboard
    $log.trace("Enter #{user_data['phonenumber']} on phonenumber field")
    enter_text(user_details_pnumber, user_data['phonenumber'])
  end

  def submit_hops_request
    $log.trace("PUASFunctionsDSL: #{__method__}")
    $log.trace("click finish button")
    hops_continue_finish_button.click
    page_title = tool_bar_title
    $log.trace("#{page_title.text}")
    expect(page_title.text).to eq('HOLD SUMMARY')
    sleep 5

    $log.trace("click submit request button")
    for i in 0..5
      hops_continue_finish_button.click
      sleep 10
      # confirmation_in_app_dismiss.click if exists { confirmation_in_app_title }
      e, has_inapp = check_error_on_page
      close_inapp_review(has_inapp)
      break if tool_bar_title.text == 'REQUEST SUBMITTED'
    end
    page_title = tool_bar_title
    $log.trace("#{page_title.text}")
    expect(page_title.text).to eq("REQUEST SUBMITTED")
    confirmation = hops_confirmation_message
    $log.trace("#{confirmation.text}")
    expect(confirmation.text).to eq("Your hold request has been sent!")
  end

  def get_prod_details_on_confirmation
    $log.trace("PUASFunctionsDSL: #{__method__}")
    prod_details = {}
    prod_details['name'] = hops_prod_name.text
    prod_details['platform'] = hops_prod_platform.text
    (exists { hops_prod_release_date }) ?
        prod_details['release_date'] = hops_prod_release_date.text :
        prod_details['release_date'] = ''
    prod_details['condition'] = hops_prod_condition.text
    prod_details['price'] = hops_prod_price.text
    return prod_details
  end

  def get_user_details_on_confirmation
    $log.trace("PUASFunctionsDSL: #{__method__}")
    user_datails = {}
    user_datails['username'] = hops_confirm_user_name.text
    user_datails['email'] = hops_confirm_user_email.text
    user_datails['phone'] = hops_confirm_phone.text
    return user_datails
  end

  def perform_full_hops(user_data,test_data)
    $log.trace("PUASFunctionsDSL: #{__method__}")
    search_and_select_first_result(test_data)
    pdp_prod_details = get_prod_details_from_pdp(test_data, test_data['user_role'])
    pdp_prod_details.delete("pur_price")
    pdp_prod_details.delete("is_in_stock")
    pdp_prod_details["price"] = pdp_prod_details["price"].match(/\$[\d.]+/)[0]
    # $log.trace(pdp_prod_details)
    fail("PICK UP TODAY section not displayed for hops product #{pdp_prod_details['name']}") unless exists { puas_container }
    click_choose_store_link
    # storename = search_and_select_store(test_data['store_search_term'],test_data['condition'],test_data['device_name'])
    # enter_user_details(user_data) unless test_data['user_role'] != 'gu'
    # submit_hops_request
    # hops_prod_details = get_prod_details_on_confirmation
    # expect(hops_prod_details).to eq(pdp_prod_details)
    # hops_user_details = get_user_details_on_confirmation
    # expect(hops_confirm_store.text).to eq(storename)
    # expect(hops_user_details['username']).to eq("#{user_data['firstname']} #{user_data['lastname']}".upcase)
    # expect(hops_user_details['email']).to eq(user_data['email'])
    # expect(hops_user_details['phone'].gsub(/[^\d]/, '')).to eq(user_data['phonenumber'])
  end

end

