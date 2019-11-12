require 'dimensions'

module CommonFunctionsDSL
  def restart_adb
    pid = spawn("cmd /c start powershell adb kill-server")
    Process.wait(pid)
    sleep 2
    pid2 = spawn("cmd /c start powershell adb start-server")
    Process.wait(pid2)
  end
  def start_emulator(emulator, port)
    $log.trace("Starting emulator #{emulator} with port #{port}")
    process = ProcessBuilder.build("cmd /c start powershell emulator -avd #{emulator} -dns-server '172.22.1.21,172.22.1.99' -port #{port} -noaudio -no-boot-anim",) do |builder|
      # process = ProcessBuilder.build("cmd /c start powershell emulator -avd #{emulator} -dns-server 172.22.1.21",) do |builder|
    end
    #pid =
        process.spawn
    # puts "#{pid}::#{process_to_do}"
    sleep 10
  end

  def close_emulator(emulator_port)
    # $log.trace("Closing emulator with port #{emulator_port}")
    process = ProcessBuilder.build("cmd /c start powershell adb -s emulator-#{emulator_port} emu kill",) do |builder|
    end
    #pid =
        process.spawn
    # puts "#{pid}::close emulator"
    sleep 10
  end

  def start_appium(port)
      $log.trace("Starting Appium with port #{port}")
      # process = ProcessBuilder.build("cmd /c start powershell appium -a 127.0.0.1 -p #{port} --session-override",) do |builder|
      # process = ProcessBuilder.build("cmd /c start powershell appium -p #{port} --session-override",) do |builder|
      process = ProcessBuilder.build("cmd /c start powershell appium -a 127.0.0.1 -p #{port}",) do |builder|
      end
      #pid =
      process.spawn
        # puts "#{pid}::Start Appium"
  end

  def close_appium(port)
    # $log.trace("Closing Appium with port #{port}")
    # process = ProcessBuilder.build("Taskkill /IM node.exe /F",) do |builder|
    delims = %Q("tokens=5 delims= ")

    process = ProcessBuilder.build("FOR /F #{delims} %P IN ('netstat -a -n -o ^| findstr :#{port}.*LISTENING') DO TaskKill.exe /F /PID %P >NUL 2>&1",) do |builder|
    end
    #pid =
    process.spawn
    # puts "#{pid}::Kill Appium"
  end

  def clear_data
    process = ProcessBuilder.build("cmd /c start powershell adb shell pm clear com.gamestop.powerup.gti",) do |builder|
    end
    #pid =
    process.spawn
  end

  def restart_app
    sleep 15
    close_all_recent_app
    launch_app
    sleep 15
  end

  def get_screenshot(file_path, example)
    $log.trace("CommonFunctionsDSL: #{__method__}")
    if example.exception != nil and example.exception.message.include?("server")
      no_device= true
    else
      no_device= false
    end

    unless no_device
      final_description = "#{example.description.parameterize}"
      # file_path = "C:/Users/Public/android_output/screenshots/#{final_description}"
      FileUtils.mkdir_p file_path unless File.exists?(file_path)
      screenshot("#{file_path}/#{final_description}.png")
    end
  end

  def get_screenshot2(file_path, example)


      # file_path = "C:/Users/Public/android_output/screenshots/#{final_description}"
      FileUtils.mkdir_p file_path unless File.exists?(file_path)
      screenshot("#{file_path}/#{example}.png")

  end

  def verticalSwipe(driver, startPercentage, endPercentage, duration)

    width = 1080
    height = 1920
    width = (width / 2).to_i
    startPoint = (height * startPercentage).to_i
    endPoint = (height * endPercentage).to_i
    TouchAction action = TouchAction.new(driver)
    action.press(width,startPoint).wait(duration).move_to(width,endPoint).release.perform


  end

  def back_to_home_page

    while exists{back_navigation}
      back_navigation.click
      allow_access_device_location(false)
    end

  end


end

