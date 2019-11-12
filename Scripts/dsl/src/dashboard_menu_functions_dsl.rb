module DashboardMenuFunctionsDSL
  extend self
  def set_console_on_dashboard
    $log.trace("DashboardMenuFunctionsDSL:  #{__method__}")

    set_console_img.click

    console_array = ['Nintendo Switch', 'Nintendo 3DS', 'Nintendo DS', 'Nintendo Wii', 'Nintendo Wii U', 'PC Gaming', 'PlayStation 3', 'PlayStation 4', 'PS Vita', 'Sony PSP', 'Xbox 360', 'Xbox One', 'Retro/Arcade']
    console_to_set = console_array.sample
    $log.trace("Console to set as primary: #{console_to_set}")
    scroll_to(console_to_set)
    actual_console_list = set_console_list_checkbox
    actual_console_list.each do |c|
      if c.text == console_to_set
        c.click
        break
      end
    end

    check_error_on_page
    back_icon.click
    check_error_on_page
  end

  def set_homestore
    $log.trace("DashboardMenuFunctionsDSL:  #{__method__}")
    set_store_img.click
    deny_location_button.click
  end


  #==== VALIDATIONS
  def validate_signin_page_objects
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 10
    $log.trace("click #{sign_in_option.text} option")
    sign_in_option.click
    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: SIGN IN")
    $log.trace("email: #{email.text}")
    $log.trace("password: #{password.text}")
    $log.trace("sign_in_button: #{sign_in_button.text}")
    $log.trace("create_account_button: #{create_account_button.text}")
    $log.trace("forgot_password_link: #{forgot_password_link.text}")
    back_icon.click
  end

  def validate_avatar_objects(user_role, username)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 10
    $log.trace(username_label.text)
    expect(username_label.text).to eq(username)

    unless user_role == 'nonpur'
      $log.trace(set_store_label.text)
      $log.trace(set_console_label.text)
      $log.trace(messages_label.text)
      $log.trace(trade_credit_label.text)
      $log.trace(trade_credit_value.text)
      trade_credit_refresh.click
    end

    avatar_image.click
    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: AVATAR")

    $log.trace(set_ava_username_label.text)
    expect(set_ava_username_label.text).to eq(username)
    back_icon.click
    hamburger_menu.click

    set_console_img.click
    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: CONSOLES")
    back_icon.click
    hamburger_menu.click

    messages_img.click
    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: MESSAGES")
    back_icon.click
    hamburger_menu.click

    set_store_img.click
    deny_location_button.click
    $log.trace(store_finder_field.text)
    back_icon.click
  end

  def validate_pur_option(user_role)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7

    $log.trace("click POWERUP REWARDS option")
    (user_role == 'nonpur') ? nonpur_pur_option.click : pur_option.click

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: POWERUP REWARDS")

    # unless user_role == 'gu' or user_role == 'nonpur'
    #   usertype_display = pur_user_type.text
    #
    #   case user_role
    #     when 'purbasic'
    #       expect("displayed user type: #{usertype_display}").to eq("displayed user type: PLAYER")
    #     else
    #   end
    #   exists { pur_main_points } ? main_points_exists = true : main_points_exists = false
    #   expect("#{user_role} main points is displayed: #{main_points_exists}").to eq("#{user_role} main points is displayed: true")
    #
    #   exists { lifetime_pts_value } ? life_points_exists = true : life_points_exists = false
    #   expect("#{user_role} main points is displayed: #{life_points_exists}").to eq("#{user_role} main points is displayed: true")
    # end
    back_icon.click
  end

  def validate_preorders_option
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7

    $log.trace("click PRE-ORDERS option")
    preorder_option.click

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: PRE-ORDERS")
    back_icon.click
  end

  def validate_save_trades_option(user_role)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7
    $log.trace("click SAVED TRADES option")
    (user_role == 'nonpur') ? nonpur_save_trades_option.click : save_trades_option.click

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: SAVED TRADES")
    back_icon.click
  end

  def validate_active_offers_option
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7
    scroll_to('SETTINGS')
    $log.trace("click ACTIVE OFFERS option")
    active_offers_option.click

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: ACTIVE OFFERS")
    back_icon.click
  end


  def validate_gi_option(user_role)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7

    scroll_to('SETTINGS')
    $log.trace("click GI option")
    (user_role == 'nonpur') ? nonpur_gi_news_option.click : gi_news_option.click

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: GAME INFORMER NEWS")
    is_page_empty = exists{empty_gi_page}
    fail(empty_gi_page.text) if is_page_empty
    back_icon.click
  end

  def validate_my_library_option
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7

    $log.trace("click MY LIBRARY option")
    scroll_to('MY LIBRARY')
    expect(my_library_option.text).to eq("MY LIBRARY")
    # my_library_option.click
    # sleep 5
    # press_keycode(4)
    # sleep 3
    # my_library_option.click
    # $log.trace("Page title: #{tool_bar_title.text}")
    # expect("Page title: #{tool_bar_title.text}").to eq("Page title: MY LIBRARY")
    # back_icon.click
  end

  def validate_digital_locker_option
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7

    $log.trace("click DIGITAL LOCKER option")
    scroll_to('DIGITAL LOCKER')
    digital_locker_option.click

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: DIGITAL LOCKER")
    back_icon.click
  end

  def validate_messages_option
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7
    scroll_to('SETTINGS')
    $log.trace("click MESSAGES option")
    messages_option.click
    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: MESSAGES")
    back_icon.click
  end

  def validate_settings_option(user_role)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7
    scroll_to('SETTINGS')
    $log.trace("click SETTINGS option")
    if (user_role == 'nonpur') then
      nonpur_settings_option.click
    else
      settings_option.click
    end

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: SETTINGS")
    # $log.trace(push_message_option.text)
    # $log.trace(tutorial_toggle.text)
    # $log.trace(setting_instoreoffers_toggle.text)
    # $log.trace(fingerprint_toggle[0].text) if fingerprint_toggle.size() > 0
    # $log.trace(reset_button.text)
    # push_message_option.click
    #
    # pm_toggles = pm_toggle
    # $log.trace(pm_toggles[0].text)
    # $log.trace(pm_toggles[1].text)
    # $log.trace(pm_toggles[2].text)
    #
    # back_icon.click
    back_icon.click
  end

  def validate_about_option(user_role)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    sleep 7
    scroll_to('SETTINGS')
    $log.trace("click ABOUT/FEEDBACK option")
    if (user_role == 'nonpur') then
      nonpur_about_feedback_option.click
    else
      scroll_to('ABOUT/FEEDBACK')
      about_feedback_option.click
    end

    $log.trace("Page title: #{tool_bar_title.text}")
    expect("Page title: #{tool_bar_title.text}").to eq("Page title: ABOUT/FEEDBACK")
    # $log.trace(gamestop_label.text)
    # $log.trace(version_label.text)
    # $log.trace(copyright_label.text)
    #
    # about_option = about_options
    # $log.trace(about_option[0].text)
    # $log.trace(about_option[1].text)
    # $log.trace(about_option[2].text)
    #
    # about_option[2].click
    # $log.trace(about_pur.text)
    # $log.trace(about_gi.text)
    # $log.trace(about_onlineorder.text)
    # $log.trace(about_storeexperience.text)
    # $log.trace(about_somethingelse.text)

    back_icon.click
  end

  def validate_my_library_tabs
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    validate_prod_list_on_my_lib('I HAVE')
    validate_prod_list_on_my_lib('I WANT')
    validate_prod_list_on_my_lib('I HAD')
  end

  def validate_prod_list_on_my_lib(tab_name)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__} #{tab_name}")
    click_my_library_tab(tab_name)
    prod_name = lib_prod_name
    if prod_name.size() > 0
      fail("Product dont have image in library") if lib_prod_img.size() == 0
      prod_platform = lib_prod_platform
      fail("Product dont have platform in library") if prod_platform.size() == 0
      fail("prod does not have list menu") if lib_prod_list_menu.size() == 0
      $log.trace("added product: #{prod_name[0].text} - #{prod_platform[0].text}")
    else
      fail("#{lib_empty_list.text} on #{tab_name}") if exists{lib_empty_list}
    end
  end

  def validate_prod_is_in_library(tab_name, prod_details, from_tab=nil)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__} #{prod_details['name']}")
    prod_name = lib_prod_name
    prod_platform = lib_prod_platform

    name_exists = false
    prod_index = nil
    prod_name.each_with_index { |name,ind |
      if name.text == prod_details['name']
        name_exists = true
        prod_index = ind
      end
    }
    unless name_exists
      if from_tab
        fail("#{prod_details['name']} not moved to '#{tab_name}' from '#{from_tab}' library")
      else
        fail("#{prod_details['name']} not added to '#{tab_name}' library")
      end
    end
    fail("Newly added product (#{prod_details['name']}) should be on top of list") if prod_index != 0
  end

  def validate_prod_is_not_in_library(tab_name, prod_details)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__} #{prod_details['name']}")
    prod_name = lib_prod_name

    name_exists = false
    prod_name.each_with_index { |name,ind |
      name_exists = true if name.text == prod_details['name']
    }

    fail("Product deleted still in '#{tab_name}' library") if name_exists
  end

  def validate_menu_item_on_tab(tab_name)
    $log.trace("DashBoardMenuValidationsDSL: #{__method__} #{tab_name}")
    tab_menu = lib_menu_items
    tab_menu_list = []
    tab_menu.each { |menu| tab_menu_list << menu.text }
    menu_summary = "#{tab_name} library menu items: [#{tab_menu_list.join(', ')}]"
    $log.trace(menu_summary)
    case tab_name
      when 'I HAD'
        expect(menu_summary).to eq("#{tab_name} library menu items: [I Have, I Want, Delete]")
      when 'I WANT'
        expect(menu_summary).to eq("#{tab_name} library menu items: [I Have, I Had, Delete]")
      else 'I HAVE'
      expect(menu_summary).to eq("#{tab_name} library menu items: [I Want, I Had, Delete]")
    end
  end

  def validate_empty_library
    $log.trace("DashBoardMenuValidationsDSL: #{__method__}")
    click_my_library_tab('I HAVE')
    is_ihave_empty = exists{lib_empty_list}
    if is_ihave_empty
      $log.trace(lib_empty_list.text)
    else
      fail("expecting I HAVE tab to be empty but not")
    end

    click_my_library_tab('I WANT')
    is_iwant_empty = exists{lib_empty_list}
    if is_iwant_empty
      $log.trace(lib_empty_list.text)
    else
      fail("expecting I WANT tab to be empty but not")
    end

    click_my_library_tab('I HAD')
    is_ihad_empty = exists{lib_empty_list}
    if is_ihad_empty
      $log.trace(lib_empty_list.text)
    else
      fail("expecting I HAD tab to be empty but not")
    end
  end

  def add_single_prod_to_library(tab_name, sku)
    $log.trace("DashboardMenuFunctionsDSL:  #{__method__} #{sku}")
    click_my_library_tab(tab_name)
    sleep 3
    add_button.click
    test_data = {}
    test_data['search_keywords'] = sku
    test_data['search_filters'] =  ''
    search_by_sku_or_keyword(sku)
    select_item_on_search_results(1)
    details = {}
    details['name'] = prod_name[0].text
    details['platform'] = prod_platform.text
    add_to_library(tab_name)
    validate_my_library_objects
    swipe(500,400,0,700)
    # scroll_to(details['platform'])
    add_to_lib_tag = prod_library_tag
    $log.trace("libray tag text: #{add_to_lib_tag.text.squish}")
    expect("libray tag text: #{add_to_lib_tag.text.squish}").to eq("libray tag text: #{tab_name}")
    add_to_lib_tag.click
    sleep 5
    return details
  end


  def switch_library_list(tab_name,prod_index, tab_to_switch)
    $log.trace("DashboardMenuFunctionsDSL:  #{__method__} from #{tab_name} to #{tab_to_switch}")
    click_my_library_tab(tab_name)
    sleep 5
    lib_prod_list_menu[prod_index].click
    validate_menu_item_on_tab(tab_name)
    click_item_on_menu(tab_to_switch)
  end

  def click_item_on_menu(item_name)
    $log.trace("DashboardMenuFunctionsDSL:  #{__method__} #{item_name}")
    case item_name
      when 'I HAD'
        lib_menu_i_had.click
      when 'I WANT'
        lib_menu_i_want.click
      when 'I HAVE'
        lib_menu_i_have.click
      else
        lib_menu_delete.click
    end
  end

  def click_my_library_tab(tab_name)
    case tab_name
      when 'I HAD'
        i_had_tab.click
      when 'I WANT'
        i_want_tab.click
      else
        i_have_tab.click
    end
  end
end

