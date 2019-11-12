module DriverModules
  module Header
    extend self
    # class << self

    def back_icon
      #FindersDef.new(self).find_element("xpath","//android.widget.ImageButton[@index='1']",__method__)
      # wait { find_element(:id, 'com.gamestop.powerup.gti:id/action_search') }
      FindersDef.new(self).find_element("accessibility id","Navigate up",__method__)
    end


    def back_navigation
      FindersDef.new(self).find_element("xpath","//android.widget.ImageButton[@content-desc='Navigate up']",__method__)
    end

    def search_back_icon
      FindersDef.new(self).find_element("xpath","//android.widget.ImageButton[@content-desc='Navigate up']",__method__)
    end

    def search_icon


      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/action_search",__method__)
      #FindersDef.new(self).find_element("accessibility id","Search",__method__)

      # FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@content-desc='Search')]",__method__)
      # FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@resource-id,'action_search')]",__method__)
      # wait { find_element(:id, 'action_search') }
    end

    def search_field
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/actionlayout_search_edittext",__method__)

    end

    def search_field_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/actionlayout_search_edittext",__method__)

    end




    def co_back_button
      FindersDef.new(self).find_element("xpath","//android.widget.ImageButton[@content-desc='Navigate up']",__method__)
    end

    #== for common function
    #TODO: put this functions in a common rb file
    #NOTE: button is for
    # def search_button_tap(x = nil, y = nil)
    #   x = 1317 if x==nil
    #   y = 2255 if y==nil
    #   Appium::Core::TouchAction.new(self).press('x':x, 'y':y).release.perform
    #   # press_keycode(84)
    # end

    def pay_button_tap(x=nil, y=nil)
      x = 720 if x==nil
      y = 1421 if y==nil
      Appium::Core::TouchAction.new(self).press( x,  y).release.perform
    end

    def back_button_tap(x=nil, y=nil)
      x = 98 if x==nil
      y = 168 if y==nil
      Appium::Core::TouchAction.new(self).press(x, y).release.perform
    end

    def delivery_options_tap(x=nil, y=nil)
      x = 720 if x==nil
      y = 770 if y==nil
      Appium::Core::TouchAction.new(self).press(x,  y).release.perform
    end

    def payment_information_tap(x=nil, y=nil)
      x = 720 if x==nil
      y = 970 if y==nil
      Appium::Core::TouchAction.new(self).press( x, y).release.perform
    end

    def promo_tap(x=nil, y=nil)
      x = 720 if x==nil
      y = 920 if y==nil
      Appium::Core::TouchAction.new(self).press(x, y).release.perform
    end

    def save_payment_tap(x=nil, y=nil)
      x = 720 if x==nil
      y = 1300 if y==nil
      Appium::Core::TouchAction.new(self).press(x, y).release.perform
    end

    def place_order_tap(x=nil, y=nil)
      x = 1203 if x==nil
      y = 334 if y==nil
      Appium::Core::TouchAction.new(self).press(x, y).release.perform
    end

    def tap_object(x, y)
      # x = 1317 if x==nil
      # y = 2255 if y==nil
      Appium::Core::TouchAction.new(self).press(x:x, y:y).release.perform


    end

    def scroll_to(text)
      $log.trace("scroll to #{text}!")
      text = %Q("#{text}")
      args = Appium::Android::scroll_uiselector("new UiSelector().textContains(#{text})")
        find_element :uiautomator, args

      # text = %("#{text}")
      # # arg_type = "android.widget.TextView" if arg_type == nil
      # # class_name = %("#{arg_type}")
      #
      # # arg = "new UiSelector().className(#{class_name}), #{text}"
      # # elem = find_element(:uiautomator, "new UiScrollable(new UiSelector().scrollable(true).instance(0)).getChildByText(#{arg})")
      # args = ["new UiSelector().textContains(#{text})", "new UiSelector().descriptionContains(#{text})"]
      # args.each_with_index do |arg, index|
      #   elem = find_element :uiautomator, scroll_uiselector(arg)
      # end
    end




    #def swipe(x_start,y_start,x_offset=0,y_offset=0)
    def swipe(x_start,y_start,x_offset=0,y_offset=0)
      #$log.trace("swipe from  #{x_start}, #{y_start} to #{x_offset}, #{y_offset}")
      # Appium::Core::TouchAction.new(self).press('x': 720, 'y': 1211).move_to('x': 0, 'y': 250).release.perform
      swipe_action = Appium::TouchAction.new(self).press(x_start, y_start).move_to(x_offset, y_offset).release
      swipe_action.perform
    end

    def scroll_selector(arg)
      "new UiScrollable(new UiSelector().scrollable(true).instance(0)).getChildByText(#{arg})"
    end


    #== for common function
    def cart_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/actionlayout_cart_imageview",__method__)
      # wait(20) { find_element(:id, 'actionlayout_cart_imageview') }
    end

    def cart_icon_preprod
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:preprod/actionlayout_cart_imageview",__method__)
      # wait(20) { find_element(:id, 'actionlayout_cart_imageview') }
    end

    def cart_icon_for_age_gate
      # FindersDef.new(self).find_element("id","dashboard_top_message_textview")
      wait(20) { find_elements(:id, 'com.gamestop.powerup.gti:id/actionlayout_cart_imageview') }
    end

    def cart_count
      #FindersDef.new(self).find_elements("xpath","//android.widget.TextView[contains(@resource-id,'actionlayout_cart_textview')]",__method__)
      # wait(20) { find_elements(:xpath, "//android.widget.TextView[contains(@resource-id,'actionlayout_cart_textview')]") }
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/actionlayout_cart_textview",__method__)

    end


    def cart_count_preprod
      #FindersDef.new(self).find_elements("xpath","//android.widget.TextView[contains(@resource-id,'actionlayout_cart_textview')]",__method__)
      # wait(20) { find_elements(:xpath, "//android.widget.TextView[contains(@resource-id,'actionlayout_cart_textview')]") }
      FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/actionlayout_cart_textview",__method__)

    end





    def stores_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/action_stores",__method__)
      # exists {find_element(:id, 'action_stores')}
    end

    def home_tab
      #FindersDef.new(self).find_element("xpath","//android.widget.FrameLayout[@index='0']/android.widget.TextView[contains(@text,'HOME')]",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='HOME']",__method__)

    end

    def trade_tab
      FindersDef.new(self).find_element("xpath","(//android.widget.FrameLayout[@content-desc='NO_RESOURCE_NAME'])[3]",__method__)
    end

    def find_values_title
      FindersDef.new(self).find_element("xpath","(//android.widget.FrameLayout[@content-desc='NO_RESOURCE_NAME'])[3]",__method__)
    end

    def shop_tab
      #FindersDef.new(self).find_element("xpath","//android.widget.FrameLayout[@index='4']/android.widget.TextView[contains(@text,'SHOP')]",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SHOP'][@index=0]",__method__)
    end

    def tool_bar_title
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/toolbar_title",__method__)
      # wait(20) {find_element(:id, 'com.gamestop.powerup.gti:id/toolbar_title')}
    end

    def progress_bar
      FindersDef.new(self).find_element("id","dashboard_top_message_textview",__method__)
      # !exists {find_elements(:id, 'com.gamestop.powerup.gti:id/view_blockingprogress_spinnerimageview')}
      # wait { find_element(:xpath, "//android.widget.TextView[contains(@resource-id,'toolbar_title')]") }
    end

    def add_to_save_search_icon
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/action_watchlist",__method__)
    end
  end


  #### New methods here ###

  def home_header_to_tap(header_icon_name)

    case header_icon_name.downcase

    when 'dashboard'
      tap_object(140,125)
    when 'location'
      tap_object(744,125)
    when 'cart'
      tap_object(878,125)
    when 'search'
      tap_object(1003,125)

    end
  end



end

# module Kernel
#   def header
#     Pages::Header
#   end
# end