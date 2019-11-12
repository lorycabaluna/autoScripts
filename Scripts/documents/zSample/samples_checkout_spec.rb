require_relative '../../dsl/src/dsl'

RSpec.describe 'Android NativeApp CheckOut tests' do
  before(:all) do
    # $test_data = DataFunctions.new
    # caps = AppiumNativeAppConfig.new
    # @app = AndroidApp.new(caps)
    # start_driver
    # # set_wait(20)
  end
  before(:each) do

  end
  after(:each) do |example|

  end
  after(:all) do
    # get_screenshot
    # quit_driver
  end

  context 'when doing checkout regression' do
    it 'whatever' do
      # p = Axlsx::Package.new
      # p.use_shared_strings = true
      #
      # p.workbook do |wb|
      #   # define your regular styles
      #   styles = wb.styles
      #   title = styles.add_style :sz => 15, :b => true, :u => true
      #   default = styles.add_style :border => Axlsx::STYLE_THIN_BORDER
      #   pascal_colors = { :bg_color => '567DCC', :fg_color => 'FFFF00' }
      #   pascal = styles.add_style pascal_colors.merge({ :border => Axlsx::STYLE_THIN_BORDER, :b => true })
      #   header = styles.add_style :bg_color => '00', :fg_color => 'FF', :b => true
      #   money = styles.add_style :format_code => '#,###,##0', :border => Axlsx::STYLE_THIN_BORDER
      #   money_pascal = styles.add_style pascal_colors.merge({ :format_code => '#,###,##0', :border => Axlsx::STYLE_THIN_BORDER })
      #   percent = styles.add_style :num_fmt => Axlsx::NUM_FMT_PERCENT, :border => Axlsx::STYLE_THIN_BORDER
      #   percent_pascal = styles.add_style pascal_colors.merge({ :num_fmt => Axlsx::NUM_FMT_PERCENT, :border => Axlsx::STYLE_THIN_BORDER })
      #
      #   wb.add_worksheet(:name => 'Data Bar Conditional Formatting') do  |ws|
      #     ws.add_row ['A$$le Q1 Revenue Historical Analysis (USD)'], :style => title
      #     ws.add_row
      #     ws.add_row ['Quarter', 'Profit', '% of Total'], :style => header
      #     # Passing one style applies the style to all columns
      #     ws.add_row ['Q1-2010', '15680000000', '=B4/SUM(B4:B7)'], :style => pascal
      #
      #     # Otherwise you can specify a style for each column.
      #     ws.add_row ['Q1-2011', '26740000000', '=B5/SUM(B4:B7)'], :style => [pascal, money_pascal, percent_pascal]
      #     ws.add_row ['Q1-2012', '46330000000', '=B6/SUM(B4:B7)'], :style => [default, money, percent]
      #     ws.add_row ['Q1-2013(est)', '72230000000', '=B7/SUM(B4:B7)'], :style => [default, money, percent]
      #
      #     # You can merge cells!
      #     ws.merge_cells 'A1:C1'
      #
      #   end
      # end
      # p.serialize 'getting_barred.xlsx'
    end

    # it 'should be able to checkout New product using Visa cc as AU non-pur member' do
      # close_new_user_dashboard_tutorial
      # sign_in_as_authenticated_user('auto_user_02@qagsecomprod.oib.com','Testing123')
      # search_by_sku_or_keyword(random_keyword)
      # filter_search_results("Condition:New;Availability:Usually ships in 24 hours;ESRB:Everyone;")
      # select_item_on_search_results(1)
      # checkout_from_pdp(true,'New')
      # place_order_by_header_button(false)
    # end

    # it 'should be able to checkout Digital product using MasterCard cc as AU pur-basic member' do
    #   close_new_user_dashboard_tutorial
    #   sign_in_as_authenticated_user('auto_user_03@qagsecomprod.oib.com','Testing123')
    #   search_by_sku_or_keyword(random_keyword)
    #   filter_search_results("Condition:Download;Availability:Usually ships in 24 hours;ESRB:Everyone;")
    #   select_item_on_search_results(1)
    #   checkout_from_pdp(true,'Download')
    #   place_order_by_header_button(false)
    # end
    #
    # it 'should be able to checkout Pre-Owned product using Discover cc as AU pur-pro member' do
    #   close_new_user_dashboard_tutorial
    #   sign_in_as_authenticated_user('auto_user_01@qagsecomprod.oib.com','Testing123')
    #   search_by_sku_or_keyword(random_keyword)
    #   filter_search_results("Condition:Pre-Owned;Availability:Usually ships in 24 hours;ESRB:Everyone;")
    #   select_item_on_search_results(1)
    #   checkout_from_pdp(true,'Pre-Owned')
    #   place_order_by_header_button(false)
    # end
    #
    # it 'should be able to checkout Pre-Owned product using AmEx cc as AU pur-elite member' do
    #   close_new_user_dashboard_tutorial
    #   sign_in_as_authenticated_user('auto_user_04@qagsecomprod.oib.com','Testing123')
    #   search_by_sku_or_keyword(random_keyword)
    #   filter_search_results("Condition:Pre-Owned;Availability:Usually ships in 24 hours;ESRB:Everyone;")
    #   select_item_on_search_results(1)
    #   checkout_from_pdp(true,'Pre-Owned')
    #   place_order_by_header_button(false)
    # end
    #
    # it 'should be able to checkout Refurbished product using GC as AU pur-basic member' do
    #   user_data = get_user_data(nil,'visa')
    #   close_new_user_dashboard_tutorial
    #   sign_in_as_authenticated_user('auto_user_05@qagsecomprod.oib.com','Testing123')
    #   search_by_sku_or_keyword('Refurbished')
    #   filter_search_results("Condition:Refurbished;Availability:Usually ships in 24 hours;ESRB:Everyone;")
    #   select_item_on_search_results(1)
    #   checkout_from_pdp(true,'Refurbished')
    #   select_and_add_payment_method('purbasic',user_data.card_data)
    #   add_gc_promo_purcc('gc','6006493711999901256','2487')
    #   place_order_by_header_button(false)
    # end
    #
    # it 'should be able to checkout New-PO product using paypal as AU pur-pro member' do
    #   close_new_user_dashboard_tutorial
    #   sign_in_as_authenticated_user('auto_user_01@qagsecomprod.oib.com','Testing123')
    #   search_by_sku_or_keyword('Planes: Fire &')
    #   # filter_search_results("Condition:New;")
    #   select_item_on_search_results(1)
    #   checkout_from_pdp(false,'New')
    #   select_and_add_payment_method('purpro','paypal')
    #   continue_paypal_checkout('bf_gsdc11@qagsecomprod.oib.com','T3sting!@#')
    # end
    #
    # #GU scenarios
    # it 'should be able to checkout New product using VISA CC as GU' do
    #   user_data = get_user_data('gu','visa')
    #   close_new_user_dashboard_tutorial
    #   search_by_sku_or_keyword('mario')
    #   filter_search_results("Condition:New;Availability:Usually ships in 24 hours;ESRB:Everyone;")
    #   select_item_on_search_results(1)
    #   checkout_from_pdp(true,'New')
    #   add_shipping_details_from_summary(user_data.shipping_data)
    #   select_delivery_option('Value')
    #   select_and_add_payment_method('gu',user_data.card_data)
    #   place_order_by_header_button(true)
    # end
    #
    # it 'should be able to checkout Pre-Owned product using Mastercard CC as GU' do
    #   user_data = get_user_data('gu','mastercard')
    #   close_new_user_dashboard_tutorial
    #   search_by_sku_or_keyword(random_keyword)
    #   filter_search_results("Condition:Pre-Owned;Availability:Usually ships in 24 hours;ESRB:Everyone;")
    #   select_item_on_search_results(1)
    #   checkout_from_pdp(true,'Pre-Owned')
    #   add_shipping_details_from_summary(user_data.shipping_data)
    #   select_delivery_option('Value')
    #   select_and_add_payment_method('gu',user_data.card_data)
    #   place_order_by_header_button(true)
    # end
  end

  def get_user_data(user_role,payment_type)
    XMLManipulation.new(user_role,payment_type)
  end
end