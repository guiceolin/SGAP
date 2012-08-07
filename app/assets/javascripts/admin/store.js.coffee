Admin.Store = DS.Store.extend
  revision: 4,
  adapter: DS.RESTAdapter.create
    namespace: 'admin'

