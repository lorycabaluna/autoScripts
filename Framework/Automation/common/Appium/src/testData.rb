 require 'roo'

 class TestData


	 def insertTestData (sheetName, testcaseNumber)
		 @workbook = Roo::Spreadsheet.open 'C:\dev\gs.automation.androidapp\Framework\Automation\common\Appium\src\TestData.xlsx'

		@selectSheet = sheetName.upcase


		@tcid = testcaseNumber.upcase
		 puts @tcid

			case @selectSheet

				when 'CONFIG'
					@sheet_index = 0

				when 'BOPS'
					@sheet_index = 1

				when 'CART'
					@sheet_index = 2

				when 'CHECKOUT'
					@sheet_index = 3

				when 'AGEGATE'
					@sheet_index = 4

				when 'ISPU'
					@sheet_index = 5

				when 'DASHBOARD'
					@sheet_index = 6

				when 'ERRORCHECK'
					@sheet_index = 7

				when 'HOPS'
					@sheet_index = 8

				when 'MYHOMESTORE'
					@sheet_index = 9

				when 'MYLIBRARY'
					@sheet_index = 10

				when 'SEARCH'
					@sheet_index = 11

				when 'TRADE'
					@sheet_index = 12

			  when 'PREPROD'
					@sheet_index = 13

			end


		 @workbook.default_sheet = @workbook.sheets[@sheet_index]

		 @selectSheet = (@workbook.default_sheet).upcase



		headers = Hash.new
		 @workbook.row(1).each_with_index{|header,i|
		headers[header] = i

		}


			((@workbook.first_row + 1)..@workbook.last_row).each do |row|

				case @selectSheet

					when 'CONFIG'

						$automationName = @workbook.row(row)[headers['Automation Name']]
						$deviceName = @workbook.row(row)[headers['Device Name']]
						$platformName = @workbook.row(row)[headers['Platform Name']]
						$platformVersion = @workbook.row(row)[headers['Platform Version']]
						$appiumVersion = @workbook.row(row)[headers['Appium Version']]
						$appPath = @workbook.row(row)[headers['App PATH']]
						$apkBuild = @workbook.row(row)[headers['APK Build']]
						@deviceUsed = @workbook.row(row)[headers['Selected Device']]

						if @deviceUsed.upcase == 'Y'

               return $automationName,$deviceName,$platformName,$platformVersion,$appiumVersion,$appPath,$apkBuild

						end

				#when 'BOPS','CART','CHECKOUT','AGEGATE','ISPU','DASHBOARD','ERRORCHECK','HOPS','MYHOMESTORE','MYLIBRARY','SEARCH','TRADE'
				when 'BOPS','CART','CHECKOUT','AGEGATE','ISPU','HOPS','ERRORCHECK','PREPROD'

						@tcNumber = (@workbook.row(row)[headers['TC Number']]).upcase

						$userType = (@workbook.row(row)[headers['User Type']]).upcase
						$skuNumber = (@workbook.row(row)[headers['SKU Number']])
						$zipCode = (@workbook.row(row)[headers['ZipCode']])
						$promoCode = (@workbook.row(row)[headers['PromoCode']])
						$giftTradeCard = (@workbook.row(row)[headers['Gift/Trade Card']])
						$purRC = (@workbook.row(row)[headers['PUR Rewards Credit']])
						$creditCardType = (@workbook.row(row)[headers['Credit Card Type']])
						@runTest = (@workbook.row(row)[headers['Run Test']]).upcase



						if (@runTest == 'Y' && @tcNumber == @tcid)
							puts "TC Number : #{@tcNumber}"
							return $userType,$skuNumber,$zipCode,$promoCode,$giftTradeCard,$purRC,$creditCardType

						end




				end


			end


		end

 end

