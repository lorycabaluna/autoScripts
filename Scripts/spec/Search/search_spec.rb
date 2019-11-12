require_relative '../../dsl/src/dsl'


RSpec.describe 'Search Tests' do
  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    #close_appium(@config.capabilities[:appium_lib][:port])
    #close_emulator(@config.emulator_port)
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
    close_new_user_tutorial
    #close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    #back_to_home_page
    # log_out_user_account
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 7
  end

  after(:all) do
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 5
  end

  #Covers TCID: [42421]
  # it 'ECOMDEV-10716: Add new Saved Search',:tc01 do
  #
  #   shopTab('GAMES')
  #   saved_searches('ADD')
  #
  # end
  #
  # #Covers TCID: [42420]
  # it 'ECOMDEV-10717: Create/Edit/Delete Saved Search',:tc02 do
  #
  #   shopTab('MY SAVED SEARCHES')
  #   saved_searches('CREATE')
  #   saved_searches('EDIT')
  #   saved_searches('DELETE')
  #
  # end

  it 'ECOMDEV-10715: Search an item on USER preferred CONSOLES',:tc03 do

    @count = 0
    user_login_only('ECPPRO')
    hamburger_menu.click
    close_new_user_dashboard_tutorial
    set_console_img.click
    select_lists_of_consoles(3)
    while (!exists{hamburger_menu})
      back
      press_keycode(4)
    end
    shop_tab.click
    expect(exists{preferred_console_link}).to eq(true)
    preferred_console_link.click

    while (!exists{search_result_counts} && @count <=2)
        back
        press_keycode(4)
        preferred_console_link.click
        @count +=1

    end

    expect(exists{search_result_counts}).to eq(true)


  end

  it 'ECOMDEV-10714: Search item/ product on SHOPS > COMING SOON products',:tc04 do
    @count = 0
    shopTab('COMING SOON')
    while (!exists{search_result_counts} && @count <=2)
      back
      shop_comingsoon_link.click
      @count +=1

    end
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end



  it 'ECOMDEV-10713: Search item/ product on SHOPS > COLLECTIBLES category',:tc05 do
    @count = 0
    shopTab('COLLECTIBLES')
    while (!exists{search_result_counts} && @count <=2)
      back
      shop_comingsoon_link.click
      @count +=1

    end

    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end

  it 'ECOMDEV-10707: Search item/ product on SHOPS > GAMES category',:tc06 do
    @count = 0
    shopTab('GAMES')
    while (!exists{search_result_counts} && @count <=2)
      back
      shop_comingsoon_link.click
      @count +=1

    end

    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end

  it 'ECOMDEV-10711: Search item/ product on SHOPS > CONSOLES category',:tc07 do
    @count = 0
    shopTab('CONSOLES')
    while (!exists{search_result_counts} && @count <=2)
      back
      shop_comingsoon_link.click
      @count +=1

    end
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end


  it 'ECOMDEV-10712: Search item/ product on SHOPS > ELECTRONICS category',:tc08 do
    @count = 0
    shopTab('ELECTRONICS')
    while (!exists{search_result_counts} && @count <=2)
      back
      shop_comingsoon_link.click
      @count +=1

    end
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end


  it 'ECOMDEV-10719: Filter Products and sort by bs,rd,pa,pd ',:tc09 do
    tap_search_icon #search_icon.click
    sleep 5
    keypad_search_button_tap
    filter_link.click
    select_filter('Products', 'Audio') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end

  it 'ECOMDEV-10724: Filter Price and sort by bs,rd,pa,pd ',:tc10 do
    tap_search_icon #search_icon.click
    sleep 5
    keypad_search_button_tap
    filter_link.click
    select_filter('Price', 'Under $20') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end

  it 'ECOMDEV-10720: Filter Platform and sort by bs,rd,pa,pd ',:tc11 do
    tap_search_icon #search_icon.click
    sleep 5
    keypad_search_button_tap
    filter_link.click
    select_filter('Platform', 'Android') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end

  it 'ECOMDEV-10725: Filter ESRB and sort by bs,rd,pa,pd ',:tc12 do
    tap_search_icon #search_icon.click
    sleep 5
    keypad_search_button_tap
    filter_link.click
    select_filter('ESRB', 'Everyone') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end


  it 'ECOMDEV-10722: Filter Category and sort by bs,rd,pa,pd ',:tc13 do
    tap_search_icon #search_icon.click
    sleep 5
    keypad_search_button_tap
    filter_link.click
    select_filter('Category', '3D') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end

  it 'ECOMDEV-10721: Filter Condition and sort by bs,rd,pa,pd ',:tc14 do
    tap_search_icon #search_icon.click
    sleep 5
    keypad_search_button_tap
    filter_link.click
    select_filter('Condition', 'New') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end


  it 'ECOMDEV-10723: Filter Availability and sort by bs,rd,pa,pd ',:tc15 do
    tap_search_icon #search_icon.click
    sleep 5
    keypad_search_button_tap
    filter_link.click
    select_filter('Availability', 'This Week') #[Products,Platform,Condition,Category,Availability,Price,ESRB]
    expect(exists{search_result_counts}).to eq(true)

    select_from_sort_dropdown('Release Date') #Release Date", "Price Ascending", "Price Descending"
    select_from_sort_dropdown('Price Ascending')
    select_from_sort_dropdown('Price Descending')


  end








end