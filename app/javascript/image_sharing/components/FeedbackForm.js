import React, { Component } from 'react';
import FlashMessage from './FlashMessage';

class FeedbackForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      comments: '',
      flashMessage: null
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
    }).then((response) => {
      if (response.status === 201) {
        this.setState({ flashMessage: { message: 'Feedback submitted successfully!!', type: 'success' }, name: '', comments: '' });
      } else {
        this.setState({ flashMessage: { message: 'Please fill both Name and Comments below!!', type: 'danger' } });
      }
      return response.json();
    });
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
            }}
        >
          {this.state.flashMessage &&
          <FlashMessage message={this.state.flashMessage.message} type={this.state.flashMessage.type} />}
          <div className="form-group">
            <label htmlFor="name">Your Name:</label>
            <input type="text" id="name" name="name" value={this.state.name} onChange={this.handleNameChange} />
          </div>
          <div className="form-group">
            <label htmlFor="comment">Comments:</label>
            <textarea id="comment" name="comment" value={this.state.comments} onChange={this.handleCommentsChange} />
          </div>
          <input className="btn btn-primary" type="submit" value="Submit" />
        </form>
      </div>
    );
  }
}
export default FeedbackForm;
