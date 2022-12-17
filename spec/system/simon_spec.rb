require 'rails_helper'

RSpec.describe "user_input", type: :system do
  it "should return valid answer" do
    visit root_path
    fill_in "start", with: 1
    fill_in "end", with:10

    click_button "Посчитать"

    expect(page).to have_current_path root_path
    expect(page).to have_css 'table'
    expect(all("td").map { |val| val.text }).to eq([1, 2, 3, 3, 6,
                                                    2, 3, 4, 4, 24,
                                                    4, 5, 6, 5, 120,
                                                    8, 9, 10, 6, 720].map(&:to_s))
  end

  it "should show error on negative start" do
    visit root_path
    fill_in "start", with: -1
    fill_in "end", with:10

    click_button "Посчитать"

    expect(page).to have_content "Начало интервала должно быть целым неотрицательным числом"
  end

  it "should show error on negative end" do
    visit root_path
    fill_in "start", with: 1
    fill_in "end", with:-10

    click_button "Посчитать"

    expect(page).to have_content "Конец интервала должен быть целым неотрицательным числом"
  end
end
