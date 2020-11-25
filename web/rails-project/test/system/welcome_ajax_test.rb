# frozen_string_literal: true
require 'application_system_test_case'

class WelcomeAjaxTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit welcome_index_path

    assert_selector 'h1', text: 'Задание'
  end

  test 'check results' do
    visit welcome_index_path

    fill_in :n, with: 6
    click_on 'Посчитать'

    assert_text '3'
    assert_text '9'

    assert_text 'Count: 4'

  end
end
