require 'rails_helper'

RSpec.describe "application", type: :system do
  it 'should redirect to to new_user_path' do
    visit root_path

    click_link 'Sign Up'
    expect(page).to have_current_path new_user_path
  end

  it 'should create new user and login' do
    visit root_path

    click_link 'Sign Up'

    fill_in 'Name', with: 'test_user_name'
    fill_in 'Password', with: 'test_user_password'
    fill_in 'Password confirmation', with: 'test_user_password'

    click_button 'Create User'

    expect(page).to have_current_path root_path

    fill_in 'Name', with: 'test_user_name'
    fill_in 'Password', with: 'test_user_password'

    click_button 'Login'
    expect(page).to have_current_path input_path

    fill_in "start", with: 1
    fill_in "end", with:10

    click_button "Посчитать"

    expect(page).to have_current_path input_path
    expect(page).to have_css 'table'
    expect(all("td").map { |val| val.text }).to eq([1, 2, 3, 3, 6,
                                                    2, 3, 4, 4, 24,
                                                    4, 5, 6, 5, 120,
                                                    8, 9, 10, 6, 720].map(&:to_s))
  end

  it 'should redirect to login' do
    visit input_path
    expect(page).to have_current_path root_path
  end
end