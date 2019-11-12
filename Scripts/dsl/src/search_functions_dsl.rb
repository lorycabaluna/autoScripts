



module SearchFunctionsDSL
  extend self

  def search_by_sku_or_keyword(search_term, device_name = nil)
    $log.trace("SearchFunctionsDSL: #{__method__}: #{search_term}")
    enter_text(search_field, search_term)
    sleep 4
    $log.trace("Click search button on keyboard")
    search_button_tap(995, 1706) #(1306,2406)samsung(659,1133)#cherry mobile,
    # empty_result = search_empty_result
    if result_list_item_name == nil
      for i in 1..5
        search_field.click
        search_button_tap(995, 1706) # (1306,2406)samsung (659,1133)#cherry mobile,
        if search_empty_result == nil
          search_total = search_result_total.text
          fail("#{search_total} when searching") if search_total.include?('0 for')
          break
        end
        fail("#{search_empty_result[0].text} #{search_term}") if search_empty_result and i == 5
      end
    else
      search_total = search_result_total.text
      fail("#{search_total} when searching") if search_total.include?('0 for')
    end

  end

  def select_item_on_search_results(index=1)
    $log.trace("SearchFunctionsDSL: #{__method__}: index #{index}")
    sleep 5
    search_result_list_item(index).click
    sleep 10
    if exists{deny_location_button}
      $log.trace("Click deny location")
      deny_location_button.click
    end

    unless prod_name
      if result_list_item_name
        for i in 1..10
          search_result_list_item(index).click
          if exists{deny_location_button}
            $log.trace("Click deny location")
            deny_location_button.click
          end
          sleep 10
          break if prod_name
          fail("Unable to lookup product") if prod_name == nil and i == 10
        end
      else
        fail("Error on search")
      end
    end
  end

  def sort_search_results(by)
    $log.trace("SearchFunctionsDSL: #{__method__}")
    sort_by_dropdown.click
    sort_by_item(by).click
  end

  def select_filter_item(group_name, item_name)
    $log.trace("SearchFunctionsDSL: #{__method__}")
    $log.trace("Select filter group: #{group_name}")
    filter_group(group_name).click
    $log.trace("Select filter group: #{item_name}")
    filter_item(item_name).click
  end

  def filter_search_results(data_string=nil)
    $log.trace("SearchFunctionsDSL: #{__method__}: #{data_string}")
    return 0 if (data_string == nil or data_string == '')

    search_filter_button.click if search_filter_button.text == 'FILTER'
    f_groups, f_items = generate_filter_array_from_data_string(data_string)
    f_groups.each_with_index do |g_val, g_i|
      sleep 5
      filter_group(g_val).click
      f_items.at(g_i).each do |i_val|
        sleep 5
        filter_item(i_val).click
      end
    end
    sleep 5
    search_filter_button.click
  end

  def search_and_select_first_result(test_data)
    $log.trace("SearchFunctionsDSL: #{__method__}")
    sleep 5
    $log.trace("Click search icon")
    search_icon.click
    sleep 5
    search_by_sku_or_keyword(random_keyword(test_data['search_keywords']))
    filter_search_results(test_data['search_filters'])
    # empty_result = search_empty_result
    if result_list_item_name == nil
      for i in 1..10
        search_by_sku_or_keyword(random_keyword(test_data['search_keywords']))
        filter_search_results(test_data['search_filters'])
        break if search_empty_result == nil
      end
    end
    select_item_on_search_results(1)
  end

  def get_shop_categories_and_description(categ)
    shop_categories = shop_category_titles
    shop_categories_subtitle = shop_category_subtitles
    titles = []
    shop_categories.each { |sgt| titles << sgt.text }
    titles = titles.reverse
    subtitles = []
    shop_categories_subtitle.each { |sgst| subtitles << sgst.text }
    subtitles = subtitles.reverse

    # categ_list = []
    categ_title_subtitle = nil
    titles.each_with_index { |ct, ind|
      if ct == categ
        categ_title_subtitle = "#{ct}: #{subtitles[ind]}"
      end
    }

    categ_title_subtitle
  end

  def validate_shop_categ_title_sub_title(category)

    case category
      when 'COMING SOON'
        expected_category = "COMING SOON: Browse our list of upcoming products"
      when 'GAMES'
        expected_category = "GAMES: Our library of current and upcoming games"
      when 'CONSOLES'
        expected_category = "CONSOLES: Explore our full selection of gaming consoles"
      when 'ELECTRONICS'
        expected_category = "ELECTRONICS: Browse our huge collection of top electronics"
      when 'ACCESSORIES'
        expected_category = "ACCESSORIES: An assortment of must-have accessories"
      else
        expected_category = 'MY SAVED SEARCHES:'
    end

    categ_list = get_shop_categories_and_description(category)
    # $log.trace(categ_list)
    expect(categ_list).to eq(expected_category)
  end

  def validate_search_result_default_objects

    fail("Back icon is missing") if !exists { search_back_icon }
    page_title = tool_bar_title.text
    fail("page title should be 'SHOP' not '#{page_title}'") if page_title != 'SEARCH'
    fail("Add to saved search icon is missing") if !exists { add_to_save_search_icon }
    fail("Cart icon is missing") if !exists { cart_icon }
    fail("Search icon is missing") if !exists { search_icon }

    fail("Search result total is missing") if !exists{search_result_total}
    default_sort = sort_by_actual_value.text
    fail("Default sorting should be 'Best Sellers' not '#{default_sort}'") if default_sort != 'Best Sellers'
  end

  def validate_sorting_of_results
    dafault_product = search_result_list_item(1)
    select_from_sort_dropdown("Release Date")
    change_product = search_result_list_item(1)
    expect(change_product).not_to eq(dafault_product)

    select_from_sort_dropdown("Price Ascending")
    second_change_product = search_result_list_item(1)
    expect(second_change_product).not_to eq(change_product)

    select_from_sort_dropdown("Price Descending")
    third_change_product = search_result_list_item(1)
    expect(third_change_product).not_to eq(second_change_product)

    select_from_sort_dropdown("Best Sellers")
  end

  def select_saved_search_criteria(data_string,saved_search_title=nil,is_from_results=false)
    $log.trace("SearchFunctionsDSL: #{__method__}: #{data_string}")

    is_from_results ? add_to_save_search_icon.click : ss_add_icon.click

    validate_saved_search_filters(is_from_results)

    if saved_search_title == nil or title == ''
      saved_search_title = ss_title.text
    else
      enter_text(ss_title, saved_search_title)
    end

    return 0 if (data_string == nil or data_string == '')
    f_groups, f_items = generate_filter_array_from_data_string(data_string)
    f_groups.each_with_index do |g_val, g_i|
      scroll_to(g_val)
      ss_filter_group(g_val).click
      f_items.at(g_i).each do |i_val|
        scroll_to(i_val)
        ss_filter_item(i_val).click
      end
      sleep 3
      ss_filter_group(g_val).click
    end

    ss_filter_save.click

    return saved_search_title
  end

  def validate_saved_search_filters(is_from_results)
    filter_groups = []
    ss_filter_groups.each { |fg| filter_groups << fg.text }
    if is_from_results
      expected_filter_groups = ["Products (1)", "Platform", "Condition", "Category", "Availability", "Price", "ESRB"]
    else
      expected_filter_groups = ["Products", "Platform", "Condition", "Category", "Availability", "Price", "ESRB"]
    end
    expect(filter_groups).to eq(expected_filter_groups)
  end

  #NOTE: sample data Condition:New,Used;Category:3D;
  def generate_filter_array_from_data_string(string_data)
    $log.trace("SearchFunctionsDSL: #{__method__}")
    raise Exception.new('Generate filter data was called but no string data is not provided') if string_data == nil
    groups = []
    items = []

    string_data.split(";").each do |data_val|
      data_val.split(":").each_with_index do |f_val, f_i|
        (f_i == 0) ? groups << f_val : items << f_val.split(",")
      end
    end
    return groups, items
  end

  def random_keyword(keywords=nil)
    keys = keywords.split(',') if (keywords != nil or keywords != '')
    keys.kind_of?(Array) ? keys.sample : keys
  end

  def select_from_sort_dropdown(text_value)
    $log.trace("SearchFunctionsDSL: #{__method__} : #{text_value}")
    sort_by_dropdown.click
    sort_options = []
    sort_by_items.each { |i| sort_options << i.text }
    # $log.trace(sort_options)
    expected_sort_options = ["Best Sellers", "Release Date", "Price Ascending", "Price Descending"]
    expect(sort_options).to eq(expected_sort_options)
    sort_by_item(text_value).click
    sleep 5
  end


  def keypad_search_button_tap
    #Appium::Core::TouchAction.new(self).press('x': x, 'y': y).release.perform
    # press_keycode(84)
    # # ruby_lib_core example
    # @driver.touch_action.single_tap(element).perform
    #
    Appium::Core::TouchAction.new(self).press(x: 984, y: 1703).release.perform




  end

  def tap_hamburger_menu
    Appium::Core::TouchAction.new(self).press(x: 62, y: 125).release.perform

  end

  def tap_cart_icon
    Appium::Core::TouchAction.new(self).press(x: 876, y: 129).release.perform

  end


  def tap_search_icon
    Appium::Core::TouchAction.new(self).press(x: 1001, y: 129).release.perform

  end

  def shopTab(select_catergory)

     shop_tab.click

     case select_catergory.downcase

     when 'my saved searches'
           shop_mysavedsearches_link.click
     when 'preferred console'
           preferred_console_link.click
     when 'coming soon'
           shop_comingsoon_link.click
     when 'games'
           shop_games_link.click
     when 'consoles'
           shop_consoles_link.click
     when 'electronics'
           shop_electronics_link.click
     when 'collectibles'
           shop_collectibles_link.click
     else
       puts "You've selected an invalid category"
     end

     sleep 10
  end

  def saved_searches(add_create_edit_delete)

    sleep 5
    @count = 0

    case add_create_edit_delete.downcase



    when 'add'
         add_to_save_search_icon.click
         ss_title.click
         ss_title.send_keys('Game1')
         ss_query.click
         ss_query.send_keys('Call of Duty')
         ss_filter_save.click
         sleep 2
         back
         shop_mysavedsearches_link.click
         expect(shop_category_titles[0].text).to eq('Game1')
         shop_category_titles[0].click
         sleep 10
         while (!exists{search_result_counts} && @count <=2)
           back
           shop_category_titles[0].click
           @count +=1
         end
         expect(search_result_counts.displayed?).to eq(true)


    when 'create'


        while exists{ss_menu_dots[0]}
          ss_menu_dots[0].click
          sleep 2
          ss_delete.click
          sleep 2
        end


         ss_add_icon.click
         ss_title.click
         ss_title.send_keys('Game1')
         ss_query.click
         ss_query.send_keys('Call of Duty')
         ss_filter_save.click
         sleep 2

    when 'edit'
         ss_menu_dots[0].click
         sleep 2
         ss_edit.click
         sleep 2
         ss_title.clear
         ss_title.send_keys('Game2')
         ss_query.clear
         ss_query.send_keys('Call of Duty')
         ss_filter_save.click
         sleep 2
         expect(shop_category_titles[0].text).to eq('Game2')


    when 'delete'
        ss_menu_dots[0].click
        sleep 2
        ss_delete.click
        sleep 2
        expect(ss_empty_list.text).to eq('You have no saved searches.')
    end



  end

  def select_lists_of_consoles(console_index)
    # @reset = 1
    # @count = 0
    # for i in 2..console_index.to_i
    #
    #   if i > 1 && i > 7
    #     page_scroll_down(0.80,0.10)
    #     set_console_lists(@reset).click
    #     set_console_lists(@reset+1).click
    #     @reset +=1
    #
    #   elsif i > 1 && i <= 7
    #     set_console_lists(i-1).click
    #     set_console_lists(i).click
    #
    #   else
    #     set_console_lists(i).click
    #
    #   end
    #
    #  while (!exists{hamburger_menu})
    #    back
    #    press_keycode(4)
    #  end
    #
    #  shop_tab.click
    #  if preferred_console_link.displayed?
    #     expect(preferred_console_link.displayed?).to eq(true)
    #     preferred_console_link.click
    #  end
    #   while !(exists{search_result_counts}) && @count <=2
    #     back
    #     preferred_console_link.click
    #     @count +=1
    #
    #   end
    #
    #
    #
    #   while (!exists{hamburger_menu})
    #     press_keycode(4)
    #   end
    #
    #
    #
    #
    # end

    set_console_lists(console_index).click


  end


  def select_filter(category,itemName)
    sleep 5
    filter_category(category).click #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    sleep 5
    category_item_selected(itemName).click
    sleep 5
    filter_category(category).click
    done_filter_button.click

  end


end

