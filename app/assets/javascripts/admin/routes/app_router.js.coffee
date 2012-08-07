Admin.Router = Ember.Router.create
  location: 'hash',

  root: Ember.Route.extend
    listCrowds: (router, event) => router.transitionTo('crowds.index')
    index: Ember.Route.extend
      route: '/'
      connectOutlets: (router, context) ->
        router.get('applicationController').connectOutlet('dashboard')
    crowds: Ember.Route.extend
      route: '/crowds'
      index: Ember.Route.extend
        route: '/'
        connectOutlets: (router, context) ->
          router.get('applicationController').connectOutlet('crowds')

      # You'll likely want to connect a view here.
      # connectOutlets: function(router) {
      #   router.get('applicationController').connectOutlet(App.MainView);
      # }

      # Layout your routes here...

