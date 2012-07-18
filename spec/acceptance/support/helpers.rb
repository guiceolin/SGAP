module HelperMethods
  # Put helper methods you need to be available in all acceptance specs here.

  def login_with_admin(admin=nil)
    admin ||= Fabricate(:professor)
    visit login_page
    fill_in 'email', with: admin.email
    fill_in 'password', with: '123456'
    click_button 'Entrar'
    expect(current_path).to eq(homepage)

  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
