=begin NOTES here

=end
module DriverModules
  include BrowseFinder
  include Dashboard
  include CheckOut
  include Footer
  include HOPS
  include Menu
  include Header
  include LogOn
  include PDP
  include Stores
  include Trade
  include Home
  include PUR

  # def self.included(base)
  #   base.include(BrowseFinder)
  # end
  # def DriverModules.included(mod)
  #   puts "#{self} included in #{mod}"
  # end
end