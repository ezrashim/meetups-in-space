require 'spec_helper'
require 'pry'
require 'launchy'
require 'capybara'

feature "Site displays meetups" do
  let(:meetup) do
    Meetup.create(
      name: "Launch Gathering",
      description: "Launch Alumns to gather and code together every week.",
      location: "Mission Control",
      creator: "ezrashim"
    )
  end

  scenario "views meetups" do
    visit '/'
    expect(page).to have_content "Launch Gathering"
  end
end
