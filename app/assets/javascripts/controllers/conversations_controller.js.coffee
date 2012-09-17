class Sgap.ConversationsController extends Batman.Controller
  routingKey: 'conversations'
  index: (params) ->
    do TimeoutManager.clearMessageTimeout
    do Sgap.Conversation.load
    @set 'conversations', Sgap.Conversation.get('all')
    @set 'scopes', Sgap.Crowd.get('all')
    @set 'newConversation', new Sgap.Conversation
    @set 'scopeTypes', ["Crowd"]
    @set 'selectedScope', {id: '', type: ''}

  show: (params) ->
    @set 'newMessage', new Sgap.Message
    @set 'conversation', Sgap.Conversation.find parseInt(params.id, 10), (err) ->
      throw err if err
    TimeoutManager.setMessageTimeout =>
      @get('conversation').get('messages').load (err) ->
        throw err if err

  create: (params) ->
    @newConversation.set 'scope', @get('scopes').find (item) =>
      @get('selectedScope').id == item.get('id').toString()
    @newConversation.save()
    @redirect Sgap.Conversation

  update: (params) ->

  destroy: (params) ->

