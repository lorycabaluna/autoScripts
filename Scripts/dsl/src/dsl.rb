=begin DSL Notes:
    Add all requires here, then add require for this dsl
=end

require 'rspec'
require 'process_builder'
require 'rspec_html_formatter'

require 'appium_lib'
require 'selenium-webdriver'

require_relative '../../../Framework/Automation/common/src/common_requires'
require_relative '../../../Finders/src/requires/finders_require'
require_relative '../../../Scripts/dsl/src/spec_helper'

require_relative '../../../Scripts/dsl/src/common_functions_dsl'
require_relative '../../../Scripts/dsl/src/sign_in_functions_dsl'
require_relative '../../../Scripts/dsl/src/search_functions_dsl'
require_relative '../../../Scripts/dsl/src/pdp_functions_dsl'
require_relative '../../../Scripts/dsl/src/check_out_functions_dsl'
require_relative '../../../Scripts/dsl/src/puas_functions_dsl'
require_relative '../../../Scripts/dsl/src/trade_functions_dsl'
require_relative '../../../Scripts/dsl/src/dashboard_menu_functions_dsl'
require_relative '../../../Scripts/dsl/src/pur_functions_dsl'


require 'C:\dev\gs.automation.androidapp\Framework\Automation\common\Appium\src\appium_native_app.rb'
require 'C:\dev\gs.automation.androidapp\Framework\Automation\common\Appium\src\testData.rb'


include CommonFunctionsDSL
include SignInFunctionsDSL
include SearchFunctionsDSL
include PDPFunctionsDSL
include CheckOutFunctionsDSL
include PUASFunctionsDSL
include TradeFunctionsDSL
include DashboardMenuFunctionsDSL
include PURFunctionsDSL

