// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import '@fortawesome/fontawesome-free/css/all'
import '@css/application'

require.context('@images', true)

import RailsUJS from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'

import Flash from '@js/flash'

const App = App || {};

RailsUJS.start()
Turbolinks.start()
ActiveStorage.start()
Flash.start()

App.flash = Flash;

window.App = App;
