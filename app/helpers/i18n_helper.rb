# frozen_string_literal: true

module I18nHelper
  def humanize_enum(model, enum_field, value)
    return if value.blank?

    I18n.t(
      "enums.#{model.name.underscore}.#{enum_field.to_s.pluralize}.#{value}",
      default: value.to_s.humanize
    )
  end

  def enum_collection_for_select(model, enum_field, **params)
    model
      .send(enum_field.to_s.pluralize)
      .keys
      .map { |value| [humanize_enum(model, enum_field, value), value] }
      .prepend(build_enum_placeholder(model, enum_field, **params))
      .compact
  end

  private

  def build_enum_placeholder(model, enum_field_name, **params)
    return unless params[:placeholder]

    Array[humanize_enum(model, enum_field_name, :placeholder), nil, disabled: params[:disabled]]
  end
end
