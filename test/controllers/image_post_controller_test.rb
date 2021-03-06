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

  test 'create post with tags' do
    assert_difference 'ImagePost.count', 1 do
      file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
      post image_posts_path, params: { image_post: { title: 'Image1', image: file,
                                                     tag_list: 'tag_1 , tag_2' } }
    end

    assert_redirected_to image_post_path(ImagePost.last.id)
    assert_equal 2, ImagePost.last.tags.count
    follow_redirect!
    assert_response :success
  end

  test 'show post with 2 tags' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
    newest_post = ImagePost.create!(title: 'Newest', created_at: Time.zone.now, image: file,
                                    tag_list: 'tag_1, tag_2')
    get image_post_path(newest_post)
    assert_response :success
    assert_select 'h5 a', 2 do |elements|
      assert_equal 'tag_1', elements[0].text
      assert_equal 'tag_2', elements[1].text
    end
  end

  test 'filter post by a tag' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
    post1 = ImagePost.create!(title: 'Newest', created_at: Time.zone.now, image: file,
                              tag_list: 'tag_1, tag_2')
    post2 = ImagePost.create!(title: 'Newest', created_at: Time.zone.now, image: file,
                              tag_list: 'tag_1, tag_3')
    get image_posts_path, params: { tag: 'tag_1' }
    assert_response :success
    assert_select 'img', 2 do |elements|
      assert_equal url_for(post2.image), elements[0].attributes['src'].value
      assert_equal url_for(post1.image), elements[1].attributes['src'].value
    end
  end

  test 'delete an existing post' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
    ImagePost.create!(title: 'Newest', created_at: Time.zone.now, image: file,
                      tag_list: 'tag_1, tag_2')
    assert_difference 'ImagePost.count', -1 do
      delete image_post_path(ImagePost.last.id)
    end

    assert_redirected_to image_posts_path
    assert_equal 'Image successfully deleted!', flash[:success]
    follow_redirect!
    assert_response :success
  end

  test 'error when attempting to delete an already deleted post' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
    ImagePost.create!(title: 'Newest', created_at: Time.zone.now, image: file,
                      tag_list: 'tag_1, tag_2')
    deleted_id = ImagePost.last.id
    delete image_post_path(deleted_id)
    assert_no_difference 'ImagePost.count' do
      delete image_post_path(deleted_id)
      assert_equal 'Error! Post does not exist!', flash[:danger]
    end
  end

  test 'should show image' do
    get image_posts_path(@post)
    assert_response :success
  end

  test 'index renders all images ordered by creation date' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')

    newest_post = ImagePost.create!(title: 'Newest', created_at: Time.zone.now, image: file)
    oldest_post = ImagePost.create!(title: 'Oldest', created_at: Time.zone.now - 10.minutes, image: file)

    get image_posts_path
    assert_response :success
    assert_select 'img', 2 do |elements|
      assert_equal url_for(newest_post.image), elements[0].attributes['src'].value
      assert_equal url_for(oldest_post.image), elements[1].attributes['src'].value
    end
  end

  test 'The landing page has a message when there are no images' do
    get image_posts_path
    assert_response :success

    assert_select 'h3', 'No images posted so far!'
  end
end
