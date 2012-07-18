require File.dirname(__FILE__) + '../acceptance_helper'
feature 'admin crowds' do
  scenario 'without login' do
    visit "/admin/crowds/"
    expect(current_path).to eq('/session/new')
    find_field('Email')
    find_field('Password')
    find_button('Entrar')
  end
  scenario 'logged as admin' do
    login_with_admin
    visit admin_crowds_index
    expect(current_path).to eq(admin_crowds_index)
  end
end
