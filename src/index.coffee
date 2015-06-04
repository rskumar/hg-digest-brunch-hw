replace = require 'replace'
exec = require('child_process').exec

module.exports = class Digest

  brunchPlugin: true

  constructor: (@config) ->

    # Defaults options
    @options = {
      # A RegExp where the first subgroup matches the filename to be replaced
      pattern: /__DIGEST__/g
      # Run in specific environments
      environments: ['production']
    }

    # Merge config
    cfg = @config.plugins?.digest ? {}
    @options[k] = cfg[k] for k of cfg

  onCompile: ->
    return unless @config.env[0] in @options.environments
    @execute 'hg identify -i', @replace

  execute: (command, callback) ->
    exec command, (error, stdout, stderr) -> callback stdout

  replace: (digest) =>
    replace
      regex: @options.pattern
      replacement: digest.replace(/\W+/g,'')
      paths: [@config.paths.public]
      recursive: true
      silent: true
