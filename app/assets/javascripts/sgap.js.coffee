window.TimeoutManager = class TimeoutManager
  @setMessageTimeout: (callback, time = 5000) ->
    do @clearMessageTimeout
    @messageTimeout = window.setInterval(callback,time)

  @clearMessageTimeout: ->
    window.clearInterval @messageTimeout

window.Sgap = class Sgap extends Batman.App

  @root 'conversations#index'
  @resources 'conversations'
  Batman.ViewStore.prefix = 'assets/views'
  # @route '/controller/:id', 'controller#show', resource: 'model', action: 'show'

  @on 'run', ->
    console?.log "Running ...."

  @on 'ready', ->
    console?.log "Sgap ready for use."

  @flash: Batman()
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message
