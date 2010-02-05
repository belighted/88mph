class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :print_crap
  
  def print_crap
    puts "======= crap"
  end
end
