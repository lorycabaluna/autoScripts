# class EndFormatter
#   RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed
#
#   def initialize(out)
#     @output = out
#   end
#
#   def example_finished(notification)
#     example = notification.example
#     result = example.execution_result
#     stat = result.status
#     # $log.trace("RESULT: #{result.status.upcase}")
#   end
#
#   alias example_passed example_finished
#   alias example_pending example_finished
#   alias example_failed example_finished
# end

class StartFormatter < RSpec::Core::Formatters::BaseFormatter

  def initialize(output)
    $log = TestLogger.new
    $search_data=DataFunctions.new("#{ENV['android_scripts']}/documents/products_search_data/products_search_data.csv")
    super
    @output.puts
    @output.puts "Using Android Custom Formatter."
    @output.puts
    @start_time = Time.now
    @all_examples = Array.new
    @ex_passed = Array.new
    @ex_start_times = Array.new
    @ex_end_times = Array.new

  end

  def example_started(example)
    $log.create_logger_for_example(example)
    @ex_start_times << Time.now
    @file_path = 'C:/dev/gs.automation.androidapp/Scripts'
  end

  def example_passed(example)
    $log.trace("Result: PASS\n\n")

    @ex_passed << example
    @all_examples << example
    @ex_end_times << Time.now
    @end_time = Time.now
  end

  def example_failed(example)
    $log.trace("Result: FAIL")
    if example.execution_result.exception == nil
      ex_failed_message = "no exception message"
    else
      ex_failed_message = example.execution_result.exception.message
      unless example.execution_result.exception.backtrace == nil
        # ex_failed_backtrace = example.execution_result.exception.backtrace.join("\n\t")
        ex_failed_backtrace = example.execution_result.exception.backtrace.select { |r| r.match(@file_path) }.join("\n\t")
      else
        ex_failed_backtrace = "no exception backtrace"
      end
    end

    $log.trace("#{ex_failed_message} \n\t#{ex_failed_backtrace}\n\n")
    @ex_end_time = Time.now
    @all_examples << example
    @ex_end_times << Time.now
    @end_time = Time.now
  end

  def example_pending(example)
    @all_examples << example
    @ex_end_times << Time.now
    @end_time = Time.now
    $log.trace("Result: PENDING")
    $log.trace("#{example.execution_result.exception.message} \n\t#{example.execution_result.exception.backtrace.join("\n\t")}\n\n")
  end

  # def dump_failure(example)
  #   $log.trace(example.description)
  # end

  # def failed_example_output example
  #   full_description = example.full_description
  #   location = example.location
  #   formatted_message = strip_message_from_whitespace(example.execution_result.exception.message)
  #
  #   "#{full_description} - #{location} \n  #{formatted_message}"
  # end

  def dump_summary(duration, example_count, failure_count, pending_count)
    @duration = duration
    @example_count = example_count
    @passing_count = @ex_passed.count
    @failure_count = failure_count
    @pending_count = pending_count
    @passing_percentage = (@passing_count.to_f/@example_count.to_f)*100
    @pending_percentage = (@pending_count.to_f/@example_count.to_f)*100
    @failure_percentage = (@failure_count.to_f/@example_count.to_f)*100

    @output << summary_report
  end

  def summary_report
    newl = "\n"
    column_lines = ("-" * 100)
    summary_label="Summary:\n"
    if @start_time != nil
      start_time="Run Started: #{@start_time.strftime("%Y/%m/%d %I:%M:%S")}\n"
    else
      start_time="Run Started: #{DateTime.now.to_date} 00:00:00\n"
    end
    if @end_time != nil
      end_time="Run Finished: #{@end_time.strftime("%Y/%m/%d %I:%M:%S")}\n"
    else
      end_time="Run Finished: #{DateTime.now.to_date} 00:00:00\n"
    end

    log_column_format = "%-10s%-10s%-10s%-15s%-35s%s"
    actual_log_headers = ["Status", "Start", "End", "Duration", "Suite", "Title"]
    actual_report_headers = ["Status", "TCID", "End", "Suite", "Title", "Error"]
    column_headers = (log_column_format % actual_log_headers)
    $log.add_data_on_summary(actual_report_headers)
    status_values = "\n"
    @all_examples.each_with_index do |ex, index|
      ex_stat = ex.execution_result.status.upcase
      ex_s_time = @ex_start_times.at(index).strftime("%I:%M:%S")
      ex_e_time = @ex_end_times.at(index).strftime("%I:%M:%S")
      ex_duration = @ex_end_times.at(index) - @ex_start_times.at(index)
      ex_group = ex.example_group.description
      ex_desc = ex.description
      ex_tc, ex_desc_to_report = get_tc_from_example(ex)
      (ex.execution_result.exception != nil) ? ex_error = ex.execution_result.exception.message : ex_error = ""

      ex_log_data = [ex_stat, ex_s_time, ex_e_time, time_format(ex_duration), ex_group, ex_desc]
      ex_report_data = [ex_stat, ex_tc, ex_e_time, ex_group, ex_desc_to_report, ex_error]
      status_values = status_values + (log_column_format % ex_log_data) + newl
      $log.add_data_on_summary(ex_report_data)
    end
    run_duration = "Finished in #{RSpec::Core::Formatters::Helpers.format_duration(@duration)}.\n"
    run_percentage= "Passed: #{@passing_count} (#{@passing_percentage}%) Pending: #{@pending_count} (#{@pending_percentage}%) Failed: #{@failure_count} (#{@failure_percentage}%) Total Run: #{@example_count}\n\n"
    whole_summary_report= summary_label + start_time + column_headers + newl + column_lines + status_values + column_lines + newl + end_time + newl + run_duration + newl + run_percentage
    $log.add_data_on_summary_log(whole_summary_report)
    return whole_summary_report
  end

  # def record_output(output)
  #   File.open($log.log_summary_output_file, 'w') { |file| file.write(output) }
  # end

  def get_tc_from_example(ex)

    first_word = ex.description.split(' ').first
    ex_to_report = ex.description.gsub(first_word, '').squish
    if first_word.delete("^0-9") == ''
      first_word = 'no_id'
      ex_to_report = ex.description
    end

    return first_word.delete("^0-9"), ex_to_report
  end

  def time_format(duration)
    precision = case
                  when duration < 1 then
                    SUB_SECOND_PRECISION
                  when duration < 120 then
                    DEFAULT_PRECISION
                  when duration < 300 then
                    1
                  else
                    0
                end

    if duration > 60
      minutes = (duration.round / 60).to_i
      seconds = (duration - minutes * 60)

      "#{minutes} m #{format_seconds(seconds, precision)} s"
    else
      format_seconds(duration, precision) + " s"
    end
  end

  def format_seconds(float, precision)
    return '0' if float < 0
    precision ||= (float < 1) ? 5 : 2
    formatted = "%.#{precision}f" % float
    formatted.sub(/(?:(\..*[^0])0+|\.0+)$/, '\1')
  end

end