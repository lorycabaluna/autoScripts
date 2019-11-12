require_relative '../../dsl/src/dsl'


RSpec.describe 'Banners - View Ad' do
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

  it 'tc01: should view existing banners as Guest User',:tc01 do


    user_login_only('GUEST')

    expect(exists{hamburger_menu}).to eq(true)
    expect(exists{stores_icon}).to eq(true)
    expect(exists{cart_icon}).to eq(true)
    expect(exists{search_icon}).to eq(true)
    expect(exists{home_tab}).to eq(true)
    expect(exists{trade_tab}).to eq(true)
    expect(exists{shop_tab}).to eq(true)
    expect(exists{shop_button}).to eq(true)

    page_scroll_sidewards(0.90, 0.10)
    expect(exists{save_now_button}).to eq(true)

    page_scroll_sidewards(0.90, 0.10)
    expect(exists{view_deal_button}).to eq(true)

  end

  it 'tc02: should view existing banners as Auth User',:tc02 do


    user_login_only('ECPPRO')

    expect(exists{hamburger_menu}).to eq(true)
    expect(exists{stores_icon}).to eq(true)
    expect(exists{cart_icon}).to eq(true)
    expect(exists{search_icon}).to eq(true)
    expect(exists{home_tab}).to eq(true)
    expect(exists{trade_tab}).to eq(true)
    expect(exists{shop_tab}).to eq(true)
    expect(exists{shop_button}).to eq(true)

    page_scroll_sidewards(0.90, 0.10)
    expect(exists{save_now_button}).to eq(true)

    page_scroll_sidewards(0.90, 0.10)
    expect(exists{view_deal_button}).to eq(true)

  end

end