# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def app_name
    t('app_name')
  end

  def page_title
    return controller_title unless I18n.exists?(action_page_title_key)

    t('page_title', app_name: app_name, title: t(action_page_title_key))
  end

  protected

  def current_action
    return :new  if action_name == 'create'
    return :edit if action_name == 'update'

    params[:action]
  end

  private

  def action_page_title_key
    "#{controller_locale_path}.#{current_action}.title"
  end

  def controller_locale_path
    params[:controller].tr('/', '.')
  end

  def controller_title
    t(
      'page_title',
      app_name: app_name,
      title:    t("#{controller_locale_path}.title", default: t('default_page_title'))
    )
  end
end
