module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def admin_crowds_index
    "/admin/crowds/"
  end

  def login_page
    '/session/new'
  end

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
