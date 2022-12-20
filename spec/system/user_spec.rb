require 'rails_helper'

RSpec.describe "user authorization", type: :system do
  it 'successfully creates user' do
    visit root_path
    expect(page).to have_current_path new_user_path
  end
end