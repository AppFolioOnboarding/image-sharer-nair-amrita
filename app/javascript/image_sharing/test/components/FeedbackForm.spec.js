import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import FeedbackForm from '../../components/FeedbackForm';

describe('<Form />', () => {
  it('should render name field correctly', () => {
    const wrapper = mount(<FeedbackForm />);
    assert.equal(wrapper.find('label[htmlFor="name"]').text(), 'Your Name:');
    const inputName = wrapper.find('#name');
    assert.strictEqual(inputName.length, 1);
  });
  it('should render comment field correctly', () => {
    const wrapper = mount(<FeedbackForm />);
    assert.equal(wrapper.find('label[htmlFor="comment"]').text(), 'Comments:');
    const inputComment = wrapper.find('#comment');
    assert.strictEqual(inputComment.length, 1);
  });
  it('should render form wth submit button', () => {
    const wrapper = mount(<FeedbackForm />);
    const submitButton = wrapper.find('.btn');
    assert.strictEqual(submitButton.props().value, 'Submit');
    assert.strictEqual(submitButton.length, 1);
  });
});
