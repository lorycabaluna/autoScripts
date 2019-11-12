#TODO: Make it possible to set just one capability, instead of configuring all

require 'C:\dev\gs.automation.androidapp\Framework\Automation\common\Appium\src\testData.rb'

#require 'C:\dev\gs.automation.androidapp\Scripts\dsl\src\dsl.rb'


class AppiumNativeAppConfig
  attr_accessor :app_path, :capabilities, :is_global_driver, :emulator_port


  $obj = TestData.new()

  $obj.insertTestData('CONFIG','')

  puts $automationName
  puts $deviceName
  puts $platformName
  puts $platformVersion
  puts $appiumVersion
  puts $appPath + $apkBuild



  @default_opts = {caps:
                       {automationName: $automationName,
                        deviceName: $deviceName,
                        platformName: $platformName,
                        platformVersion: $platformVersion,
                        appiumVersion: $appiumVersion,
                        ignoreUnimportantViews: true,
                        app:$appPath + $apkBuild
                       },
                   appium_lib: {
                       port: 4723
                   }
  }



  def self.new(opts = nil, is_global_driver=false)
    print('\r\nappium native app config start...\r\n')
    @capabilities = Hash.new
    (opts != nil) ? @capabilities = opts : @capabilities = @default_opts
    @is_global_driver = is_global_driver
    @emulator_port = 5554
    return self
  end

  def self.get_driver_capabilities
    return @capabilities, @is_global_driver
  end

  def self.capabilities
    @capabilities
  end

  def self.is_global_driver
    @is_global_driver
  end

  def self.emulator_port
    @emulator_port
  end


end



