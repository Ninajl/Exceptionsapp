class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  class AccessDenied < StandardError; end
  class Calm < StandardError; end

  rescue_from AccessDenied, with: :over_capacity
  rescue_from Calm, with: :unauthenticate


  private

  def over_capacity
    render file: "/public/404", status: 404
  end

  def unauthenticate
    render file: "/public/500", status: 500
  end
end
