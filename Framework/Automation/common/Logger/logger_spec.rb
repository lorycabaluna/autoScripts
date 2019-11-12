class TestLogger
  attr_accessor :log_summary_report_file, :summary_report, :log_trace_path, :summary_log
  def initialize
    create_tracer
    create_parent_dir
    create_summary_dir
    create_summary_rprt
    create_summary_file_log
    # sync_on_summary_log
  end

  def create_logger_for_example(example)
    @example = example
    create_log_trace_dir
    create_reporter
    start_message
  end

  def trace(msg)
    @log_tracer.info(msg)
    @log_reporter.info(msg)
  end

  def report(msg)
    @log_reporter.info("\n#{msg}")
  end

  def create_tracer
    @log_tracer = Logger.new(STDOUT)
    @log_tracer.level='info'
    @log_tracer.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime("%Y/%m/%d %I:%M:%S")} -- #{msg}\n"
    end
  end

  def create_log_directories(is_first_ex)
    create_parent_dir if is_first_ex == 0
    create_log_trace_dir
    create_summary_dir if is_first_ex == 0
  end

  def create_parent_dir
    begin
      @log_parent_path = "C:/Users/Public/android_output/log_reports/automation_results_#{Time.now.strftime('%d_%m_%Y_%H_%M')}"
      # @log_parent_path = "//gv2k3ris01.babgsetc.pvt/Shared/QA Automation/android_output/log_reports/automation_results_#{Time.now.strftime('%d_%m_%Y_%H_%M')}"
      FileUtils.rm_rf(@log_parent_path) if File.exists?(@log_parent_path)
      FileUtils.mkpath(@log_parent_path)
    rescue Exception => e
      trace("Error: Unable to create output directory, #{@log_parent_path}: #{e.message }")
      exit 1
    end
  end

  def create_log_trace_dir
    begin
      @log_trace_path = "#{@log_parent_path}/#{@example.example_group.description}/#{@example.description.parameterize}"
      FileUtils.rm_rf(@log_trace_path) if File.exists?(@log_trace_path)
      FileUtils.mkpath(@log_trace_path)
    rescue Exception => e
      $log.trace("Error: Unable to create output directory, #{@log_trace_path}: #{e.message }")
      exit 1
    end
  end

  def create_summary_dir
    begin
      @log_summary_path = "#{@log_parent_path}/results_summary"
      FileUtils.rm_rf(@log_summary_path) if File.exists?(@log_summary_path)
      FileUtils.mkpath(@log_summary_path)
    rescue Exception => e
      trace("Error: Unable to create output directory, #{@log_summary_path}: #{e.message }")
      exit 1
    end
  end

  def create_report_files(is_first_ex)
    create_reporter
    create_summary_rprt if is_first_ex == 0
  end

  def create_reporter
    begin
      # file = File.open("/#{@example.de/scription.parameterize}.log", File::WRONLY | File::APPEND | File::CREAT)
      file = File.open("#{@log_trace_path}/#{@example.description.parameterize}.trace", "w")
      @log_reporter = Logger.new(file)
      @log_reporter.level = 'info'
      @log_reporter.formatter = proc do |severity, datetime, progname, msg|
        "#{datetime.strftime("%Y/%m/%d %I:%M:%S")} -- #{msg}\n"
      end
    rescue Exception => e
      trace("\n\nError: Unable to create trace log file, #{file}: #{e.message }")
    end
  end

  def create_summary_rprt
    begin
      @log_summary_report_file = "#{@log_summary_path}/test_results_summary.csv"
      file = File.open(@log_summary_report_file, "w")
      @summary_report = DataFunctions.new(@log_summary_report_file)
    rescue Exception => e
      $log.trace("\n\nError: Unable to create trace log file, #{file}: #{e.message }")
    end
  end

  def create_summary_file_log
    @log_summary_output_file = "#{@log_summary_path}/test_results_summary_log.trace"
    file = File.open(@log_summary_output_file, "w")
    @summary_log = DataFunctions.new(@log_summary_output_file)
  rescue Exception => e
    $log.trace("\n\nError: Unable to create trace log file, #{file}: #{e.message }")
  end

  def add_data_on_summary(data_values, is_headers=nil)
    @summary_report.add_data_on_csv(data_values, is_headers)
  end

  def add_data_on_summary_log(values)
    @summary_log.add_data_on_txt(values)
  end

  def start_message
    trace("Starting scenario: #{@example.example_group.description} #{@example.description}")
  end

  def sync_on_summary_log
    $stdout.reopen(@log_summary_output_file, "w")
    $stdout.sync = true
    $stderr.reopen($stdout)
  end

  # def get_screenshot
  #   trace("screenshot")
  #   final_description = "#{@example.description.parameterize}"
  #   # file_path = @log_trace_path
  #   # FileUtils.mkdir_p file_path unless File.exists?(file_path)
  #   Appium::Driver.screenshot("#{@log_trace_path}/#{final_description}.png")
  # end
end