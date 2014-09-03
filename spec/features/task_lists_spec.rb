require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  before(:each) do
    user = create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")
    login(user)
  end

  scenario 'User can view task lists' do
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

  scenario "User can see incompleted tasks" do
    click_on "+ Add Task", match: :first
    fill_in "Description", with: "This is it"
    click_on "Create Task"
    expect(page).not_to have_css(".completed")
  end


end