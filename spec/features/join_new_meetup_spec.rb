require 'spec_helper'

feature "Join a new meetup" do
  scenario "be in the list" do
    user = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup)
    membership = FactoryGirl.create(:membership)

    visit '/'
    sign_in_as user
    click_link(meetup.name)

    click_button('Join')

    expect(page).to have_content (user.username)
  end
end
