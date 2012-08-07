Admin.Router = Ember.Router.extend
  location: 'hash',

  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'
      listCrowds: Ember.State.transitionTo('crowds'),
    crowds: Ember.Route.extend
      route: '/crowds'

      # You'll likely want to connect a view here.
      # connectOutlets: function(router) {
      #   router.get('applicationController').connectOutlet(App.MainView);
      # }

      # Layout your routes here...

