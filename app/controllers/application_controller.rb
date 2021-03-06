class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user
   before_action :authenticate_with_http_digest, only: [:new, :create]


   def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end


end
