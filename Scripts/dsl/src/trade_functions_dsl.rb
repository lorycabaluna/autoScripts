module TradeFunctionsDSL
  extend self

  def save_trade(test_data)
    $log.trace("TradeFunctionsDSL: #{__method__}")

    # puts "prev_trade_count:#{prev_trade_count}"
    sleep 3
    $log.trace("Click Trade tab on headers")
    trade_tab.click

    prev_active_trade, prev_expired_count = calculate_saved_expired_trade

    sleep 5
    $log.trace("Click make trade tile")
    make_trade_tile.click
    trade_tutorial_db

    if test_data['search_criteria'] == 'Games'
      swipe(900,900,-700) # nexus 5, -600 nexus6
      sleep 2
      swipe(900,900,-700) # nexus 5, -600 nexus6
      validate_trade_tutorial(2)
    end

    back_on_trade.click
    make_trade_tile.click

    item_details = search_and_select_trade_result(test_data['search_criteria'], test_data['search_keywords'], 0, test_data['device_name'])

    sleep 10
    user_type = test_data['user_role']
    trade_value_header = get_trade_header_value_by_user(user_type)
    old_trade_values = get_trade_cash_values(false, user_type)
    # $log.trace("old::#{old_trade_values}, length: #{old_trade_values.length}")
    validate_trade_values(old_trade_values, user_type, test_data['search_criteria'])
    # validate_best_value_tag(test_data, old_trade_values)
    trade_details = get_credit_cash_value_by_user(user_type, old_trade_values)
    # puts "trade_details: #{trade_details}"
    scroll_to('CANCEL')
    $log.trace("Click save button")
    save_trade_button.click
    expect(saved_trade_message.text).to eq('Estimate Saved!')
    expect(quote_product_name.text).to eq(item_details['name'])
    expect(quote_product_platform.text).to eq(item_details['platform']) unless test_data['search_criteria'] == 'Electronics'
    new_trade_values = get_trade_cash_values(true, user_type)
    # validate_best_value_tag(test_data,new_trade_values)
    # puts "new::#{new_trade_values}"
    expect(old_trade_values).to match_array(new_trade_values)
    $log.trace("Click back on trade")
    back_on_trade.click
    $log.trace("Click view saved trades link")
    view_saved_trades_link[0].click
    new_act_trade_count, new_exp_trade_count = get_saved_trade_counts
    expect("number of active trades: #{new_act_trade_count}").to eq("number of active trades: #{prev_active_trade + 1}")
    scroll_to(item_details['name'])
    # click_saved_item(true, 'Active', nil, new_act_trade_count, new_exp_trade_count)
    click_saved_item_by_name(item_details['name'])
    expect(quote_product_name.text).to eq(item_details['name'])
    expect(quote_product_platform.text).to eq(item_details['platform']) unless test_data['search_criteria'] == 'Electronics'
    expect(cardview_headers[0].text).to eq(trade_value_header)
    expect(cardview_credit_value_price[0].text).to eq(trade_details['credit_value'])
    expect(cardview_cash_value_price[0].text).to eq(trade_details['cash_value'])
  end

  def calculate_saved_expired_trade
    (view_saved_trades_link != nil) ? total_trade = view_saved_trades_link[0].text.delete("^0-9").to_i : total_trade = 0

    active_trade = trade_tab.text.delete("^0-9").to_i
    expired_trade = total_trade-active_trade
    return active_trade, expired_trade
  end

  def search_and_select_trade_result(category, keyword, result_index=0, device_name=nil)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    if device_name == 'samsung'
      search_button_x = 1306
      search_button_y = 2406
    end
    $log.trace("Click category #{category}")
    click_trade_category_tile(category)
    $log.trace("enter #{keyword} on search field")
    search_field.send_keys(keyword)
    $log.trace("Click search button on keyboard")
    search_button_tap(995,1706) #(1306, 2406)samsung (659,1133)#cherry mobile,
    # empty_result = search_empty_result
    if result_item_name == nil
      for i in 1..10
        back_on_trade.click
        sleep 3
        click_trade_category_tile(category)
        search_field.send_keys(keyword)
        search_button_tap(995,1706) #(1306, 2406)samsung(659,1133)#cherry mobile,
        # sleep 10
        break if search_empty_result == nil
      end
    end

    item_details = select_result_item(result_index)
    if category == 'Electronics'
      electronics_list[0].click
      back_on_trade.click
      electronics_list[0].click
    end

    return item_details
  end

  def click_trade_category_tile(category)
    $log.trace("TradeFunctionsDSL: #{__method__}: #{category}")
    case category
      when "Games"
        games_tile.click
      when "Consoles"
        consoles_tile.click
      when "Electronics"
        electronics_tile.click
      else
        accessories_tile.click
    end
  end

  def get_trade_cash_values(is_saved_item, user_type)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    sleep 3
    trade_details = {}
    headers, credit_values, cash_values, reg_prices = get_headers_cash_credit_values(is_saved_item)
    # $log.trace("#{headers},#{credit_values},#{cash_values},#{reg_prices}")
    headers.each_with_index do |h, i|
      trade_details["#{h}"] = {"credit_value" =>  credit_values[i], "cash_value" => cash_values[i]}
    end

    trade_details["Regular"] = {"credit_value" => reg_prices[0], "cash_value" => reg_prices[1]} if (user_type != 'nonpur' and user_type != 'purbasic')

    # $log.trace(trade_details)
    return trade_details
  end

  def get_headers_cash_credit_values(is_saved_item)
    headers = cardview_headers
    headers_array=[]

    headers.each do |h|
      headers_array << h.text
    end

    credit_values = cardview_credit_value_price
    crv_array = []
    credit_values.each do |crv|
      crv_array << crv.text
    end

    cash_values = cardview_cash_value_price
    cav_array = []

    cash_values.each do |cav|
      cav_array << cav.text
    end
    headers_array = headers_array.uniq
    crv_array = crv_array.uniq
    cav_array = cav_array.uniq

    # $log.trace(headers_array)
    if headers_array.length > 1
      is_saved_item ? scroll_to('VIEW SAVED TRADES') : scroll_to('CANCEL')
      updated_headers = cardview_headers
      updated_headers.uniq.each do |h|
        headers_array << h.text unless headers_array.include?(h.text)
      end

      updated_credit_values = cardview_credit_value_price
      updated_credit_values.uniq.each do |crv|
        crv_array << crv.text unless crv_array.include?(crv.text)
      end

      updated_cash_values = cardview_cash_value_price
      updated_cash_values.uniq.each do |cav|
        cav_array << cav.text unless cav_array.include?(cav.text)
      end

      scroll_to('Regular') unless is_saved_item
    end

    reg_price_for_members = []
    has_inserted_reg_price = exists{reg_crv_for_pur}
    if has_inserted_reg_price
      reg_price_for_members << reg_crv_for_pur.text
      reg_price_for_members << reg_cav_for_pur.text
    end

    return headers_array, crv_array, cav_array, reg_price_for_members
  end

  def get_trade_header_value_by_user(user_type)
    if user_type == 'purpro'
      trade_value_header = 'Pro Member'
    elsif user_type == 'purelite'
      trade_value_header = 'Elite Pro Member'
    else
      trade_value_header = 'Regular'
    end

    trade_value_header
  end

  def get_credit_cash_value_by_user(user_type, trade_details)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    return trade_details['Regular'] if user_type == 'purbasic' or user_type == 'nonpur'
    return trade_details['Pro Member'] if user_type == 'purpro'
    return trade_details['Elite Pro Member'] if user_type == 'purelite'
  end

  def validate_trade_values(trade_values, user_type, trade_type)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    base_credit_value = trade_values['Regular']['credit_value'].delete("^0-9.").to_f
    base_cash_value = trade_values['Regular']['cash_value'].delete("^0-9.").to_f
    # $log.trace(trade_values)
    if user_type == 'nonpur'
      expect("#{user_type} no. of price tiles: #{trade_values.length}").to eq("#{user_type} no. of price tiles: 2")
      expect("Pro cval: #{trade_values['Pro Member']['credit_value']}").to eq("Pro cval: $#{'%.2f' % (base_credit_value*1.1)}*")
      expect("Pro ccash: #{trade_values['Pro Member']['cash_value']}").to eq("Pro ccash: $#{'%.2f' % (base_cash_value*1.1)}*")
      # expect("Elite cval: #{trade_values['Elite Pro Member']['credit_value']}").to eq("Elite cval: $#{'%.2f' % (base_credit_value*1.2)}*")
      # expect("Elite ccash: #{trade_values['Elite Pro Member']['cash_value']}").to eq("Elite ccash: $#{'%.2f' % (base_cash_value*1.2)}*")
    elsif user_type == 'purbasic'
      if trade_type == 'Consoles'
        expect("#{user_type} no. of price tiles: #{trade_values.length}").to eq("#{user_type} no. of price tiles: 1")
      else
        expect("#{user_type} no. of price tiles: #{trade_values.length}").to eq("#{user_type} no. of price tiles: 2")
        expect("Pro cval: #{trade_values['Pro Member']['credit_value']}").to eq("Pro cval: $#{'%.2f' % (base_credit_value*1.1)}*")
        expect("Pro ccash: #{trade_values['Pro Member']['cash_value']}").to eq("Pro ccash: $#{'%.2f' % (base_cash_value*1.1)}*")
        # expect("Elite cval: #{trade_values['Elite Pro Member']['credit_value']}").to eq("Elite cval: $#{'%.2f' % (base_credit_value*1.2)}*")
        # expect("Elite ccash: #{trade_values['Elite Pro Member']['cash_value']}").to eq("Elite ccash: $#{'%.2f' % (base_cash_value*1.2)}*")
      end
    elsif user_type == 'purpro'
      if trade_type == 'Consoles'
        expect("#{user_type} no. of price tiles: #{trade_values.length}").to eq("#{user_type} no. of price tiles: 1")
      else
        expect("#{user_type} no. of price tiles: #{trade_values.length-1}").to eq("#{user_type} no. of price tiles: 1")
        expect("Pro credit value: #{trade_values['Pro Member']['credit_value']}").to eq("Pro credit value: $#{'%.2f' % (base_credit_value*1.1)}*")
        expect("Pro cash value: #{trade_values['Pro Member']['cash_value']}").to eq("Pro cash value: $#{'%.2f' % (base_cash_value*1.1)}*")
      end
    else
      expect("#{user_type} no. of price tiles: #{trade_values.length-1}").to eq("#{user_type} no. of price tiles: 1")
    end
  end

  def validate_best_value_tag(test_data, trade_values)
    $log.trace("trade_values: #{trade_values}")
    same_values = false
    if trade_values.length > 1
      cv_list = []
      trade_values.each do |key, value|
        value.each do |k, v|
          cv_list << v if k == 'credit_value'
        end
      end
      same_values = true if cv_list.uniq.count == 1
    end

    best_value_tag_exists = exists{best_value_img}

    if trade_values.length > 1
      if best_value_tag_exists
        fail("TC127119: Best value tag should not be displayed if all values are the same") if same_values
        fail("TC127119: Best value tag should not be displayed for Consoles") if test_data['search_criteria']=='Consoles'
      else
        if !same_values
          fail("TC127119: Best value tag should be displayed if values are not the same")  if test_data['user_role'] != 'purelite' and test_data['user_role'] != 'purpro'
        end

        if test_data['search_criteria']!='Consoles' and !same_values
          fail("TC127119: Best value tag should be displayed for #{test_data['search_criteria']}")  if test_data['user_role'] != 'purelite' and test_data['user_role'] != 'purpro'
        end
      end
    else
      if best_value_tag_exists
        fail("TC127119: Best value tag should not display on less than 1 tier trade") if test_data['user_role'] != 'purelite' and test_data['user_role'] != 'purpro'
      end
    end

  end

  def update_expired_trade(number_of_update)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    sleep 5
    # saved_trades_total = trade_tab.text.delete("^0-9").to_i
    $log.trace("Click trade tab")
    trade_tab.click
    $log.trace("Click saved trade link")
    active_trades, expired_trades = calculate_saved_expired_trade
    if (expired_trades + active_trades)> 0
      view_saved_trades_link[0].click
      sleep 5
      # old_act_trade_count, old_act_trades, old_exp_trade_count, old_exp_trades = list_active_expired_trades(saved_trades_total)
      old_act_trade_count, old_exp_trade_count = get_saved_trade_counts
      if old_exp_trade_count > 0
        click_update_estimate_on_item(number_of_update)
      else
        raise Exception.new("There are no expired trades to update")
      end

      new_act_trade_count, new_exp_trade_count = get_saved_trade_counts
      expect("number of active trades: #{new_act_trade_count}").to eq("number of active trades: #{old_act_trade_count+1}")
      expect("number of expired trades: #{new_exp_trade_count}").to eq("number of expired trades: #{old_exp_trade_count-1}")
    else
      fail("There are no items on saved trades")
    end

  end

  def select_result_item(index)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    item_details = {}
    item_details['name'] = result_item_name[index].text
    item_details['platform'] = result_item_platform[index].text
    # trade_result_item(index).click
    result_item_name[index].click

    item_details
  end

  def get_saved_trade_counts
    $log.trace("TradeFunctionsDSL: #{__method__}")
    active_trade_count = 0
    expired_trade_count = 0
    active_header = active_trade_header
    active_trade_count = active_header[0].text.delete("^0-9").to_i if active_header
    # puts "active_trade_count: #{active_trade_count}"
    scroll_to("Expired") if active_trade_count > 3
    expired_headers = expired_trade_header
    expired_trade_count = expired_headers[0].text.delete("^0-9").to_i if expired_headers
    # puts "expired_trade_count: #{expired_trade_count}"
    scroll_to("Active (#{active_trade_count})") if active_trade_count > 0
    return active_trade_count, expired_trade_count
  end

  def list_active_expired_trades(saved_trades_total=nil)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    active_trades = []
    expired_trades = []
    active_trade_count = 0
    expired_trade_count = 0
    list = saved_trade_list
    unless list == nil
      # is_active_item = true
      active_trade_count, expired_trade_count = get_saved_trade_counts
      #TODO: list the items in the saved trade page
      # for i in 0..(list.size()-1)
      #   if i < active_trade_count-1
      #     active_trades << {"name" "#{saved_trade_item_name(i).text}", "platform" "#{saved_trade_item_platform(i).text}"}
      #   else
      #     expired_trades << {"name" "#{saved_trade_item_name(i).text}", "platform" "#{saved_trade_item_platform(i).text}"}
      #   end
      # end
    end
    # puts "active_trade: #{active_trades.join(',')}"
    # puts "expired_trades: #{expired_trades.join(',')}"
    return active_trade_count, active_trades, expired_trade_count, expired_trades
  end

  def click_update_estimate_on_item(number_of_items)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    for i in 0..(number_of_items-1)
      scroll_to("UPDATE ESTIMATE")
      $log.trace("Click update estimate link")
      update_estimate_button(0).click
      sleep 5
    end
  end

  def delete_item_on_saved_trades(item_type=nil, number_of_items_to_delete)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    $log.trace("Click trade tab")
    trade_tab.click
    sleep 3
    $log.trace("Click view saved trades link")
    active_trades, expired_trades = calculate_saved_expired_trade

    if (expired_trades + active_trades)> 0
      view_saved_trades_link[0].click
      sleep 3
      $log.trace("Click edit trade icon")
      edit_trade_button.click

      active_trade_count, expired_trade_count = get_saved_trade_counts
      raise Exception.new("There are no active trades to delete") if item_type == 'Active' and active_trade_count == 0
      raise Exception.new("There are no expired trades to delete") if item_type == 'Expired' and expired_trade_count == 0
      raise Exception.new("There are no saved trades to delete") if item_type == nil and (expired_trade_count+active_trade_count == 0)

      if number_of_items_to_delete.to_s == 'all'
        $log.trace("Click select all button")
        select_all_button.click
      else
        click_check_box_on_item(item_type, number_of_items_to_delete, active_trade_count, expired_trade_count)
      end

      button_text = delete_button.text.delete("^0-9").to_i

      if number_of_items_to_delete.to_s == 'all'
        expect("number of items to delete: #{button_text}").to eq("number of items to delete: #{active_trade_count + expired_trade_count}")
      else
        expect("number of items to delete: #{button_text}").to eq("number of items to delete: #{number_of_items_to_delete}")
      end
      $log.trace("Click delete button ")
      delete_button.click
      sleep 3

      if number_of_items_to_delete.to_s == 'all'
        expect(no_saved_trade_message.text).to eq("You have no saved trades.")
      else
        $log.trace("click done icon")
        done_edit_trade_button.click if (number_of_items_to_delete < active_trade_count) or (number_of_items_to_delete < expired_trade_count)
        new_act_trade_count, new_exp_trade_count = get_saved_trade_counts
        if item_type == 'Active'
          expect("number of active trades: #{new_act_trade_count}").to eq("number of active trades: #{active_trade_count-number_of_items_to_delete}")
          expect("number of expired trades: #{new_exp_trade_count}").to eq("number of expired trades: #{expired_trade_count}")
        else
          expect("number of active trades: #{new_act_trade_count}").to eq("number of active trades: #{active_trade_count}")
          expect("number of expired trades: #{new_exp_trade_count}").to eq("number of expired trades: #{expired_trade_count-number_of_items_to_delete}")
        end
      end
    else
      fail("There are no items on saved trades")
    end

  end

  def click_check_box_on_item(item_type, number_of_items_to_delete, active_trade_count, expired_trade_count)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    if item_type == 'Active'
      puts "Number of active trades to delete is more than the actual number of items, will delete all existing" if number_of_items_to_delete > active_trade_count
    else
      puts "Number of expired trades to delete is more than the actual number of items, will delete all existing" if number_of_items_to_delete > expired_trade_count
    end

    calculate_checkbox_index_to_check(item_type, number_of_items_to_delete, active_trade_count)
  end

  def calculate_checkbox_index_to_check(item_type, number_of_items_to_delete, active_trade_count)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    if (active_trade_count == 0 and item_type == 'Expired') or item_type == 'Active'
      for i in 0..(number_of_items_to_delete-1)
        trade_item_checkbox[i].click
      end
    else
      for i in 0..(number_of_items_to_delete-1)
        scroll_to("UPDATE ESTIMATE")
        trade_item_checkbox[i+active_trade_count].click
        scroll_to("Active (#{active_trade_count})")
      end
    end
  end

  def click_saved_item(is_last, item_type, item_index, active_trade_count, expired_trade_count)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    if is_last
      if item_type == 'Active'
        scroll_to("Cash Value") if active_trade_count > 4
        saved_trade_list[active_trade_count-1].click
      else
        scroll_to("UPDATE ESTIMATE") if (expired_trade_count+active_trade_count-1) > 4
        saved_trade_list[expired_trade_count+active_trade_count-1].click
      end
    else
      if item_type == 'Active'
        saved_trade_list[item_index].click
      else
        saved_trade_list[active_trade_count+item_index].click
      end
    end
  end

  def click_saved_item_by_name(item_name, item_type=nil)
    $log.trace("TradeFunctionsDSL: #{__method__}")
    scroll_to(item_name)
    saved_trade_item_name(item_name).click
  end

  def validate_trade_tutorial(page_number)

    if page_number == 2
      tutorial_title_2 = trade_tutorial_title.text
      tutorial_subtitle_2 = trade_tutorial_subtitle.text
      tutorial_description_2 = trade_tutorial_description.text
      $log.trace(tutorial_title_2)
      expect(tutorial_title_2).to eq('Get Paid')
      expected_subtile = "Get store credit or cash instantly. Apply towards any purchase or take it with you."
      $log.trace(tutorial_subtitle_2)
      expect(tutorial_subtitle_2).to eq(expected_subtile)
      expected_descprition = "Get more for your trades as a PowerUp Rewards Elite Pro or Pro Member."
      $log.trace(tutorial_description_2)
      expect("(from TC127105) #{tutorial_description_2}").to eq("(from TC127105) #{expected_descprition}")
    end
  end
end

