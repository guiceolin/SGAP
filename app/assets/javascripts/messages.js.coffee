class Message
  constructor: (message) ->
    @body = message.body
    @user = message.user.username

class User
  constructor: (user) ->
    @name = user.name
    @email = user.email
    @username = user.username

class Conversation
  constructor: (@conversation) ->
    @id = @conversation.id
    @last_read = @conversation.last_read
    @messages = new Array
    @users = new Array
    @users.push(new User(user)) for user in @conversation.users
    $.ajax
      url: "/conversations/#{@id}?last_read=0"
      dataType: 'json'
      type: 'get'
      async: false
      complete: (xhr,status) =>
        @messages.push(new Message(message)) for message in JSON.parse(xhr.responseText).conversation.messages
  create:(params) ->
   $.ajax
      url: "/conversations/"
      dataType: 'json'
      type: 'POST'
      async: false
      data: params
      complete: (xhr,status) =>
  update: ->
    $.ajax
      url: "/conversations/#{@id}"
      dataType: 'json'
      type: 'get'
      async: false
      complete: (xhr,status) =>
        @messages.push(new Message(message)) for message in JSON.parse(xhr.responseText).conversation.messages
  sendMessage: (message) ->
    $.ajax
      url: "/conversations/#{@id}"
      dataType: 'json'
      type: 'PUT'
      async: false
      data: message
  lastMessage: ->
    @messages[@messages.length - 1]
  allUsers: ->
    users = ""
    users = users + ",#{user.email}" for user in @users
    users.slice(1)


class ConversationsView
  constructor: ->
    source = '/conversations'
    @conversations = new Array
    $.ajax
      url: source
      dataType: 'json'
      type: 'get'
      async: false
      complete: (xhr,status) =>
        conversations = JSON.parse(xhr.responseText)
        @conversations.push(new Conversation(conversation)) for conversation in conversations.conversations
    @show()
  show: ->
    for conversation in @conversations
      lastMessage = conversation.lastMessage()
      li = "<li><a href='/conversations/#{conversation.id}?last_read=0'><p class='msg-names'>#{conversation.allUsers()}</p><p class='msg-body'>#{lastMessage.body}</p></a></li>"
      $('#conversations').append(li)
  findConversation: (id) ->
    for conversation in @conversations
      if conversation.id == id
        return conversation

class MessagesView
  constructor: (id) ->
    source = '/conversations/' + id
    $.ajax
      url: source
      dataType: 'json'
      type: 'get'
      async: false
      complete: (xhr,status) =>
        @conversation = new Conversation(JSON.parse(xhr.responseText).conversation)
    @show()
    new NewMessageView(this)
    window.setInterval(@getNewMessages, 5000)
  show: ->
    $('ul#messages').html('')
    for message in @conversation.messages
      $('ul#messages').append("<li><p>#{message.user}:#{message.body}</li>")
  getNewMessages: =>
    @conversation.update()
    @show()

class NewMessageView
  constructor: (@conversationView) ->
    @form = $('div#new-message')
    $('a#send', @form).on 'click', =>
      @conversationView.conversation.sendMessage({message: new Message({body: $('input#body').val(), user: { } })})
      @conversationView.getNewMessages()

class NewConversationsView
  constructor: ->
    @button = $('a#new-conversation')
    @users =  new Array
    @button.on 'click', =>
      @createConversation()
  addUser: (id)->
    @users.push(id)

class UserSelectView
  constructor: (parentView) ->
    @placeholder = $('input#users-select')
    @placeholder.autocomplete
      source: '/users/'
      minLength: 2
      select: @select
  show: (elem) ->
    $('ul#users').append("<li>#{elem.username}</li>")
  select: (event,ui) =>
    console.log ui.item


window.UserSelectView = UserSelectView
window.ConversationsView = ConversationsView
window.MessagesView = MessagesView
window.NewMessageView = NewMessageView
