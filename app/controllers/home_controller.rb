class HomeController < ApplicationController

  def index
  end

  def lo_example
    begin
      @lo = Lo.find('65170326b1063e851800001a')
    rescue
      @lo = Lo.first
    end
  end
end
