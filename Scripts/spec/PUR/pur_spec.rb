require_relative '../../dsl/src/dsl'


RSpec.describe 'PowerUp Rewards tests' do
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
    clear_data
    # restart_adb
    sleep 10
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    # clear_data
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



  it 'should display PUR PRO powerup rewards pages',:tc01 do

    powerupRewards('ECPPRO')
    purAccountInfo
    purMemberActivity
    purActiveOffers
    purCardDetails
    purRewardsCenter
    purGameInformer

  end

  it 'should display PUR PLAYER powerup rewards pages',:tc02 do

    powerupRewards('ECPPLAYER')
    purAccountInfo
    purMemberActivity
    purActiveOffers
    purCardDetails
    purRewardsCenter
    purGameInformer

  end

  it 'should display NONPUR powerup rewards pages',:tc03 do

    powerupRewards('ECPNONPUR')
    pur_NonPurUsersPage

  end

  it 'should display GUEST powerup rewards pages',:tc04 do
    powerupRewards('GUEST')
    pur_GuestUsersPage

  end




end