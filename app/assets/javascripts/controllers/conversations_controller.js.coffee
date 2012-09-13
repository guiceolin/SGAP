class Sgap.ConversationsController extends Batman.Controller
  routingKey: 'conversations'
  index: (params) ->
    do TimeoutManager.clearMessageTimeout
    do Sgap.Conversation.load
    @set 'conversations', Sgap.Conversation.get('all')

  show: (params) ->
    @set 'conversation', Sgap.Conversation.find parseInt(params.id, 10), (err) ->
      throw err if err
    TimeoutManager.setMessageTimeout =>
      @get('conversation').load()

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

