require_relative '../../dsl/src/dsl'

RSpec.describe 'Trade tests' do
  before(:all) do
    #$test_data = DataFunctions.new("#{ENV['android_scripts']}/spec/Trade/trade_dataset.csv")
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    # close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
  end
  before(:each) do |example|
    # close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
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
    get_screenshot($log.log_trace_path,example)
    quit_driver
    close_emulator(@config.emulator_port)
    close_appium(@config.capabilities[:appium_lib][:port])
    sleep 7
  end
  after(:all) do
    close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
    sleep 5
  end

  # context 'when doing trade regression' do
  # it 'should update expired trades',:tc01 do
  #   user_data = get_user_data('nonpur', nil)
  #   sign_in_as_authenticated_user(user_data.login, user_data.password)
  #   update_expired_trade(1)
  # end

  # it 'should delete an Expired trade',:tc02 do
  #   #   user_data = get_user_data('purbasic', nil)
  #   #   sign_in_as_authenticated_user(user_data.login, user_data.password)
  #   #   delete_item_on_saved_trades('Expired', 1)
  #   # end

  #Covers TCID: [40923,40926]
  it 'tc40923: should save trade for games as nonpur',:tc01 do

    user_login_only('NONPUR')
    sleep 10
    trade_tab.click
    find_trade_values_tab.click
    sleep 5
    tap_object(515,1657) # This closes Trade Center screen.
    sleep 5
    games_tile.click
    trade_item_search('Call of Duty','GAMES')
    save_estimate_button.click
    sleep 10
    expect(saved_trade_message.text).to eq('Estimate Saved!')




  end

  #Covers TCID: [139947]
  it 'tc40924: should save trade for consoles as purbasic',:tc02 do

    user_login_only('PURBASIC')
    sleep 10
    trade_tab.click
    find_trade_values_tab.click
    sleep 5
    tap_object(515,1657) # This closes Trade Center screen.
    sleep 5
    consoles_tile.click
    trade_item_search('Xbox','CONSOLES')
    save_estimate_button.click
    sleep 10
    expect(saved_trade_message.text).to eq('Estimate Saved!')


  end

  #Covers TCID: [40925,40933]
  it 'tc40925: should save trade for electronics as purpro',:tc03 do


    user_login_only('PURPRO')
    sleep 10
    trade_tab.click
    find_trade_values_tab.click
    sleep 5
    tap_object(515,1657) # This closes Trade Center screen.
    sleep 5
    electronics_tile.click
    trade_item_search('Samsung','ELECTRONICS')
    sleep 5
    electronic_chooseYourProduct_listItem.click
    sleep 3
    tap_object(515,1657)
    save_estimate_button.click
    sleep 10
    expect(saved_trade_message.text).to eq('Estimate Saved!')



  end

  #Covers TCID: [139949]
  it 'tc40926: should save trade for accessories as PURBASIC',:tc04 do

    user_login_only('PURBASIC')
    sleep 10
    trade_tab.click
    find_trade_values_tab.click
    sleep 5
    tap_object(515,1657) # This closes Trade Center screen.
    sleep 5
    accessories_tile.click
    trade_item_search('Kinect','ACCESSORIES')
    save_estimate_button.click
    sleep 10
    expect(saved_trade_message.text).to eq('Estimate Saved!')



  end

  #Covers TCID: []
  it 'tc40933: should delete 1 Active and then All trades',:tc05 do

    user_login_only('PURBASIC')
    sleep 10
    trade_tab.click
    view_saved_trades_link.click
    sleep 10
    edit_trade_button.click
    sleep 3
    #saved_trades_listview_item.click
    tap_object(644,577)
    delete_button.click
    sleep 7
    select_all_button.click
    delete_button.click
    sleep 7
    expect(no_saved_trade_message.text).to eq('You have no saved trades.')



  end





end