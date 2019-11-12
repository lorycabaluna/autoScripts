require_relative '../../dsl/src/dsl'


RSpec.describe 'Dashboard' do
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

  it 'should view Dashboard menu as GUEST',:tc01 do


    user_login_only('GUEST')
    sleep 5
    hamburger_menu.click
    if exists{new_user_tutorial}
      new_user_tutorial.click
      sleep 5
    else
      tap_object(540,960)
    end
    page_scroll_down(0.50,0.20)
    expect(exists{sign_in_option}).to eq(true)
    expect(exists{pur_option}).to eq(true)
    expect(exists{messages_option}).to eq(true)
    expect(exists{preorder_option}).to eq(false)
    expect(exists{save_trades_option}).to eq(false)
    expect(exists{active_offers_option}).to eq(false)
    expect(exists{gi_news_option}).to eq(true)
    expect(exists{my_library_option}).to eq(false)
    expect(exists{digital_locker_option}).to eq(false)
    expect(exists{settings_option}).to eq(true)
    expect(exists{about_feedback_option}).to eq(true)
    expect(exists{sign_out_option}).to eq(false)

  end

  it 'should view Dashboard menu as NonPur',:tc02 do


    user_login_only('ECPNONPUR')
    sleep 5
    hamburger_menu.click
    if exists{new_user_tutorial}
      new_user_tutorial.click
      sleep 5
    else
      tap_object(540,960)
    end
    page_scroll_down(0.50,0.20)
    expect(exists{sign_in_option}).to eq(false)
    expect(exists{pur_option}).to eq(true)
    expect(exists{messages_option}).to eq(false)
    expect(exists{preorder_option}).to eq(false)
    expect(exists{save_trades_option}).to eq(true)
    expect(exists{active_offers_option}).to eq(false)
    expect(exists{gi_news_option}).to eq(true)
    expect(exists{my_library_option}).to eq(false)
    expect(exists{digital_locker_option}).to eq(false)
    expect(exists{settings_option}).to eq(true)
    expect(exists{about_feedback_option}).to eq(true)
    expect(exists{sign_out_option}).to eq(true)


  end

  it 'should view Dashboard menu as PurPro',:tc03 do


    user_login_only('ECPPRO')
    sleep 5
    hamburger_menu.click
    if exists{new_user_tutorial}
      new_user_tutorial.click
      sleep 5
    else
      tap_object(540,960)
    end
    page_scroll_down(0.50,0.20)
    expect(exists{sign_in_option}).to eq(false)
    expect(exists{pur_option}).to eq(true)
    expect(exists{messages_option}).to eq(false)
    expect(exists{preorder_option}).to eq(true)
    expect(exists{save_trades_option}).to eq(true)
    expect(exists{active_offers_option}).to eq(true)
    expect(exists{gi_news_option}).to eq(true)
    expect(exists{my_library_option}).to eq(true)
    expect(exists{digital_locker_option}).to eq(true)
    expect(exists{settings_option}).to eq(true)
    expect(exists{about_feedback_option}).to eq(true)
    expect(exists{sign_out_option}).to eq(true)


  end

  it 'should view Dashboard menu as PurPlayer',:tc04 do


    user_login_only('ECPPLAYER')
    sleep 5
    hamburger_menu.click
    if exists{new_user_tutorial}
      new_user_tutorial.click
      sleep 5
    else
      tap_object(540,960)
    end
    page_scroll_down(0.50,0.20)
    expect(exists{sign_in_option}).to eq(false)
    expect(exists{pur_option}).to eq(true)
    expect(exists{messages_option}).to eq(false)
    expect(exists{preorder_option}).to eq(true)
    expect(exists{save_trades_option}).to eq(true)
    expect(exists{active_offers_option}).to eq(true)
    expect(exists{gi_news_option}).to eq(true)
    expect(exists{my_library_option}).to eq(true)
    expect(exists{digital_locker_option}).to eq(true)
    expect(exists{settings_option}).to eq(true)
    expect(exists{about_feedback_option}).to eq(true)
    expect(exists{sign_out_option}).to eq(true)


  end




end