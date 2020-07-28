require 'test_helper'
require 'open-uri'

class ImagePostControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get posts_path
    assert_response :success
  end

  test 'should create image' do
    assert_difference 'Post.count', 1 do
      file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
      post posts_path, params: { post: { title: 'Image1', image: file } }
    end

    assert_redirected_to post_path(Post.last.id)
    follow_redirect!
    assert_response :success
  end
end
