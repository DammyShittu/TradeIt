require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'SignUp', type: :feature do
  background { visit new_user_registration_path }
  scenario 'has necessary fields' do
    expect(page).to have_field('Full Name')
    expect(page).to have_field('Email')
    expect(page).to have_field('Password(6 characters minimum)')
    expect(page).to have_field('Confirm Password')
  end

  scenario 'displays next button' do
    expect(page).to have_button('Next')
  end

  scenario 'has login link' do
    expect(page).to have_link('Log In')
  end

  context 'Form Submission' do
    scenario 'Submit form without email' do
      within 'form' do
        fill_in 'Full Name', with: 'Dammy Shittu'
        fill_in 'Password(6 characters minimum)', with: '123456'
        fill_in 'Confirm Password', with: '123456'
      end
      click_button 'Next'
      expect(page).to have_content "Email can't be blank"
    end

    scenario 'Submit form without full name' do
      within 'form' do
        fill_in 'Email', with: 'admin@admin20.com'
        fill_in 'Password(6 characters minimum)', with: '123456'
        fill_in 'Confirm Password', with: '123456'
      end
      click_button 'Next'
      expect(page).to have_content "Name can't be blank"
    end

    scenario 'Submit form without password' do
      within 'form' do
        fill_in 'Full Name', with: 'Dammy Shittu'
        fill_in 'Email', with: 'admin@admin20.com'
      end
      click_button 'Next'
      expect(page).to have_content "Password can't be blank"
    end
  end

  # rubocop:enable Metrics/BlockLength
end
