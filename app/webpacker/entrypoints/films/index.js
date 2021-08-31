import '@css-views/films/index'

// not required, just for demonstration
console.log('films#index')

class FilmsIndex {
  constructor () {
    this.$filmsContainer = $('[data-js-films]')
  }

  init () {
    this.registerButtonEvents()
  }

  registerButtonEvents () {
    this.$filmsContainer.on('click', '[data-js-film-delete]', this.onDelete.bind(this))
  }

  onDelete (event) {
    $.ajax({
      url: event.target.getAttribute('data-url'),
      method: 'DELETE',
      dataType: 'JSON',
      headers: { 'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').content },
      success: (response) => {
        App.flash.show(response.data.message)
        $(event.target).closest('article').remove()
      }
    })
  }
}

document.addEventListener('turbolinks:load', () => {
  new FilmsIndex().init()
})
