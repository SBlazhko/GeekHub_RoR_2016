require "rails_helper"
require "spec_helper"

feature "tests" do
  scenario "Create category" do 
    visit '/posts'
    click_link 'Add category'
    fill_in 'category_name', with: 'Sport'
    click_button 'Add category'

    expect(Category.last.name).to eq 'Sport' 
    expect(page).to have_content "Post name"
  end

  scenario "Create new post" do
    visit '/posts'
    click_link 'Add post'
    fill_in 'post_title', 'Football news'
    fill_in 'post_text', 'Messi got a gold ball :)'
    find(:css, "#_category_ids_[value='1']").set(true)
    click 'Create post'

    expect(page).to have_content 'Football news'
    expect(page).to have_content 'Messi got a gold ball :)'
    expect(page).to have_content 'Sport'
  end

  scenario "delete post" do
    visit '/posts'
    click_link 'delete'

    expect(page).to have_content 'Football news'
    expect(page).to have_content 'Messi got a gold ball :)'
    expect(page).to have_content 'Sport'
  end
end