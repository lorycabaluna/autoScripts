module DriverModules
  module Menu
    extend self
    # class << self

    def hamburger_menu
      FindersDef.new(self).find_element("xpath","//android.widget.ImageButton[@content-desc='GameStop']",__method__)
      #wait(20) { find_element(:xpath, "//android.widget.ImageButton[@content-desc='GameStop']") }

    end

    def sign_in_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_signintextview",__method__)
      #wait(20) { find_element(:id, 'drawer_bottomview_nonpur_signintextview') }
      #
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SIGN IN']",__method__)

    end

    def nonpur_pur_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_rewardstextview",__method__)
      #wait(20) { find_element(:id, 'drawer_bottomview_nonpur_rewardstextview') }
    end




    def preorder_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_preorderstextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='PRE-ORDERS']",__method__)
    end

    def nonpur_save_trades_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_savedtradestextview",__method__)
      # wait { find_element(:id, 'drawer_bottomview_nonpur_savedtradestextview') }
    end

    def save_trades_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_savedtradestextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SAVED TRADES']",__method__)
    end

    def active_offers_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_offerstextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='ACTIVE OFFERS']",__method__)
    end

    def nonpur_gi_news_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_gameinformertextview",__method__)
      #wait(20) { find_element(:id, 'drawer_bottomview_nonpur_gameinformertextview') }
    end

    def empty_gi_page
      FindersDef.new(self).find_element("id","android:id/empty",__method__)
    end

    def gi_news_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_gameinformertextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='GAME INFORMER NEWS']",__method__)
    end

    def my_library_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_gamelibrarytextview",__method__)
    end

    def i_have_tab
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='I HAVE']",__method__)
    end

    def i_want_tab
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='I WANT']",__method__)
    end

    def i_had_tab
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='I HAD']",__method__)
    end


    def i_have_tab2
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_ihave_textview",__method__)
    end

    def i_want_tab2
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_iwant_textview",__method__)
    end

    def i_had_tab2
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_ihad_textview",__method__)
    end


    def my_library_add_item
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/additem_textview",__method__)
    end


    def my_library_corner_label
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/product_librarycorner_textview",__method__)
    end





    def add_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/action_add",__method__)
    end

    def lib_empty_list
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/listheader_empty_textview",__method__)
    end

    def lib_prod_img
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/gamelibrary_listitem_mainimageview",__method__)
    end

    def lib_prod_name
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/gamelibrary_listitem_titletextview",__method__)
    end

    def lib_prod_platform
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/gamelibrary_listitem_subtitletextview",__method__)
    end

    def lib_prod_release_date
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/gamelibrary_listitem_releasedatetextview",__method__)
    end

    def lib_prod_list_menu
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/gamelibrary_listitem_menuimageview",__method__)
    end

    def lib_menu_items
      FindersDef.new(self).find_elements("id","android:id/title",__method__)
    end

    def lib_menu_i_have
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@resource-id='android:id/title' and @text='I Have']",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='I Have']",__method__)

    end

    def lib_menu_i_want
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@resource-id='android:id/title' and @text='I Want']",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='I Want']",__method__)
    end

    def lib_menu_i_had
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@resource-id='android:id/title' and @text='I Had']",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='I Had']",__method__)
    end

    def lib_menu_delete
      #FindersDef.new(self).find_element("xpath","//android.widget.TextView[@resource-id='android:id/title' and @text='Delete']",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='Delete']",__method__)
    end





    def digital_locker_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_digitallockertextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='DIGITAL LOCKER']",__method__)
    end

    def messages_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_messagestextview",__method__)
      #wait(20) { find_element(:id, 'drawer_bottomview_nonpur_messagestextview') }
    end

    def nonpur_settings_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_settingstextview",__method__)
      #wait(20) { find_element(:id, 'drawer_bottomview_nonpur_settingstextview') }
    end

    def settings_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_settingstextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SETTINGS']",__method__)
    end

    def nonpur_about_feedback_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_abouttextview",__method__)
      #wait(20) { find_element(:id, 'drawer_bottomview_nonpur_abouttextview') }
    end

    def about_feedback_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_abouttextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='ABOUT/FEEDBACK']",__method__)
    end

    def nonpur_sign_out_option
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_nonpur_signouttextview",__method__)
      #wait(20) { find_element(:id, 'drawer_bottomview_nonpur_signouttextview') }
    end

    def sign_out_option
      #FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/drawer_bottomview_signouttextview",__method__)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='SIGN OUT']",__method__)


    end


    def push_message_option
      FindersDef.new(self).find_element("id","setting_messages",__method__)
      #wait(20) { find_element(:id, "setting_messages") }
    end

    def tutorial_toggle
      FindersDef.new(self).find_element("id","setting_tutorial_toggle",__method__)
      #wait(20) { find_element(:id, "setting_tutorial_toggle") }
    end

    def setting_instoreoffers_toggle
      FindersDef.new(self).find_element("id","setting_instoreoffers_toggle",__method__)
      #wait(20) { find_element(:id, "setting_instoreoffers_toggle") }
    end

    def fingerprint_toggle
      FindersDef.new(self).find_elements("id","setting_fingerprint_toggle",__method__)
      # wait(20) { find_elements(:id, "setting_fingerprint_toggle") }
    end

    def reset_button
      FindersDef.new(self).find_element("id","setting_reset_tutorials",__method__)
      #wait(20) { find_element(:id, "setting_reset_tutorials") }
    end

    def pm_toggle
      FindersDef.new(self).find_elements("id","message_title",__method__)
      # wait(20) { find_elements(:id, "message_title") }
    end

    def gamestop_label
      FindersDef.new(self).find_element("id","about_titletextview",__method__)
      #wait(20) { find_element(:id, "about_titletextview") }
    end

    def version_label
      FindersDef.new(self).find_element("id","about_versiontextview",__method__)
      #wait(20) { find_element(:id, "about_versiontextview") }
    end

    def copyright_label
      FindersDef.new(self).find_element("id","about_copyrighttextview",__method__)
      #wait(20) { find_element(:id, "about_copyrighttextview") }
    end

    def about_options
      FindersDef.new(self).find_elements("id","text1",__method__)
      # wait(20) { find_elements(:id, "text1") }
    end

    def about_pur
      FindersDef.new(self).find_element("id","about_poweruprewardstextview",__method__)
      #wait(20) { find_element(:id, "about_poweruprewardstextview") }
    end

    def about_gi
      FindersDef.new(self).find_element("id","about_gameinformertextview",__method__)
      #wait(20) { find_element(:id, "about_gameinformertextview") }
    end

    def about_onlineorder
      FindersDef.new(self).find_element("id","about_onlineordertextview",__method__)
      #wait(20) { find_element(:id, "about_onlineordertextview") }
    end

    def about_storeexperience
      FindersDef.new(self).find_element("id","about_storeexperiencetextview",__method__)
      #wait(20) { find_element(:id, "about_storeexperiencetextview") }
    end


    def about_somethingelse
      FindersDef.new(self).find_element("id","about_somethingelsetextview",__method__)
      #wait(20) { find_element(:id, "about_somethingelsetextview") }
    end

    def username_label
      FindersDef.new(self).find_element("id","dashboard_top_username_textview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_username_textview") }
    end

    def avatar_image
      FindersDef.new(self).find_element("id","dashboard_top_avatar_imageview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_avatar_imageview") }
    end

    def set_ava_username_label
      FindersDef.new(self).find_element("id","setavatar_username",__method__)
      #wait(20) { find_element(:id, "setavatar_username") }
    end

    def set_ava_image
      FindersDef.new(self).find_element("id","setavatar_avatar_imageview",__method__)
      #wait(20) { find_element(:id, "setavatar_avatar_imageview") }
    end

    def set_console_label
      FindersDef.new(self).find_element("id","dashboard_top_console_textview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_console_textview") }
    end

    def set_console_img
      FindersDef.new(self).find_element("id","dashboard_top_console_imageview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_console_imageview") }
    end

    def set_console_list_checkbox
      FindersDef.new(self).find_elements("id","console_textview",__method__)
      # wait(20) { find_elements(:id, "console_textview") }
    end

    def set_store_label
      FindersDef.new(self).find_element("id","dashboard_top_store_textview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_store_textview") }
    end

    def set_store_img
      FindersDef.new(self).find_element("id","dashboard_top_store_imageview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_store_imageview") }
    end

    def messages_label
      FindersDef.new(self).find_element("id","dashboard_top_message_textview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_message_textview") }
    end

    def messages_img
      FindersDef.new(self).find_element("id","dashboard_top_message_imageview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_message_imageview") }
    end

    def trade_credit_label
      FindersDef.new(self).find_element("id","dashboard_top_tradecreditlabel_textview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_tradecreditlabel_textview") }
    end

    def trade_credit_value
      FindersDef.new(self).find_element("id","dashboard_top_tradecredit_textview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_tradecredit_textview") }
    end

    def trade_credit_refresh
      FindersDef.new(self).find_element("id","dashboard_top_refreshcredit_imageview",__method__)
      #wait(20) { find_element(:id, "dashboard_top_refreshcredit_imageview") }
    end


    def set_console_lists(console_count)
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[@content-desc='setconsoles_listview']/android.widget.LinearLayout[#{console_count}]",__method__)
    end

=begin
    TODO: Separate this functions
=end

    def click_sign_in_option
      hamburger_menu.click
      sign_in_option.click
    end
    # end
  end
end

# module Kernel
#   def menu
#     Pages::Menu
#   end
# end