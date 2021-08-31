# frozen_string_literal: true

require 'pagy/extras/array'
require 'pagy/extras/bulma'

inner_window = 4
outer_window = 1

Pagy::VARS[:items] = 10
Pagy::VARS[:size]  = [outer_window, inner_window, inner_window, outer_window]
