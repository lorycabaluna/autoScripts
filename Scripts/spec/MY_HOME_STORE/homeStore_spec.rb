require_relative '../../dsl/src/dsl'


RSpec.describe 'Home Store' do
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

  it 'ECOMDEV-10994: should select preferred home store location as GU',:tc01 do

    $objData.insertTestData('MYHOMESTORE','TC01')
    puts "user type:#{$userType}"
    puts "zip code: #{$zipCode}"
    puts "sku number: #{$skuNumber}"


      sleep 10
      stores_icon.click
      allow_access_device_location(true)
      store_finder_field.click
      store_finder_field.send_keys($zipCode)
      keypad_search_button_tap
      sleep 10
      store_map_list.click
      sleep 2
      #selected_home_store.click
      tap_store_location(237,291)
      sleep 4
      @store_title = store_title.text
      set_as_home_store.click
      sleep 2
      expect(set_as_home_store.text).to eq("YOUR HOME STORE")
      while !exists{hamburger_menu}
        back
      end
      sku_item_search($skuNumber)
      sleep 5
      expect(pdp_store_name.text).to eq(@store_title)

  end

  it 'ECOMDEV-10995: should select preferred home store location as AU',:tc02 do

    $objData.insertTestData('MYHOMESTORE','TC02')
    puts "user type:#{$userType}"
    puts "zip code: #{$zipCode}"
    puts "sku number: #{$skuNumber}"

      user_login_only($userType)
      sleep 10
      stores_icon.click
      allow_access_device_location(true)
      store_finder_field.click
      store_finder_field.send_keys($zipCode)
      keypad_search_button_tap
      sleep 10
      store_map_list.click
      sleep 2
      tap_store_location(237,491)
      sleep 4
      @store_title = store_title.text
      set_as_home_store.click
      sleep 2
      expect(set_as_home_store.text).to eq("YOUR HOME STORE")
      while !exists{hamburger_menu}
        back
      end
      sku_item_search($skuNumber)
      sleep 5
      expect(pdp_store_name.text).to eq(@store_title)


  end



  def get_user_data(user_role, payment_type)
    XMLManipulation.new(user_role, payment_type)
  end

end