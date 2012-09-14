class Sgap.ConversationsController extends Batman.Controller
  routingKey: 'conversations'
  index: (params) ->
    do TimeoutManager.clearMessageTimeout
    do Sgap.Conversation.load
    @set 'conversations', Sgap.Conversation.get('all')

  show: (params) ->
    @set 'newMessage', new Sgap.Message
    @set 'conversation', Sgap.Conversation.find parseInt(params.id, 10), (err) ->
      throw err if err
    TimeoutManager.setMessageTimeout =>
      @get('conversation').get('messages').load (err) ->
        throw err if err
  create: (params) ->

  update: (params) ->

  destroy: (params) ->

