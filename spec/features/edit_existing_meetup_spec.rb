require "spec_helper"

feature "edit existing meetup" do
  scenario "edit when everything is filled in properly" do
    user = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup, creator: user)

    visit '/'
    sign_in_as user
    click_link(meetup.name)
    click_button('edit')

    fill_in('meetup_name', :with => 'new meetup')
    fill_in('meetup_description', :with => 'something cool.')
    fill_in('meetup_location', :with => 'anywhere')

    click_button('Submit')

    expect(page).to have_content("You have successfully updated #{meetup.name}.")
    expect(page).to have_content ('Name:')
    expect(page).to have_content ('Description:')
    expect(page).to have_content ('Location:')
    expect(page).to have_content ('new meetup')
    expect(page).to have_content ('something cool.')
    expect(page).to have_content ('anywhere')
  end

  scenario "fail to edit when everything is not filled in" do
    user = FactoryGirl.create(:user)
    meetup = FactoryGirl.create(:meetup, creator: user)

    visit '/'
    sign_in_as user
    click_button('edit')

    fill_in('meetup_name', :with => 'new meetup')
    fill_in('meetup_description', :with => 'something cool.')

    click_button('Submit')

    expect(page).to have_content ('Please fill in all the sections.')
  end
end
