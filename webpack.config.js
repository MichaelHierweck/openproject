var webpack = require('webpack'),
  path = require('path');

module.exports = {
  context: __dirname + '/app/assets/javascripts/angular',

  entry: './openproject-app.js',

  output: {
    filename: 'openproject-app.bundle.js',
    path: path.join(__dirname, 'app', 'assets', 'javascripts')
  },

  module: {
    loaders: [
      { test: /[\/]angular\.js$/, loader: "exports?angular" }
    ]
  },

  resolve: {
    //root: [path.join(__dirname, 'vendor', 'assets', 'components')]
    modulesDirectories: [
      path.join(__dirname, 'node_modules'),
      path.join(__dirname, 'vendor', 'assets', 'components')
    ],

    alias: {
      'angular-ui-date': 'angular-ui-date/src/date',
      'angular-truncate': 'angular-truncate/src/truncate',
      'angular-feature-flags': 'angular-feature-flags/dist/featureFlags.js',
      'angular-busy': 'angular-busy/dist/angular-busy.js',
      'angular-context-menu': 'angular-context-menu/dist/angular-context-menu.js',
      'hyperagent': 'hyperagent/dist/hyperagent',
      'openproject-ui_components': 'openproject-ui_components/app/assets/javascripts/angular/ui-components-app'
    }
  },

  externals: { jquery: "jQuery" },

  plugins: [
    new webpack.ProvidePlugin({
      '_':            'lodash',
      'URI':          'URIjs',
      'URITemplate':  'URIjs/src/URITemplate'
    }),
    new webpack.ResolverPlugin([
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin(
        'bower.json', ['main'])
    ]) // ["normal", "loader"]
  ]
};
