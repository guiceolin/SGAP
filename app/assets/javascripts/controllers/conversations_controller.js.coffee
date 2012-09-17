class Sgap.ConversationsController extends Batman.Controller
  routingKey: 'conversations'
  index: (params) ->
    do TimeoutManager.clearMessageTimeout
    do Sgap.Conversation.load
    @set 'conversations', Sgap.Conversation.get('all')
    @set 'scopes', []
    @set 'newConversation', new Sgap.Conversation
    @set 'scopeTypes', ["Turma", "Grupo", "Disciplina"]
    @set 'selectedScope', {id: '', type: ''}

  show: (params) ->
    @set 'newMessage', new Sgap.Message
    @set 'conversation', Sgap.Conversation.find parseInt(params.id, 10), (err) ->
      throw err if err
    TimeoutManager.setMessageTimeout =>
      @get('conversation').load (err) ->
        throw err if err

  create: (params) ->
    @newConversation.set 'scope', @get('scopes').find (item) =>
      @get('selectedScope').id == item.get('id').toString()
    @newConversation.save()
    @redirect Sgap.Conversation

  update: (params) ->

  destroy: (params) ->

  createMessage: (params) ->
    console.log @get('newMessage').toJSON()
    @get('newMessage').set("conversation", @get("conversation"))
    @get('newMessage').save()
    @get('conversation').get('messages').add(@get('newMessage'))
    @redirect @get('conversation')

  changeScope: () ->
    switch @get('selectedScope').type
      when 'Turma' then @set('scopes', Sgap.Crowd.get('all') )
      when 'Grupo' then @set('scopes', Sgap.Group.get('all') )
      when 'Disciplina' then @set('scopes', Sgap.Subject.get('all') )

