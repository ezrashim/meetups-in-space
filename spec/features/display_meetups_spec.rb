require 'spec_helper'


feature "Site displays meetups" do
  scenario "views meetups" do
    user = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup)
    membership = FactoryGirl.create(:membership)

    visit '/'
    sign_in_as user

    expect(page).to have_content meetup.name
  end
end
