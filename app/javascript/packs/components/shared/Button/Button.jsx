import React from 'react';

import './styles.css';

function Button({ onClick, buttonText }) {
  return <button type="button" onClick={ onClick }>{ buttonText }</button>
}

export default Button;
