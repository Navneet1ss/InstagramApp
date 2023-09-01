class ApplicationController < ActionController::Base
    helper_method :current_user
    add_flash_types :info, :error, :success

end
