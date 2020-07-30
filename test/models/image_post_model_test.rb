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

  test 'create post with tags' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
    ImagePost.create!(title: 'Newest', image: file, tag_list: 'tag_1')
    assert_equal 1, ImagePost.last.tags.count
    assert_equal 'tag_1', ImagePost.last.tags.first.name
  end

  test 'update tags of a post' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
    ImagePost.create!(title: 'Newest', image: file, tag_list: 'tag_1')
    post = ImagePost.last
    post.tag_list.add('tag_2')
    post.save
    assert_equal 2, post.tags.count
  end

  test 'delete tags of a post' do
    file = fixture_file_upload(Rails.root.join('public', 'images.jpeg'), 'image/jpeg')
    ImagePost.create!(title: 'Newest', image: file, tag_list: 'tag_1, tag_2')
    post = ImagePost.last
    assert_equal 2, post.tags.count
    post.tag_list.delete('tag_1')
    post.save
    assert_equal 1, post.tags.count
  end
end
