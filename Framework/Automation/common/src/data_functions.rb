class DataFunctions
  attr_reader :data_file, :csv_data, :params, :previous_sku

  def initialize(data_file=nil)
    (data_file == nil) ?
        # @data_file = 'C:\dev\GS.Automation.AndroidApp\Scripts\spec\CheckOut\co_dataset.csv' :
        @data_file = "#{ENV['android_scripts']}/spec/CheckOut/co_dataset.csv" :
        @data_file = data_file
    @csv_data = File.read(@data_file)
  end

  def get_all_data_from_row(row_indentifier)
    print("\r\nData file: #{@data_file.to_str}\r\n")
    csv_data = CSV.read(@data_file)
    @params = Hash.new
    headers = csv_data.at(0)
    csv_data.each_with_index { |values, index|
          values.each_with_index { |v, v_i|
            headers.each_with_index { |h, h_i|
              @params[h] = v if h_i == v_i
            }
      } if values.at(0) == row_indentifier

      #****** debugging
      # csv_data.each_with_index{|k,v| puts "The csv_data Key: #{k} and the Values: #{v}"}
      # values.each_with_index{|k,v| puts "The values Key: #{k} and the Values: #{v}"}
      #     headers.each_with_index{|k,v| puts "The headers Key: #{k} and the Values: #{v}"}
      #     values.at(0).inspect
    }
    raise Exception.new("No data found for #{row_indentifier}") if @params == nil
    @params
  end

  def add_data_on_csv(data_values, is_headers=false)
    arr_of_arrs = CSV.read(@data_file)
    if arr_of_arrs.count > 0
      CSV.open(@data_file,"wb") do |csv|
        arr_of_arrs.each_with_index { |values,index | csv << values }
        csv << data_values
      end
    else
      CSV.open(@data_file,"wb") do |csv|
        csv << data_values
      end
    end
  end

  def add_data_on_txt(data_values)
      File.open(@data_file,"wb") do |f|
        f << data_values
      end
  end

  def get_all_skus_from_csv(query)
    # $log.trace(query)
    print("\r\nQuery: #{query} to data file: #{@data_file}\r\n")

    query_names = query.keys
    # $log.trace(query_names)
    csv_data = CSV.read(@data_file)
    headers = csv_data.at(0)
    # $log.trace(headers)
    indeces = []
    skus = []
    headers.each_with_index { |h, h_i|
      query_names.each_with_index { |q, q_i |
        indeces << h_i if q == h
      }
    }
    # $log.trace(indeces)

    csv_data.each_with_index { |values, index|
      get_sku = 'true'
      # $log.trace(values)
      indeces.each_with_index{|i, i_i|
        if (values[i] == query[headers[i]]) then
          (get_sku == 'true') ? get_sku = 'true' : get_sku = false
        else
          get_sku = 'false'
        end
      }
      skus << values[0] if get_sku == 'true'
    }
    skus
  end

  def get_random_product_from_csv(query,previous_sku=nil)
    skus = get_all_skus_from_csv(query)
    print("\r\nSKUS: #{skus.inspect}\r\n")
    sku_retrieved = skus.sample
    if previous_sku!=nil and previous_sku == sku_retrieved
      for i in 1..5
        sku_retrieved = skus.sample
        break if previous_sku != sku_retrieved
      end
    end
    get_all_data_from_row(sku_retrieved)
  end
end