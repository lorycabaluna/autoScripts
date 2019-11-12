module DriverModules
  module Trade
    extend self
    # class << self
    def back_on_trade
      FindersDef.new(self).find_element("xpath","//android.widget.ImageButton[@content-desc='Navigate up']",__method__)
      #wait(20) { find_element(:xpath, "//android.widget.ImageButton[@content-desc='Navigate up']") }
    end

    # def make_trade_tile
    #   FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_makeatrade",__method__)
    #   #wait(20) { find_element(:id, "trade_makeatrade") }
    # end

    def find_trade_values_tab
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_makeatrade",__method__)
      #wait(20) { find_element(:id, "trade_makeatrade") }
    end

    def games_tile
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_gameslayout",__method__)
      #wait(20) { find_element(:id, "trade_gameslayout") }
    end

    def consoles_tile
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_consoleslayout",__method__)
      #wait(20) { find_element(:id, "trade_consoleslayout") }
    end

    def electronics_tile
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_electronicslayout",__method__)
      #wait(20) { find_element(:id, "trade_electronicslayout") }
    end

    def accessories_tile
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_accessorieslayout",__method__)
      #wait(20) { find_element(:id, "trade_accessorieslayout") }
    end

    def trade_result_item(index)
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[@index='2']/android.widget.RelativeLayout[@index='#{index}']",__method__)
      #wait(20) { find_element(:xpath, "//android.widget.ListView[@index='2']/android.widget.RelativeLayout[@index='#{index}']") }
    end

    def result_item_name
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/trade_games_result_titletextview",__method__)
      # wait(20) { find_elements(:id, "trade_games_result_titletextview")[index] }
    end

    def result_item_platform
      FindersDef.new(self).find_elements("id","trade_games_result_subtitletextview",__method__)
      # wait(20) { find_elements(:id, "trade_games_result_subtitletextview")[index] }
    end

    def electronics_list
      FindersDef.new(self).find_elements("id","search_category_textview",__method__)
      # wait(20) { find_elements(:id, "search_category_textview")[index] }
    end

    def quote_product_name
      FindersDef.new(self).find_element("id","trade_infopriceheader_titletextview",__method__)
      #wait(20) { find_element(:id, "trade_infopriceheader_titletextview") }
    end

    def quote_product_platform
      FindersDef.new(self).find_element("id","trade_infopriceheader_subtitletextview",__method__)
      #wait(20) { find_element(:id, "trade_infopriceheader_subtitletextview") }
    end

    def cardview_headers
      FindersDef.new(self).find_elements("id","trade_infopriceheader_usertype",__method__)
      # wait(20) { find_elements(:id, "trade_infopriceheader_usertype") }
    end

    def cardview_credit_value_label
      FindersDef.new(self).find_elements("id","trade_infopriceheader_creditlabeltextview",__method__)
      # wait(20) { find_elements(:id, "trade_infopriceheader_creditlabeltextview") }
      # find_elements(:xpath, "//android.widget.TextView[@content-desc='trade_infopriceheader_creditlabeltextview']") }
    end

    def cardview_credit_value_price
      FindersDef.new(self).find_elements("id","trade_infopriceheader_creditvaluetextview",__method__)
      # wait(20) { find_elements(:id, "trade_infopriceheader_creditvaluetextview") }
      # find_elements(:xpath, "//android.widget.TextView[@content-desc='trade_infopriceheader_creditvaluetextview']") }
    end

    def cardview_cash_value_label
      FindersDef.new(self).find_elements("id","trade_infopriceheader_cashlabeltextview",__method__)
      # wait(20) { find_elements(:id, "trade_infopriceheader_cashlabeltextview") }
      # find_elements(:xpath, "//android.widget.TextView[@content-desc='trade_infopriceheader_cashlabeltextview']") }
    end

    def cardview_cash_value_price
      FindersDef.new(self).find_elements("id","trade_infopriceheader_cashvaluetextview",__method__)
      # wait(20) { find_elements(:id, "trade_infopriceheader_cashvaluetextview") }
      # find_elements(:xpath, "//android.widget.TextView[@content-desc='trade_infopriceheader_cashvaluetextview']") }
    end

    def best_value_img
      FindersDef.new(self).find_element("id","trade_bestvalueflag_imageview",__method__)
      #wait(20) { find_element(:id, "trade_bestvalueflag_imageview") }
    end

    def reg_crv_for_pur
      FindersDef.new(self).find_element("id","trade_infopriceheader_regularcreditvaluetextview",__method__)
      # wait(20) { find_elements(:id, "trade_infopriceheader_regularcreditvaluetextview") }
    end

    def reg_cav_for_pur
      wait(20) { find_element(:id, "trade_infopriceheader_regularcashvaluetextview") }
      # find_elements(:xpath, "//android.widget.TextView[@content-desc='trade_infopriceheader_creditvaluetextview']") }
    end

    def save_estimate_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_detail_saveestimate",__method__)
      #wait(20) { find_element(:id, "trade_detail_saveestimate") }
      # #wait(20) { find_element(:xpath, "//android.widget.TextView[contains( @resource-id,'trade_detail_saveestimate')]") }
    end

    def saved_trade_message
      FindersDef.new(self).find_element("id","savedtrade_detail_estimatesavedtextview",__method__)
      #wait(20) { find_element(:id, "savedtrade_detail_estimatesavedtextview") }
      # #wait(20) { find_element(:xpath, "//android.widget.TextView[contains( @resource-id,'savedtrade_detail_estimatesavedtextview')]") }
    end

    def view_saved_trades_link
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/trade_values_savedtradestextview",__method__)
      # wait(20) { find_elements(:id, "trade_values_savedtradestextview") }
    end

    def saved_trade_list
      FindersDef.new(self).find_elements("xpath","//android.widget.ListView[contains( @resource-id,'savedtrades_listview')]/android.widget.LinearLayout",__method__)
      # wait(20) { find_elements(:xpath, "//android.widget.ListView[contains( @resource-id,'savedtrades_listview')]/android.widget.LinearLayout") }
    end

    def saved_trade_item_name(text)
      FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains( @resource-id,'savedtrade_listitem_titletextview') and @text='#{text}']",__method__)
      #wait(20) { find_element(:xpath, "//android.widget.TextView[contains( @resource-id,'savedtrade_listitem_titletextview') and @text='#{text}']") }
    end

    def saved_trade_header
      FindersDef.new(self).find_elements("id","savedtrade_listitem_headertextview",__method__)
      # wait(20) { find_elements(:id, "savedtrade_listitem_headertextview") }
    end

    def active_trade_header
      FindersDef.new(self).find_elements("xpath","//android.widget.TextView[contains( @text,'Active')]",__method__)
      # wait(20) { find_elements(:xpath, "//android.widget.TextView[contains( @text,'Active')]") }
    end

    def expired_trade_header
      FindersDef.new(self).find_elements("xpath","//android.widget.TextView[contains( @text,'Expired')]",__method__)
      # wait(20) { find_elements(:xpath, "//android.widget.TextView[contains( @text,'Expired')]") }
    end

    # def saved_trade_item_name(index)
    #   # # find_elements(:xpath, "//android.widget.LinearLayout[@index='#{index}']/android.widget.TextView[contains( @resource-id,'savedtrade_listitem_titletextview')]") }
    #   # find_elements(:xpath, "//android.widget.TextView[contains(@resource-id,'savedtrade_listitem_titletextview')]")[index] }
    # end

    def saved_trade_item_platform(index)
      FindersDef.new(self).find_elements("id","savedtrade_listitem_subtitletextview",__method__)[index]
      # wait(20) { find_elements(:id, "savedtrade_listitem_subtitletextview")[index] }
      # find_elements(:xpath, "//android.widget.TextView[contains( @resource-id,'savedtrade_listitem_subtitletextview')]")[index] }
    end

    def update_estimate_button(index)
      FindersDef.new(self).find_elements("id","savedtrade_listitem_updateestimatetextview",__method__)[index]
      # wait(20) { find_elements(:id, "savedtrade_listitem_updateestimatetextview")[index] }
    end

    def edit_trade_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/action_edit",__method__)
      #wait(20) { find_element(:id, "action_edit") }
    end

    def done_edit_trade_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/action_done",__method__)
      #wait(20) { find_element(:id, "action_done") }
      # #wait(20) { find_element(:xpath, "//android.widget.TextView[contains( @resource-id,'action_done')]") }
    end

    def select_all_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/savedtrades_selectalltextview",__method__)
      #wait(20) { find_element(:id, "savedtrades_selectalltextview") }
      # #wait(20) { find_element(:xpath, "//android.widget.TextView[contains( @resource-id,'savedtrades_selectalltextview')]") }
    end

    def delete_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/savedtrades_deletetextview",__method__)
      #wait(20) { find_element(:id, "savedtrades_deletetextview") }
    end

    def trade_item_checkbox
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/savedtrade_listitem_checkview",__method__)
      # wait(20) { find_elements(:id, "savedtrade_listitem_checkview") }
    end

    def no_saved_trade_message
      FindersDef.new(self).find_element("id","savedtrades_emptymessagestextview",__method__)
      #wait(20) { find_element(:id, "savedtrades_emptymessagestextview") }
    end

    def trade_games_lists_item
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[@content-desc='trade_games_listview']/android.widget.RelativeLayout[1]",__method__)
    end

    def trade_console_and_electronics_list_item
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[@content-desc='trade_consoles_listview']/android.widget.RelativeLayout[1]",__method__)
    end

    def trade_accessories_lists_item
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[@content-desc='trade_accessories_listview']/android.widget.RelativeLayout[1]",__method__)
    end

    def saved_trades_listview_item
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[@content-desc='savedtrades_listview']/android.widget.LinearLayout[1]/android.widget.RelativeLayout[2]",__method__)
    end

    def electronic_chooseYourProduct_listItem
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[@content-desc='trade_device_listview']/android.widget.TextView[1]",__method__)
    end


  end
end

# module Kernel
#   def header
#     Pages::Header
#   end
# end