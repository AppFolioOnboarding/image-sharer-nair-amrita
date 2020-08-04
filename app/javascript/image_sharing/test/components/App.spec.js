/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import App from '../../components/App';
import Footer from '../../components/Footer';
import FeedbackForm from '../../components/FeedbackForm';

describe('<App />', () => {
  it('should render correctly', () => {
    const wrapper = mount(<App />);
    assert(wrapper.contains('Tell us what you think'));
    assert.strictEqual(wrapper.find(FeedbackForm).length, 1);
    assert.strictEqual(wrapper.find(Footer).length, 1);
  });
});
