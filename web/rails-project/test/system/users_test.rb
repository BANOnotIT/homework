# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup :login

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'Users'
  end

  test 'creating a User' do
    visit users_url
    click_on 'New User'

    fill_in 'Login', with: @user.login + '1'
    fill_in 'Password', with: VALID_PASSWORD + '1'
    click_on 'Create User'

    assert_text 'User was successfully created'
    click_on 'Back'
  end

  test 'should not create a User with nonuniq name' do
    visit users_url
    click_on 'New User'

    fill_in 'Login', with: @user.login
    fill_in 'Password', with: VALID_PASSWORD + '1'
    click_on 'Create User'

    assert_text 'Login has already been taken'
    click_on 'Back'
  end

  test 'updating a User' do
    visit users_url
    click_on 'Edit', match: :first

    fill_in 'Login', with: @user.login
    fill_in 'Password', with: @user.password
    click_on 'Update User'

    assert_text 'User was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User' do
    visit users_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User was successfully destroyed'
  end
end
