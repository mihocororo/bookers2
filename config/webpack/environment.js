const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('weckpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery' ,
    Popper: 'popper.js'
  })
  )