require "rails_helper"
require 'spec_helper'

feature "Omniauth VK" do
  scenario "Signing in " do
    visit '/sessions/new'
    click_link 'VK'

    expect(page).to have_content 'Blaghco@ukr.net'
    expect(page).to have_content 'Logout'
  end

  scenario "Signing out" do
    visit '/sessions/new'
    click_link 'VK'
    click_link 'Logout'

    expect(page).to have_content "VK"
  end
end