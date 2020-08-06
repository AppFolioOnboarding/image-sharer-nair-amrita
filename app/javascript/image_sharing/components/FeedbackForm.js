import React, { Component } from 'react';

class FeedbackForm extends Component {
  render() {
    return (
      <div className="container">
        <form>
          <div className="form-group">
            <label htmlFor="name">Your Name:</label>
            <input type="text" id="name" name="name" />
          </div>
          <div className="form-group">
            <label htmlFor="comment">Comments:</label>
            <textarea id="comment" name="comment" />
          </div>
          <input className="btn btn-primary" type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}
export default FeedbackForm;
