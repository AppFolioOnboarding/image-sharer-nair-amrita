require 'test_helper'
require 'open-uri'

class ImagePostTest < ActionDispatch::IntegrationTest
  test 'Cannot successfully create a post with no image attached' do
    assert_raise ActiveRecord::RecordInvalid do
      ImagePost.create!(title: 'Newest')
    end
  end

  test 'Cannot successfully create a post with attachments other than image' do
    assert_raise ActiveRecord::RecordInvalid do
      file = fixture_file_upload(Rails.root.join('public', 'dummy.pdf'), 'application/pdf')
      ImagePost.create!(title: 'Newest', image: file)
    end
  end
end
