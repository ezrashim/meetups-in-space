require "spec_helper"

feature "Create a new meetup" do
  scenario "create a new meetup form" do
    user = FactoryGirl.create(:user)

    visit '/'
    sign_in_as user
    click_button('Create a New Meetup')

    fill_in('meetup_name', :with => 'new meetup')
    fill_in('meetup_description', :with => 'something cool.')
    fill_in('meetup_location', :with => 'anywhere')

    click_button('Create a new Meetup')

    expect(page).to have_content ('Name:')
    expect(page).to have_content ('Description:')
    expect(page).to have_content ('Location:')
    expect(page).to have_content ('new meetup')
    expect(page).to have_content ('something cool.')
    expect(page).to have_content ('anywhere')
  end

  scenario "fail to create a new meetup form" do
    user = FactoryGirl.create(:user)

    visit '/'
    sign_in_as user
    click_button('Create a New Meetup')

    fill_in('meetup_name', :with => 'new meetup')
    fill_in('meetup_description', :with => 'something cool.')

    click_button('Create a new Meetup')

    expect(page).to have_content ('Please fill in all the sections.')
  end
end
