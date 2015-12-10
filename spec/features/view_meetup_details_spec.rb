require "spec_helper"
require "launchy"
require 'capybara'
require 'pry'

feature "Meet Up Details" do
  scenario "view all details" do
    user = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup)
    membership = FactoryGirl.create(:membership)
    # memberships = FactoryGirl.create_list(:membership, 4, meetup: meetup)

    visit "/"
    sign_in_as user
    click_link(meetup.name)

    expect(page).to have_content(meetup.name)
    expect(page).to have_content(meetup.description)
    expect(page).to have_content(meetup.location)
    expect(page).to have_content(meetup.creator)
    expect(page).to have_content(user.username)
  end
end
