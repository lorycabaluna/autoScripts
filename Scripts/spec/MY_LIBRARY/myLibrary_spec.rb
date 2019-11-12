require_relative '../../dsl/src/dsl'


RSpec.describe 'My Library tests' do
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
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    clear_data
    @app = AndroidApp.new(@config)
    start_driver
    set_wait(20)
    close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 7
  end

  after(:all) do
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 5
  end



  it 'ECOMDEV-11002: move item from I HAD > I WANT > I HAVE tab',:tc01 do

    $objData.insertTestData('MYLIBRARY','TC01')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"

    user_login_only($userType)
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    sleep 2
    page_scroll_down(0.50,0.30)
    my_library_auth.click
    sleep 3
    tap_object(540, 960)
    i_had_tab.click
    sleep 5
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    my_library_add_item.click
    sku_item_search_noTapSearchIcon($skuNumber)
    @product_title = prod_var_title.text
    my_library_corner_label.click
    sleep 5
    i_had_tab2.click
    sleep 7
    page_scroll_down(0.50, 0.80)
    sleep 2
    page_scroll_down(0.80, 0.50)
    sleep 5
    view_my_lib_button.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_i_want.click
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    i_want_tab.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_i_have.click
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    i_have_tab.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")



  end

  it 'ECOMDEV-10996: can add and delete item under I HAVE as AU',:tc02 do

    $objData.insertTestData('MYLIBRARY','TC02')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"

    user_login_only($userType)
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    sleep 2
    page_scroll_down(0.50,0.30)
    my_library_auth.click
    sleep 3
    tap_object(540, 960)
    i_have_tab.click
    sleep 5
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    my_library_add_item.click
    sku_item_search_noTapSearchIcon($skuNumber)
    @product_title = prod_var_title.text
    my_library_corner_label.click
    sleep 5
    i_have_tab2.click
    sleep 7
    page_scroll_down(0.50, 0.80)
    sleep 2
    page_scroll_down(0.80, 0.50)
    sleep 5
    view_my_lib_button.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_delete.click
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")

  end

  it 'ECOMDEV-11001: move item from I WANT > I HAD > I HAVE tab',:tc03 do

    $objData.insertTestData('MYLIBRARY','TC03')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"

    user_login_only($userType)
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    sleep 2
    page_scroll_down(0.50,0.30)
    my_library_auth.click
    sleep 3
    tap_object(540, 960)
    i_want_tab.click # to be change
    sleep 5
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    my_library_add_item.click
    sku_item_search_noTapSearchIcon($skuNumber)
    @product_title = prod_var_title.text
    my_library_corner_label.click
    sleep 5
    i_want_tab2.click # to be change
    sleep 7
    page_scroll_down(0.50, 0.80)
    sleep 2
    page_scroll_down(0.80, 0.50)
    sleep 5
    view_my_lib_button.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_i_had.click # to be change
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    i_had_tab.click # to be change
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_i_have.click # to be change
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    i_have_tab.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")



  end

  it 'ECOMDEV-11000: move item from I HAVE > I WANT > I HAD tab',:tc04 do

    $objData.insertTestData('MYLIBRARY','TC04')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"

    user_login_only($userType)
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    sleep 2
    page_scroll_down(0.50,0.30)
    my_library_auth.click
    sleep 3
    tap_object(540, 960)
    i_have_tab.click # to be change
    sleep 5
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    my_library_add_item.click
    sku_item_search_noTapSearchIcon($skuNumber)
    @product_title = prod_var_title.text
    my_library_corner_label.click
    sleep 5
    i_have_tab2.click # to be change
    sleep 7
    page_scroll_down(0.50, 0.80)
    sleep 2
    page_scroll_down(0.80, 0.50)
    sleep 5
    view_my_lib_button.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_i_want.click # to be change
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    i_want_tab.click # to be change
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_i_had.click # to be change
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    i_had_tab.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")



  end

  it 'ECOMDEV-10998: can add and delete item under I HAD as AU',:tc05 do

    $objData.insertTestData('MYLIBRARY','TC05')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"

    user_login_only($userType)
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    sleep 2
    page_scroll_down(0.50,0.30)
    my_library_auth.click
    sleep 3
    tap_object(540, 960)
    i_had_tab.click
    sleep 5
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    my_library_add_item.click
    sku_item_search_noTapSearchIcon($skuNumber)
    @product_title = prod_var_title.text
    my_library_corner_label.click
    sleep 5
    i_had_tab2.click
    sleep 7
    page_scroll_down(0.50, 0.80)
    sleep 2
    page_scroll_down(0.80, 0.50)
    sleep 5
    view_my_lib_button.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_delete.click
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")

  end

  it 'ECOMDEV-10997: can add and delete item under I WANT as AU',:tc06 do

    $objData.insertTestData('MYLIBRARY','TC06')
    puts "user type:#{$userType}"
    puts "sku number: #{$skuNumber}"

    user_login_only($userType)
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    sleep 2
    page_scroll_down(0.50,0.30)
    my_library_auth.click
    sleep 3
    tap_object(540, 960)
    i_want_tab.click
    sleep 5
    while exists{lib_prod_list_menu}
      lib_prod_list_menu.click
      sleep 3
      lib_menu_delete.click
      sleep 7
    end
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")
    my_library_add_item.click
    sku_item_search_noTapSearchIcon($skuNumber)
    @product_title = prod_var_title.text
    my_library_corner_label.click
    sleep 5
    i_want_tab2.click
    sleep 7
    page_scroll_down(0.50, 0.80)
    sleep 2
    page_scroll_down(0.80, 0.50)
    sleep 5
    view_my_lib_button.click
    sleep 7
    #expect(lib_prod_name[0].text).to eq('Need for Speed: Most Wanted')
    expect(lib_prod_name[0].text).to eq(@product_title)
    sleep 7
    lib_prod_list_menu.click
    sleep 3
    lib_menu_delete.click
    sleep 7
    expect(search_empty_result.text).to eq("You have no items in this Game Library list.")


  end




end