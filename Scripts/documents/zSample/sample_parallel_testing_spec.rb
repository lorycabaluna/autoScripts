require_relative '../../dsl/src/dsl'

# RSpec.describe 'Android NativeApp Trade tests' do
#   before(:all) do
#     $test_data = DataFunctions.new('C:\dev\GS.Automation.AndroidApp\Scripts\spec\zSample\parallel_testing_dataset.csv')
#   end
#   before(:each) do
#
#   end
#   after(:all) do
#     close_appium(4752)
#     close_emulator(5556)
#   end
#
#   context 'when doing trade regression' do
#     it 'should be able to save trade for games' do
#       start_appium(4752)
#       start_emulator('Nexus_5X_8_0_1',5556)
#       caps = AppiumNativeAppConfig.new(return_caps, false)
#       @app = AndroidApp.new(caps)
#       @app.start_driver
#       @app.set_wait(20)
#       @app.close_new_user_dashboard_tutorial
#       # sign_in_as_authenticated_user('francisbarro@gamestop.com', 'Game$top01')
#       # save_trade('basic','Games','sonic')
#       @app.get_screenshot
#       @app.quit_driver
#     end
#   end
#
#   def get_user_data(user_role, payment_type)
#     XMLManipulation.new(user_role, payment_type)
#   end
#
#   def return_caps
#     default_opts = {caps:
#                         {automationName: 'Appium',
#                          deviceName: 'Nexus_5X_8_0_1',
#                          platformName: 'Android',
#                          platformVersion: '8.0',
#                          # appPackage: 'com.gamestop.powerup.gti',
#                          app: 'C:\dev\GS.Automation.AndroidApp\Scripts\documents\apk\beta\build_1545\mip_1545.apk'},
#                     appium_lib: {
#                         port: 4752
#                     }
#     }
#     return default_opts
#   end
# end

RSpec.describe 'Dynamic Tests' do
  # ['Nexus_5X_8_0_1', 'Pixel_6_0'].each_with_index do |val,ind|
  #   if ind.even? then
  #     emulator_port = 5554 + ind
  #   else
  #     emulator_port = 5555 + ind
  #   end
  #   appium_port = 4723 + ind
  #   (val == 'Pixel_6_0') ? version = '6.0' : version = '8.0'
  #   default_opts = {caps:
  #                       {automationName: 'Appium',
  #                        deviceName: val,
  #                        platformName: 'Android',
  #                        platformVersion: version,
  #                        # appPackage: 'com.gamestop.powerup.gti',
  #                        app: 'C:\dev\GS.Automation.AndroidApp\Scripts\documents\apk\beta\build_1545\mip_1545.apk'},
  #                   appium_lib: {
  #                       port: appium_port
  #                   }
  #   }
  #
  #   it "should do test with #{val}" do
  #     start_emulator(val,emulator_port)
  #     app_process = start_appium(appium_port)
  #     sleep 30
  #     caps = AppiumNativeAppConfig.new(default_opts, false)
  #     @app = AndroidApp.new(caps)
  #     @app.start_driver
  #     @app.set_wait(20)
  #     @app.close_new_user_dashboard_tutorial
  #     @app.quit_driver
  #     close_emulator(emulator_port)
  #     close_appium(appium_port)
  #   end
  # end
  #
  # def calculate_ports(index)
  #   if index.even? then
  #     emulator_port = 5554 + index
  #   else
  #     emulator_port = 5555 + index
  #   end
  #   appium_port = 4752 + index
  #
  #   return appium_port, emulator_port
  # end
  #
  # def return_caps(emu_name, index)
  #   default_opts = {caps:
  #                       {automationName: 'Appium',
  #                        deviceName: emu_name,
  #                        platformName: 'Android',
  #                        platformVersion: '8.0',
  #                        # appPackage: 'com.gamestop.powerup.gti',
  #                        app: 'C:\dev\GS.Automation.AndroidApp\Scripts\documents\apk\beta\build_1545\mip_1545.apk'},
  #                   appium_lib: {
  #                       port: index
  #                   }
  #   }
  #   return default_opts
  # end
  it "command test" do
    # exec("start powershell /.rspec appium")
    # sleep 10
    pid = wait(spawn("start cmd /.rspec appium"))
    puts pid
    puts Process.waitall
  end
end