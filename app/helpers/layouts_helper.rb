# frozen_string_literal: true

module LayoutsHelper
  def controller_javascript_pack_tag(**options)
    javascript_pack_tag(params[:controller].to_s, **options)
  rescue Webpacker::Manifest::MissingEntryError
    Rails.logger.debug { "No javascript pack for `#{params[:controller]}.js`" }

    nil
  end

  def controller_stylesheet_pack_tag(**options)
    stylesheet_pack_tag(params[:controller].to_s, **options)
  rescue Webpacker::Manifest::MissingEntryError
    Rails.logger.debug { "No stylesheet pack for `#{params[:controller]}.css`" }

    nil
  end

  def action_javascript_pack_tag(**options)
    javascript_pack_tag("#{params[:controller]}/#{current_action}", **options)
  rescue Webpacker::Manifest::MissingEntryError
    Rails.logger.debug { "No javascript pack for `#{params[:controller]}/#{current_action}.js`" }

    nil
  end

  def action_stylesheet_pack_tag(**options)
    stylesheet_pack_tag("#{params[:controller]}/#{current_action}", **options)
  rescue Webpacker::Manifest::MissingEntryError
    Rails.logger.debug { "No stylesheet pack for `#{params[:controller]}/#{current_action}.css`" }

    nil
  end

  def sidebar_link(label_or_path, path_or_controller, controller = nil, &block)
    klass = (controller || path_or_controller).to_s == params[:controller] ? 'is-active' : ''

    return link_to(label_or_path, path_or_controller, class: klass) if block.blank?

    link_to(label_or_path, class: klass, &block)
  end
end
