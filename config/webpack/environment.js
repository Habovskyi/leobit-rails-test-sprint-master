const path = require('path')
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

const additionalWebpackSettings = {
  resolve: {
    extensions: ['.js', '.scss', '.css'],
    alias: {
      '@js': path.resolve(__dirname, '..', '..', 'app/webpacker/javascripts'),
      '@css': path.resolve(__dirname, '..', '..', 'app/webpacker/stylesheets'),
      '@images': path.resolve(__dirname, '..', '..', 'app/webpacker/images'),
      '@fonts': path.resolve(__dirname, '..', '..', 'app/webpacker/fonts'),
      '@js-views': path.resolve(__dirname, '..', '..', 'app/webpacker/entrypoints'),
      '@css-views': path.resolve(__dirname, '..', '..', 'app/webpacker/stylesheets/views')
    }
  }
}
environment.config.merge(additionalWebpackSettings)
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

module.exports = environment
