import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('should render footer correctly', () => {
    const wrapper = mount(<Footer />);
    const footer = wrapper.find('.footer p');
    assert.strictEqual(wrapper.find('.footer p').text(), 'Copyright: Appfolio Inc. Onboarding');
    assert.strictEqual(footer.length, 1);
  });
});
