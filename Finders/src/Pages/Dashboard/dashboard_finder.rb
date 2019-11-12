module DriverModules
  module Dashboard
    extend self
    # class << self
    def new_user_tutorial

      FindersDef.new(self).find_element("id", "com.gamestop.powerup.gti:id/tutorial_ximageview", __method__)

    end

    def accept_alert
      FindersDef.new(self).switchTo().alert()
      alert.accept();

    end


    def has_alert_title
      wait(20) { find_element(:id, 'actionlayout_search_edittext') }
      @alert_count = find_elements(:xpath, "//android.widget.TextView[contains(@resource-id,'alertTitle')]").size()
      (@alert_count > 0) ? true : false
    end

    def alert_title
      # wait(20) { find_element(:id, 'com.gamestop.powerup.gti:id/alertTitle') }
      FindersDef.new(self).find_element("id", "com.gamestop.powerup.gti:id/alertTitle", __method__)
    end

    def alert_message
      FindersDef.new(self).find_element("id", "android:id/message", __method__)
      # wait(20) { find_element(:id, "android:id/message") }
    end

    def no_or_cancel_link
      # wait(20) { find_elements(:id, "android:id/button2") }
      # FindersDef.new(self).find_elements("id", "android:id/button2", __method__)
      FindersDef.new(self).find_element("id", "android:id/button2", __method__)
    end

    def yes_or_ok_link
      # wait(20) { find_element(:id, "android:id/button1") }
      FindersDef.new(self).find_element("id", "android:id/button1", __method__)
    end

    def access_location_message
      #FindersDef.new(self).find_element("xpath", "//android.widget.Button[contains(@resource-id,'permission_message')]", __method__)
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[contains(@resource-id,'permission_message')]", __method__)


      # find_element(:xpath, "//android.widget.Button[contains(@resource-id,'permission_message')]")
    end

    def deny_location_button
      FindersDef.new(self).find_element("id", "com.android.packageinstaller:id/permission_deny_button", __method__)
    end

    def allow_location_button
      # wait { find_element(:id, "android:id/button2") }
      #FindersDef.new(self).find_element("xpath", "//android.widget.Button[contains(@resource-id,'permission_allow_button')]", __method__)
      FindersDef.new(self).find_element("id", "com.android.packageinstaller:id/permission_allow_button", __method__)


    end

    def allow_access_device_location_alert
      FindersDef.new(self).find_element("id","dialog_container",__method__)

    end

    def trade_tutorial_db
      # wait(20) { find_element(:id, "fragment_tradetutorialoverlay_contentlinearlayout") }
      FindersDef.new(self).find_element("id", "fragment_tradetutorialoverlay_contentlinearlayout", __method__)
    end

    def trade_tutorial_title
      FindersDef.new(self).find_element("id", "view_tradetutorialoverlay_content_titletextview", __method__)
    end

    def trade_tutorial_subtitle
      FindersDef.new(self).find_element("id", "view_tradetutorialoverlay_content_subtitletextview", __method__)
    end

    def trade_tutorial_description
      FindersDef.new(self).find_element("id", "view_tradetutorialoverlay_content_descriptiontextview", __method__)
    end

    def close_recent_app_button
      # wait(20){find_elements(:xpath, "//android.widget.ImageView[contains(@resource-id,'dismiss_task')]")}
      FindersDef.new(self).find_elements("xpath", "//android.widget.ImageView[contains(@resource-id,'dismiss_task')]", __method__)
    end

    def powerup_rewards_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='POWERUP REWARDS']", __method__)
    end

    def pre_orders_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='PRE-ORDERS']", __method__)
    end

    def saved_trades_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='SAVED TRADES']", __method__)
    end

    def active_offers_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='ACTIVE OFFERS']", __method__)
    end

    def game_informer_news_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='GAME INFORMER NEWS']", __method__)
    end

    def my_library_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='MY LIBRARY']", __method__)
    end

    def digital_locker_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='DIGITAL LOCKER']", __method__)
    end

    def settings_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='SETTINGS']", __method__)
    end

    def about_feedback_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='ABOUT/FEEDBACK']", __method__)
    end

    def signout_auth
      FindersDef.new(self).find_element("xpath", "//android.widget.TextView[@text='SIGN OUT']", __method__)
    end



=begin
      TODO: Separate this functions
=end
    def close_new_user_tutorial

      sleep 3
      if exists{new_user_tutorial}
          new_user_tutorial.click
          sleep 5
      else
        tap_object(540,960)
      end

      page_scroll_sidewards(0.90, 0.10)
      page_scroll_sidewards(0.10,0.90)
    end
  end

end

# module Kernel
#   def dashboard
#     DriverModules::Dashboard
#   end
# end