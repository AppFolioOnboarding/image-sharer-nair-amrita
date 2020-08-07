import React from 'react';

export default function FlashMessage(props) {
  return (
    <div className={`alert alert-${props.type}`} role="alert">
      {props.message}
    </div>);
}
