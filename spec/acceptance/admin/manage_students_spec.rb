require 'acceptance/acceptance_helper'

feature 'Admin students', %q{
  In order to manage students
  As a Admin
  I want to create and manage students
} do

  context 'Unless I am not logged in' do
    scenario 'I Should be redirected to start page' do
      visit '/admin/students/'
      expect(current_path).to eq(login_page)
    end
  end

  context 'When I am logged in' do
    before(:all) do
      login_as_admin
      visit '/admin/students/'
    end
    scenario 'I should see a button to create a new student' do
      find_link 'Novo Estudante'
    end
    scenario 'I Should see a table' do
      expect(page).to have_css('table')
    end
  end

end
