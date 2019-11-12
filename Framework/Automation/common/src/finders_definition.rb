

class FindersDef
  attr_accessor :driver

  def initialize(driver)
    @driver = driver
  end

  def find_element(predicate, predicate_value, object_name)
    elem_exists = @driver.exists { @driver.wait(20) { @driver.find_element(predicate, predicate_value) } }
    if elem_exists
      return @driver.find_element(predicate, predicate_value)
    else
      raise StandardError.new("Unable to find element #{object_name} using #{predicate}:#{predicate_value}")
    end
  end

  def find_elements(predicate, predicate_value, object_name, wait_time=20)
    elem_exists = @driver.exists { @driver.wait(wait_time) { @driver.find_element(predicate, predicate_value) } }
    if elem_exists
      return @driver.find_elements(predicate, predicate_value)
    else
      return nil
    end
  end

end