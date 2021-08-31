import Noty from 'noty'

const TYPES = { alert: 'error', notice: 'success', info: 'info', warning: 'warning' }

export default class Flash {
  static start() {
    $(document).ready(() => new Flash().init())
  }

  static TYPES() {
    return TYPES
  }

  static show(message, key = 'notice') {
    new Noty({ type: Flash.TYPES()[key], text: message }).show()
  }

  static clear() {
    Noty.closeAll()
  }

  constructor(container_selector = '#flash-container') {
    this.$container = $(container_selector)
    this.messages  = this.$container.data('flash')

    this.clearData()
    this.setDefaultOptions()
  }

  clearData () {
    this.$container.attr('data-flash', null)
  }

  setDefaultOptions () {
    Noty.overrideDefaults({
      layout: 'bottomRight',
      theme: 'sunset',
      timeout: 2000
    })
  }

  init () {
    if (!Object.keys(this.messages).length) return

    for (let key in this.messages) {
      let value = this.messages[key]

      if (Flash.TYPES().hasOwnProperty(key)) {
        if (Array.isArray(value)) {
          value.forEach(message => Flash.show(message, key))
        } else {
          Flash.show(value, key)
        }
      }
    }
  }
}
