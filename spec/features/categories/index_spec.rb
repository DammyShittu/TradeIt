require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'Dammy Shittu', email: 'start@tech.com', password: 'qwertyu')
    @category = Category.create(name: 'Furniture', user_id: @user.id)
    @exchange = Exchange.create(name: 'Chair', amount: 50, author_id: @user.id, category_ids: @category.id)

    within 'form' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Log In'
    visit categories_path
  end

  scenario 'show Categories on page' do
    expect(page).to have_content 'CATEGORIES'
  end

  scenario 'display details of a category' do
    expect(page).to have_content(@category.name)
    expect(page).to have_content('04 Jan 2022')
    expect(page).to have_content('$50')
    expect(page).not_to have_content('$0')
  end

  scenario 'show Add A Category button on page' do
    expect(page).to have_link 'Add A Category'
  end

  scenario 'go to exchanges page' do
    find("a[href='#{category_path(@category.id)}']").click
    expect(page).to have_current_path(category_path(@category.id))
  end
end
