require 'rspec'
require 'appium_lib'
require 'selenium-webdriver'

RSpec.describe 'Sample Appium Tests' do

  before(:all) do
    opts = {caps:
                {automationName: 'Appium',
                 deviceName: 'nexus_4_8_0',
                 # :browserName => "Android",
                 platformName: 'Android',
                 platformVersion: '8.0',
                 appPackage: 'com.gamestop.powerup.gti',
                 app: 'C:/dev/QAAutomationScripts/NativeMobile/spec/Android/app-release-unsigned.apk'} #,
            # appium_lib: {
            #     wait_timeout: 4,
            #     wait_interval: 1
            # }
    }
    @app = Appium::Driver.new(opts, false)
    @app.start_driver
    Appium.promote_appium_methods(RSpec::Core::ExampleGroup, @app)

    sleep 5
  end
  before(:each) do
    puts ''
  end
  after(:all) do
    @app.quit_driver
  end

  context 'when app loads' do
    it 'should have dashboard tutorial' do
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/tutorial_ximageview').click }
    end
    it 'should have common page objects' do
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/home_promocalloutttextview')
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/fragment_home_splashindicator_linearlayout')
      wait { @app.find_element(:xpath, "//android.widget.ImageButton[@content-desc='GameStop']").click }
    end
  end

  context 'when signing-in' do
    it 'should have sign-in option on hamburger menu' do
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_signintextview').click }
    end
    it 'should be able to sign-in' do
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/signin_email_edittext').send_keys('francisbarro@gamestop.com')
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/signin_pass_edittext').send_keys('Game$top01')
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/signin_signin_textview').click }
    end
    it 'will be able to see username' do
      wait { @app.find_element(:id, 'android:id/button2').click }
      wait { @app.find_element(:xpath, "//android.widget.ImageButton[@content-desc='GameStop']").click }
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/tutorial_ximageview').click }
      @app.scroll_to('SIGN OUT')
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_signouttextview')
      user_name = @app.find_element(:id, 'com.gamestop.powerup.gti:id/dashboard_top_username_textview').text
      expect(user_name).to be == 'Francis Barro'
    end
  end

  context 'when saving a trade' do
    it 'should have trade tab to click' do
      wait { @app.find_element(:xpath, "//android.widget.ImageButton[@content-desc='GameStop']").click }
      wait { @app.find_element(:xpath, "//android.widget.FrameLayout[@index='2']/android.widget.TextView[contains(@text,'TRADE')]").click }
    end
    it 'should have find trade values button' do
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/trade_makeatrade').click }
    end
    it 'should have trade tutorial dashboard' do
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/fragment_tradetutorialoverlay_contentlinearlayout')
      wait { @app.find_element(:xpath, "//android.widget.ImageButton[@content-desc='Navigate up']").click }
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/trade_makeatrade').click }
    end

    it 'should have a list of results after searching for trade' do
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/trade_gameslayout').click }
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/actionlayout_search_edittext').send_keys('mario')
      tap(@app)
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/trade_games_numresultstextview') }
    end
    it 'should display Saved Trade Summary' do
      wait { @app.find_element(:xpath, "//android.widget.ListView[@index='2']/android.widget.RelativeLayout[@index='1']").click }
      @app.scroll_to('SAVE ESTIMATE')
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/trade_detail_saveestimate').click }
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/savedtrade_detail_estimatesavedtextview') }
    end
  end

  context 'when searching for stores' do
    it 'should have store icon on head navigation' do
      wait { @app.find_element(:xpath, "//android.widget.ImageButton[@content-desc='Navigate up']").click }
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/action_stores').click }
    end
    it 'should ask for device location' do
      @app.find_element(:class, 'android.widget.ScrollView')
      wait { @app.find_element(:id, 'com.android.packageinstaller:id/permission_allow_button').click }
    end
    it 'should have search field to enter text' do
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/actionlayout_search_stores_edittext').send_keys('76051') }
      tap(@app)
    end
    it 'should have list stores based on search' do
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/actionlayout_search_stores_listmaptextview').click }
    end
    it 'should be able to select a store' do
      wait { @app.find_element(:xpath, "//android.widget.ListView[@index='1']/android.widget.RelativeLayout[@index='1']").click }
    end
    it 'should display store details' do
      @app.find_element(:id, 'com.gamestop.powerup.gti:id/store_detail_titletextview')
      wait { @app.find_element(:xpath, "//android.widget.ImageButton[@content-desc='Navigate up']").click }
    end
  end

  context 'when doing a game checkout via shop page' do
    it 'should have games on shop page' do
      wait { @app.find_element(:xpath, "//android.widget.ImageButton[@content-desc='Navigate up']").click }
      wait { @app.find_element(:xpath, "//android.widget.FrameLayout[@index='4']/android.widget.TextView[contains(@text,'SHOP')]").click }
      wait { @app.find_element(:xpath, "//android.widget.ListView[@index='0']/android.widget.RelativeLayout[@index='2']").click }
    end
    it 'should have search results' do
      wait { @app.find_element(:id, 'com.gamestop.powerup.gti:id/fragment_search_numresultstextview') }
      wait { @app.find_element(:xpath, "//android.widget.ListView[@index='1']/android.widget.RelativeLayout[@index='1']").click }
    end
  end

=begin
  TODO: Create a separate class for these functions
=end
  #NOTE: scrolling to elements to view
  def scroll_to(text)
    text = %Q("#{text}")
    args = Appium::Android::scroll_uiselector("new UiSelector().text(#{text})")
    find_element :uiautomator, args
  end

  #NOTE: use this to output in console window elements used
  def find_elem(tag, tag_desc)
    puts "element: #{tag} - #{tag_desc}"
    args = Appium::Android::scroll_uiselector("new UiSelector().#{tag}('#{tag_desc}').instance(0)")
    find_element :uiautomator, args
  end

  #NOTE: use this to tap element via coordinates. Nexus_6_8_0 - "x":1319, "y":2264. Nexus_4_8_0 - "x":703, "y":1115.
  # def tap(app, opts={'x': 703, 'y': 1115})
  #   Appium::Core::TouchAction.new(app).tap(opts).perform
  # end




end