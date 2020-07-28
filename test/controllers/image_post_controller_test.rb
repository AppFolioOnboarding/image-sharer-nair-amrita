require 'test_helper'
require 'open-uri'

class ImagePostControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get image_posts_path
    assert_response :success
  end

  test 'should create image' do
    assert_difference 'ImagePost.count', 1 do
      file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
      post image_posts_path, params: { image_post: { title: 'Image1', image: file } }
    end

    assert_redirected_to image_post_path(ImagePost.last.id)
    follow_redirect!
    assert_response :success
  end
end
