class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  around_action :switch_locale

  def switch_locale(&action)
    locale = cookies[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
