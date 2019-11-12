# module Pages
module BrowseFinder
  extend self
  # class << self
  def search_result_list
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/search_listview",__method__)
  end

  def press_tab
    FindersDef::driver.press_keycode(61)
  end

  def search_empty_result
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/listheader_empty_textview",__method__)
  end

  def search_result_list_item
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/search_result_boxartimageview",__method__)
  end

  def search_result_list_item_preprod
    FindersDef.new(self).find_element("id","com.gamestop.powerup.preprod:id/search_result_boxartimageview",__method__)
  end


  def result_list_item_name
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/search_result_titletextview",__method__)
  end

  def result_list_item_rating_1
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/search_result_ratingstarimageview1",__method__)
  end
  def result_list_item_rating_2
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/search_result_ratingstarimageview2",__method__)
  end
  def result_list_item_rating_3
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/search_result_ratingstarimageview3",__method__)
  end
  def result_list_item_rating_4
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/search_result_ratingstarimageview4",__method__)
  end
  def result_list_item_rating_5
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/search_result_ratingstarimageview5",__method__)
  end

  def result_list_item_rating_text
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/search_result_ratingtextview",__method__)
  end

  def search_result_total
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/fragment_search_numresultstextview",__method__)
  end

  def search_filter_button
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/fragment_search_filtermaintoggletextview",__method__)
  end

  def sort_by_dropdown
    FindersDef.new(self).find_element("id","search_sortspinner",__method__)
  end

  def sort_by_actual_value
    FindersDef.new(self).find_element("xpath","//android.widget.Spinner/android.widget.TextView",__method__)
  end

  def sort_by_items
    FindersDef.new(self).find_elements("xpath","//android.widget.ListView/android.widget.TextView",__method__)
  end

  def sort_by_item(by)
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text = '#{by}']",__method__)
  end

  def filter_group(group_name)
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'#{group_name}')]",__method__)
  end

  def filter_item(item_name)
    FindersDef.new(self).find_element("xpath","//android.widget.CheckBox[contains(@text,'#{item_name}')]",__method__)
  end


  # end

  # SHOP Objects
  def shop_mysavedsearches_link
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='MY SAVED SEARCHES']",__method__)
  end

  def shop_comingsoon_link
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='COMING SOON']",__method__)
  end

  def shop_games_link
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='GAMES']",__method__)
    # @driver.find_element(id, id_name)
  end

  def shop_consoles_link
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='CONSOLES']",__method__)
  end

  def shop_electronics_link
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='ELECTRONICS']",__method__)
  end

  def shop_collectibles_link
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='COLLECTIBLES']",__method__)
  end

  def shop_category_titles
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/shop_category_title",__method__)
  end

  def shop_category_subtitles
    FindersDef.new(self).find_elements("id","com.gamestop.powerup.gti:id/shop_category_subtitle",__method__)
  end

  def ss_title
    FindersDef.new(self).find_element("id","watchlist_category_title",__method__)
  end

  def ss_query
    FindersDef.new(self).find_element("id","watchlist_category_query",__method__)
  end

  def ss_filter_groups
    FindersDef.new(self).find_elements("id","android:id/text1",__method__)
  end

  def ss_filter_group(group_name)
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'#{group_name}')]",__method__)
  end

  def ss_filter_item(item_name)
    FindersDef.new(self).find_element("xpath","//android.widget.CheckBox[@text='#{item_name}']",__method__)
  end

  def ss_filter_save
    FindersDef.new(self).find_element("id","action_done",__method__)
  end

  def ss_add_icon
    FindersDef.new(self).find_element("id","action_add",__method__)
  end

  def ss_menu_dots
    FindersDef.new(self).find_elements("id","shop_category_overflow",__method__)
  end

  def ss_edit
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'Edit')]",__method__)
  end

  def ss_delete
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'Delete')]",__method__)
  end

  def ss_empty_list
    FindersDef.new(self).find_element("id","android:id/empty",__method__)
  end

  def preferred_console_link
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[@text='PREFERRED CONSOLES']",__method__)
  end

  def search_result_counts
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/fragment_search_numresultstextview",__method__)
  end

  def filter_link
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/fragment_search_filtermaintoggletextview",__method__)
  end

  def filter_category(category)
    FindersDef.new(self).find_element("xpath","//android.widget.TextView[contains(@text,'#{category}')]",__method__)
  end

  def done_filter_button
    FindersDef.new(self).find_element("id","com.gamestop.powerup.gti:id/fragment_search_filtermaintoggletextview",__method__)
  end

  def category_item_selected(nameOfitem)
    FindersDef.new(self).find_element("xpath","//android.widget.CheckBox[@text='#{nameOfitem}']",__method__)
  end

  # SHOP Objects
end
# end

# module Kernel
#   def browse
#     Pages::BrowseFinder
#   end
# end