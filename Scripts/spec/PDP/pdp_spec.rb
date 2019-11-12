require_relative '../../dsl/src/dsl'

RSpec.describe 'PDP tests' do
  before(:all) do
    @config = AppiumNativeAppConfig.new
    @config.capabilities[:caps][:automationName] = 'Appium'
    # close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
  end
  before(:each) do
    # close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
    restart_adb
    sleep 10
    start_emulator(@config.capabilities[:caps][:deviceName],@config.emulator_port)
    start_appium(@config.capabilities[:appium_lib][:port])
    sleep 10
    clear_data
    @app = AndroidApp.new(@config)
    start_driver
    set_wait(15)
    close_new_user_dashboard_tutorial
  end

  after(:each) do |example|
    get_screenshot($log.log_trace_path, example)
    quit_driver
    close_appium(@config.capabilities[:appium_lib][:port])
    close_emulator(@config.emulator_port)
    sleep 7
  end
  after(:all) do
    close_appium(@config.capabilities[:appium_lib][:port])
    # close_emulator(@config.emulator_port)
    sleep 5
  end

  # context 'when doing puas regression' do

  #GU scenarios

  it 'should validate item display for Digital item' do  #tc40943: Add Game to cart
    # $log.trace('Click Shop tab')
    # shop_tab.click
    # validate_shop_categ_title_sub_title('GAMES')
    # shop_games_link.click
    # $log.trace('Click Games')
    # validate_sorting_of_results
    # validate_search_result_default_objects
    # # filter_search_results('Availability:Usually ships in 24 hours')
    # select_item_on_search_results(1)
    # add_to_cart_random_prod_condition
    # cart_icon.click
    # cart_items = get_cart_items
    # fail("Games product #{prod_name[0].text} is not added to cart") if cart_items == nil



  end

  it 'should validate item display for Download item' do  #tc40944: Add Consoles to cart
    # $log.trace('Click Shop tab')
    # shop_tab.click
    # validate_shop_categ_title_sub_title('CONSOLES')
    # $log.trace('Click Consoles')
    # shop_consoles_link.click
    # validate_sorting_of_results
    # validate_search_result_default_objects
    # # filter_search_results('Availability:Usually ships in 24 hours')
    # select_item_on_search_results(1)
    # add_to_cart_random_prod_condition
    # cart_icon.click
    # cart_items = get_cart_items
    # fail("Games product #{prod_name[0].text} is not added to cart") if cart_items == nil


  end

  it 'should validate item display for New item' do #tc40945: Add Electronics to cart
    # $log.trace('Click Shop tab')
    # shop_tab.click
    # validate_shop_categ_title_sub_title('ELECTRONICS')
    # $log.trace('Click Electronics')
    # shop_electronics_link.click
    # validate_sorting_of_results
    # validate_search_result_default_objects
    # select_from_sort_dropdown("Release Date")
    # # filter_search_results('Availability:Usually ships in 24 hours')
    # select_item_on_search_results(1)
    # add_to_cart_random_prod_condition
    # cart_icon.click
    # cart_items = get_cart_items
    # fail("Games product #{prod_name[0].text} is not added to cart") if cart_items == nil

  end

  it 'should validate item display for PreOwned item' do #tc40946: Add Accessories to cart
    # $log.trace('Click Shop tab')
    # shop_tab.click
    # validate_shop_categ_title_sub_title('ACCESSORIES')
    # $log.trace('Click Accessories')
    # shop_accessories_link.click
    # validate_sorting_of_results
    # validate_search_result_default_objectsL
    # select_from_sort_dropdown("Release Date")
    # # filter_search_results('Availability:Usually ships in 24 hours')
    # select_from_sort_dropdown('Release Date')
    # select_item_on_search_results(3)
    # add_to_cart_random_prod_condition
    # cart_icon.click
    # cart_items = get_cart_items
    # fail("Games product #{prod_name[0].text} is not added to cart") if cart_items == nil

  end

  it 'should validate item display for PreOrder' do #tc85442: NFS Item
    # search_data = $search_data.get_all_data_from_row('917714')
    # search_and_select_first_result(search_data)
    # click_buy_button(search_data)
    # (search_data['is_mature'] == 'true') ?
    #     no_age_gate = exists { age_gate_container } :
    #     no_checkout_prompt = exists { buttons_container }
    # fail("BUY button for nfs product #{search_data['sku']} is not disabled") if no_age_gate or no_checkout_prompt

  end

  it 'should validate item display for Online item', do #tc87529: Online Only Item
    # search_data = $search_data.get_all_data_from_row('919309') #803913
    # search_and_select_first_result(search_data)
    # fail("Online only label should be displayed") unless exists { pdp_online_only_label }
    # click_buy_button(search_data)
    # (search_data['is_mature'] == 'true') ?
    #     no_age_gate = exists { age_gate_container } :
    #     no_checkout_prompt = exists { buttons_container }
    # fail("BUY button for nfs product #{search_data['sku']} is not disabled") if no_age_gate or no_checkout_prompt

  end


  it 'should validate item display for Refurbished' do #tc119201: 5* rating in search and pdp
    # search_icon.click
    # search_by_sku_or_keyword('100161') # 952002
    # star_ratings_complete = true
    # star_ratings_complete = false if !exists { result_list_item_rating_1 } || !exists { result_list_item_rating_2 } || !exists { result_list_item_rating_3 } || !exists { result_list_item_rating_4 } || !exists { result_list_item_rating_5 }
    # fail("missing star ratings on sku 952002") unless star_ratings_complete
    # fail("missing star ratings test on sku 952002") unless exists { result_list_item_rating_text }
    #
    # select_item_on_search_results(1)
    # pdp_star_ratings_complete = true
    # pdp_star_ratings_complete = false if !exists { pdp_item_rating_1 } || !exists { pdp_item_rating_2 } || !exists { pdp_item_rating_3 } || !exists { pdp_item_rating_4 } || !exists { pdp_item_rating_5 }
    # fail("missing star ratings on sku 952002") unless pdp_star_ratings_complete
    # fail("missing star ratings test on sku 952002") unless exists { pdp_item_rating_text }

  end

end



