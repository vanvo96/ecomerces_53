class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :check_quantity_rest

  def check_quantity_rest item
    if (item.quantity - session[:cart][item.id.to_s]) > 5 && session[:cart][item.id.to_s] != 0
      return 1
    elsif session[:cart][item.id.to_s] == 0
      return 2
    else
      return 3
    end
  end
end
