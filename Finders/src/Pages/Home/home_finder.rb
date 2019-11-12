module DriverModules
  module Home
    extend self


    # class << self
    #   def search_icon
    #     wait { find_element(:id, 'com.gamestop.powerup.gti:id/action_search') }
    #   end
    #
    #   def search_field
    #     wait { find_element(:id, 'com.gamestop.powerup.gti:id/actionlayout_search_edittext') }
    #   end
    #
    #   def search_button_tap
    #     Appium::Core::TouchAction.new(self).tap('x': 703, 'y': 1115).perform
    #   end
    # end


    # def home_tab
    #   FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='HOME']",__method__)
    # end

    # def trade_tab
    #   FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='TRADE']",__method__)
    # end
    #
    # def shop_tab
    #   FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SHOP']",__method__)
    # end
    #
    # def store_icon
    #   FindersDef.new(self).find_element("xpath","//android.widget.TextView[@content-desc='Stores']",__method__)
    # end

    def shop_button
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SHOP' and @index='3']",__method__)
    end

    def shop_now_button
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SHOP NOW' and @index='3']",__method__)
    end

    def save_now_button
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SAVE NOW' and @index='3']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/home_promocalloutttextview",__method__)
    end

    def view_deal_button
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SAVE NOW' and @index='3']",__method__)
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/home_promocalloutttextview",__method__)
    end


  end








end

# module Kernel
#   def home
#     Pages::Home
#   end
# end