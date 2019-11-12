module DriverModules
  module HOPS
    extend self
    # class << self
    def search_store_field
      FindersDef.new(self).find_element("id","actionlayout_bops_search_stores_edittext",__method__)
      #wait(20) { find_element(:id, 'actionlayout_search_stores_edittext') }
    end

    def search_store_button
      FindersDef.new(self).find_element("id","actionlayout_search_stores_edittext",__method__)
      #wait(20) { find_element(:id, 'actionlayout_search_stores_edittext') }
    end

    def store_lists_count
      FindersDef.new(self).find_elements("xpath","//android.widget.ListView[contains(@resource-id,'stores_listview')]/android.widget.FrameLayout",__method__)
      # wait(20) { find_elements(:xpath, "//android.widget.ListView[contains(@resource-id,'stores_listview')]/android.widget.FrameLayout") }
    end

    def store_list(index)
      FindersDef.new(self).find_element("xpath","//android.widget.ListView[contains(@resource-id,'stores_listview')]/android.widget.FrameLayout[@index=#{index}]",__method__)
      #wait(20) { find_element(:xpath, "//android.widget.ListView[contains(@resource-id,'stores_listview')]/android.widget.FrameLayout[@index=#{index}]") }
    end

    def store_name(index)
      # FindersDef.new(self).find_element("id","tutorial_ximageview")
      wait(20) { find_elements(:id, 'stores_listitem_title_textview')[index-1] }
    end

    def store_names
      FindersDef.new(self).find_elements("id","stores_listitem_title_textview",__method__)
      # wait(20) { find_elements(:id, 'stores_listitem_title_textview')[index-1] }
    end

    def hold_new_button
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/storeavailability_listitem_holdnewtextview",__method__)
      # wait(20) { find_elements(:id, 'storeavailability_listitem_holdnewtextview') }
    end

    def hold_preowned_button
      FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/storeavailability_listitem_holdpreownedtextview",__method__)
      # wait(20) { find_elements(:id, 'storeavailability_listitem_holdpreownedtextview') }
    end

    def hold_refurbished_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/storeavailability_listitem_holdpreownedtextview",__method__)
      #wait(20) { find_element(:id, 'storeavailability_listitem_holdpreownedtextview') }

    end

    def user_details_fname
      FindersDef.new(self).find_element("id","hops_firstname_edittext",__method__)
      #wait(20) { find_element(:id, 'hops_firstname_edittext') }
    end

    def user_details_lname
      FindersDef.new(self).find_element("id","hops_lastname_edittext",__method__)
      #wait(20) { find_element(:id, 'hops_lastname_edittext') }
    end

    def user_details_email
      FindersDef.new(self).find_element("id","hops_email_edittext",__method__)
      #wait(20) { find_element(:id, 'hops_email_edittext') }
    end

    def user_details_pnumber
      FindersDef.new(self).find_element("id","hops_phonenumber_edittext",__method__)
      #wait(20) { find_element(:id, 'hops_phonenumber_edittext') }
    end

    def hops_continue_finish_button
      FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/hops_submit_textview",__method__)
      #wait(20) { find_element(:id, 'hops_submit_textview') }
    end

    def hops_cancel_button
      FindersDef.new(self).find_element("id","hops_cancel_textview",__method__)
      #wait(20) { find_element(:id, 'hops_cancel_textview') }
    end

    # def hops_confirmation_button
    #   # #wait(20) { find_element(:xpath, "//android.widget.TextView[@content-desc='hops_submit_textview']") }
    # end

    def hops_confirmation_message
      FindersDef.new(self).find_element("id","hops_belowtop_textview",__method__)
      #wait(20) { find_element(:id, 'hops_belowtop_textview') }
    end

    def hops_prod_name
      FindersDef.new(self).find_element("id","hops_title_textview",__method__)
      #wait(20) { find_element(:id, 'hops_title_textview') }
    end

    def hops_prod_condition
      FindersDef.new(self).find_element("id","hops_condition_textview",__method__)
      #wait(20) { find_element(:id, 'hops_condition_textview') }
    end

    def hops_prod_price
      FindersDef.new(self).find_element("id","hops_price_textview",__method__)
      #wait(20) { find_element(:id, 'hops_price_textview') }
    end

    def hops_prod_release_date
      FindersDef.new(self).find_element("id","hops_release_date_textview",__method__)
      # wait(20) { find_elements(:id, 'hops_release_date_textview')[0] }
    end

    def hops_prod_platform
      FindersDef.new(self).find_element("id","hops_platform_textview",__method__)
      #wait(20) { find_element(:id, 'hops_platform_textview') }
    end

    def hops_confirm_user_name
      FindersDef.new(self).find_element("id","view_hops_userinfo_title_textview",__method__)
      #wait(20) { find_element(:id, 'view_hops_userinfo_title_textview') }
    end

    def hops_confirm_user_email
      FindersDef.new(self).find_element("id","view_hops_userinfo_email_textview",__method__)
      #wait(20) { find_element(:id, 'view_hops_userinfo_email_textview') }
    end

    def hops_confirm_phone
      FindersDef.new(self).find_element("id","view_hops_userinfo_phonenumber_textview",__method__)
      #wait(20) { find_element(:id, 'view_hops_userinfo_phonenumber_textview') }
    end

    def hops_confirm_store
      FindersDef.new(self).find_element("id","view_hops_storeinfo_title_textview",__method__)
      #wait(20) { find_element(:id, 'view_hops_storeinfo_title_textview') }
    end

  end
end

# module Kernel
#   def hops
#     Pages::HOPS
#   end
# end