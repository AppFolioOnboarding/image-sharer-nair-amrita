import React, { Component } from 'react';

class FeedbackForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      comments: ''
    };
  }

  handleNameChange = (event) => {
    this.setState({
      name: event.target.value
    });
  }
  handleCommentsChange = (event) => {
    this.setState({
      comments: event.target.value
    });
  }

  handleFormSubmit(feedback) {
    fetch('http://localhost:3000/api/feedbacks', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(feedback),
    }).then(response => response.json());
  }
  render() {
    return (
      <div className="container">
        <form onSubmit={(e) => {
            e.preventDefault();
            const feedback = {
              name: this.state.name,
              comments: this.state.comments
            };
            this.handleFormSubmit(feedback);
            e.target.reset();
}}
        >
          <div className="form-group">
            <label htmlFor="name">Your Name:</label>
            <input type="text" id="name" name="name" onChange={this.handleNameChange} />
          </div>
          <div className="form-group">
            <label htmlFor="comment">Comments:</label>
            <textarea id="comment" name="comment" onChange={this.handleCommentsChange} />
          </div>
          <input className="btn btn-primary" type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}
export default FeedbackForm;
