require 'test_helper'

class FeedbacksControllerTest < ActionDispatch::IntegrationTest
  test 'should create feedback' do
    assert_difference 'Feedback.count', 1 do
      post api_feedbacks_path, params: { feedback: { name: 'test', comments: 'testing comments' } }
    end
    assert_response :created
    body = JSON.parse(response.body)
    assert_equal 'Feedback submitted!', body['message']
  end

  test 'should not create feedback when comments is empty' do
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { name: 'test', comments: ' ' } }
    end
    assert_response :internal_server_error
    body = JSON.parse(response.body)
    assert_equal 'Could not save feedback!', body['message']
  end

  test 'should not create feedback when name is empty' do
    assert_no_difference 'Feedback.count' do
      post api_feedbacks_path, params: { feedback: { comments: 'testing only' } }
    end
    assert_response :internal_server_error
    body = JSON.parse(response.body)
    assert_equal 'Could not save feedback!', body['message']
  end
end
