# frozen_string_literal: true

require 'application_system_test_case'

class AuthTest < ApplicationSystemTestCase
  def random_string len
    (0..len).map { ('a'..'z').to_a[rand(26)] }.join
  end

  test 'register and count' do
    login = random_string 10
    password = random_string 12

    visit register_url


    fill_in 'Login', with: login
    fill_in 'Password', with: password
    click_on 'Save'

    assert_text 'User was successfully registered'


    fill_in 'Login', with: login
    fill_in 'Password', with: password
    click_on 'Save'

    assert_text 'Задание'
    assert_text "Hi, #{login}."

    fill_in 'N', with: 4
    click_on 'Посчитать'

    assert_text '3 9'
    assert_text 'Count: 4'


    click_on 'Logout'

    assert_text 'Login'
  end

  test 'should not login user with invalid credentials' do
    visit login_url
    @user = users(:valid)

    fill_in 'Login', with: @user.login
    fill_in 'Password', with: VALID_PASSWORD + '1'
    click_on 'Save'

    assert_text 'Invalid credentials'
    fill_in 'Login', with: @user.login + '1'
    fill_in 'Password', with: VALID_PASSWORD
    click_on 'Save'

    assert_text 'Invalid credentials'
  end
end
