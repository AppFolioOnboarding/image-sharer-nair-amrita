require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  test 'Cannot successfully create a feedback with name not filled' do
    assert_raise ActiveRecord::RecordInvalid do
      Feedback.create!(comments: 'test comment')
    end
    assert_raise ActiveRecord::RecordInvalid do
      Feedback.create!(name: '  ', comments: 'test comment')
    end
  end

  test 'Cannot successfully create a feedback with comments not filled' do
    assert_raise ActiveRecord::RecordInvalid do
      Feedback.create!(name: 'test')
    end
    assert_raise ActiveRecord::RecordInvalid do
      Feedback.create!(name: 'test', comments: '     ')
    end
  end

end
