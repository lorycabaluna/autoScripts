module DriverModules
  module Stores
    extend self
    # class << self
    #   def search_icon
    #     wait { find_element(:id, 'com.gamestop.powerup.gti:id/action_search') }
    #   end

    def store_finder_field
      FindersDef.new(self).find_element("id", "actionlayout_search_stores_edittext", __method__)
    end

    def store_list_name
      FindersDef.new(self).find_elements("id", "stores_listitem_title_textview", __method__)
    end

    def store_title
      FindersDef.new(self).find_elements("id", "com.gamestop.powerup.gti:id/store_detail_titletextview", __method__)
    end


    def store_map_list
      FindersDef.new(self).find_element("id", "com.gamestop.powerup.gti:id/actionlayout_search_stores_listmaptextview", __method__)
    end

    #YOUR HOME STORE
    def set_as_home_store
      FindersDef.new(self).find_element("id", "com.gamestop.powerup.gti:id/store_detail_setashomestoretextview", __method__)
    end

    def store_title
      FindersDef.new(self).find_element("id", "com.gamestop.powerup.gti:id/store_detail_titletextview", __method__)
    end

    def selected_home_store
      FindersDef.new(self).find_element("id", "com.gamestop.powerup.gti:id/homestore_listitem_title_textview", __method__)
    end

    def pdp_store_name
      FindersDef.new(self).find_element("id", "com.gamestop.powerup.gti:id/product_detail_store_name", __method__)

    end








  end
end

# module Kernel
#   def stores
#     Pages::Stores
#   end
# end