require "application_system_test_case"

class TimeEntriesIntegrationTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit time_entries_url

    find('#user_email').fill_in with: users(:asdf).email
    find('#user_password').fill_in with: 'asdf'

    find('input[type="submit"]').click

    assert_text 'My entry 1'

    new_title = 'some my title'
    find('.js-entry-editor .js-title-input').fill_in with: new_title
    find('.js-entry-editor .js-start-btn').click

    find('.js-entry-editor .js-stop-btn').click

    assert_text find('.js-time-entry .title'), new_title

    page.accept_confirm do
      first('.js-time-entry .bi-trash').click
    end
    refute_text first('.js-time-entry .title'), new_title

    find('a[data-testid="logout"]').click

    assert_selector('#user_email')

  end
end
