class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = t("flash.notice")
    super
  end

  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = t("flash.notice")
    super
  end
end
