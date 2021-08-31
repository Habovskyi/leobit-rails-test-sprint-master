# frozen_string_literal: true

# Use this setup block to configure all options available in SimpleForm.
# rubocop: disable Naming/VariableNumber, Naming/BlockParameterName
SimpleForm.setup do |config|
  config.generate_additional_classes_for = []

  # Default class for buttons
  config.button_class = 'button is-primary'

  # Define the default class of the input wrapper of the boolean input.
  config.boolean_label_class = 'checkbox'

  # How the label text should be generated altogether with the required text.
  config.label_text = ->(label, required, _explicit_label) { "#{label} #{required}" }

  # Define the way to render check boxes / radio buttons with labels.
  config.boolean_style = :inline

  # You can wrap each item in a collection of radio/check boxes with a tag
  config.item_wrapper_tag = :div

  # Defines if the default input wrapper class should be included in radio
  # collection wrappers.
  config.include_default_input_wrapper_class = false

  # CSS class to add for error notification helper.
  config.error_notification_class = 'notification is-danger'

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :to_sentence

  # add validation classes to `input_field`
  config.input_field_error_class = 'is-danger'
  config.input_field_valid_class = 'is-success'

  # vertical forms
  #
  # bulma extension for common inputs
  config.wrappers :default_section, tag: 'div', class: 'field' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'label'
    b.use :input, class:       'input',
                  wrap_with:   { tag: 'div', class: 'control' },
                  error_class: 'is-danger',
                  valid_class: 'is-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'help is-danger' }
    # b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  config.wrappers :textarea_section, tag: 'div', class: 'field' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'label'
    b.use :input, class:       'input textarea',
                  wrap_with:   { tag: 'div', class: 'control' },
                  error_class: 'is-danger',
                  valid_class: 'is-success'
    b.use :full_error, wrap_with: { tag: 'div', class: 'help is-danger' }
    # b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  # bulma extension for select
  config.wrappers :select_section, tag: 'div', class: 'field' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :pattern
    b.optional :readonly

    b.wrapper tag: 'div', class: 'control' do |ba|
      ba.use :label,      class: 'label'
      ba.use :input,      wrap_with: { tag: 'div', class: 'select' }
      ba.use :full_error, wrap_with: { tag: 'div', class: 'help is-danger' }
      # ba.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
    end
  end

  # bulma extension for boolean
  config.wrappers :boolean_section, tag: 'div', class: 'field' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: 'div', class: 'control' do |ba|
      ba.use :input, class: 'is-checkradio is-info mr-1'
      ba.use :label, class: 'label is-inline'
    end
  end

  ## bulma extension for file input
  config.wrappers :file_section, tag: 'div', class: 'file' do |b|
    b.use :html5
    b.optional :readonly
    b.use :input, class: 'file-input', wrap_with: { tag: 'label', class: 'file-label' }
    b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback d-block' }
    b.use :hint, wrap_with: { tag: 'small', class: 'form-text text-muted' }
  end

  ## bulma extension for multi select
  config.wrappers :multi_select_section, tag: 'div', class: 'field' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'label'
    b.wrapper tag: 'div', class: 'control' do |ba|
      ba.use :input, class: 'input', error_class: 'is-danger', valid_class: 'is-success'
    end
    b.use :full_error, wrap_with: { tag: 'div', class: 'is-danger' }
    b.use :hint, wrap_with: { tag: 'small', class: 'help' }
  end

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :default_section

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  config.wrapper_mappings = {
    boolean:       :boolean_section,
    check_boxes:   :vertical_collection,
    date:          :multi_select_section,
    datetime:      :multi_select_section,
    file:          :file_section,
    radio_buttons: :vertical_collection,
    range:         :vertical_range,
    time:          :multi_select_section,
    select:        :select_section,
    text:          :textarea_section
  }
end
# rubocop:enable Naming/VariableNumber, Naming/BlockParameterName
