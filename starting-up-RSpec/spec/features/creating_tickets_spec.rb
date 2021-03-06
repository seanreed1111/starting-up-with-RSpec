require 'rails_helper'

RSpec.feature "Users can create new tickets" do
  before do
    project = FactoryGirl.create(:project, name: "Internet Explorer", description: "InternetExplorerDescription")

    visit project_path(project)
    click_link "New Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Ticket"

    expect(page).to have_content "Ticket has not been created."
  end
end