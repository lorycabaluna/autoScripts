
class AndroidApp
  attr_reader :app_instance
  def self.new(config_objs)
    @app_instance = Appium::Driver.new(config_objs.capabilities, config_objs.is_global_driver)
    # capabilities = CapabilitiesCreator.configure_and_return_driver_capabilities(config_objs)
    # Appium::Driver.new(capabilities, false)
    Appium.promote_appium_methods(RSpec::Core::ExampleGroup, @app_instance)
    Appium.promote_singleton_appium_methods(DriverModules, @app_instance)
    # include DriverModules
    return @app_instance
  end

  # def self.include_modules(script_class)
  #   script_class.module_eval do
  #     include RSpec::Matchers
  #   end
  # end

  def self.promote_methods

  end


end
#
# #TODO: replace this with AppiumNativeAppConfig
# module CapabilitiesCreator
#   def self.configure_and_return_driver_capabilities(opts)
#     return opts = {caps:
#                        {automationName: 'Appium',
#                         deviceName: 'nexus_4_8_0',
#                         platformName: 'Android',
#                         platformVersion: '8.0',
#                         appPackage: 'com.gamestop.powerup.gti',
#                         app: 'C:\Users\c101567\RubymineProjects\NativeAppAndroidAutomation\NonScripts\files\apk\gamestop_android_app.apk'} #,
#                    # appium_lib: {
#                    #     wait_timeout: 4,
#                    #     wait_interval: 1
#                    # }
#     } if opts == nil
#   end
#
# end