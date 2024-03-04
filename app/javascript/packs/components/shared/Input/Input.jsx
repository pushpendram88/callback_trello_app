import React from 'react';

import './styles.css';

function Input({ onChange, initialText }) {

  return <input type="text" value={ initialText } onChange={ onChange } onKeyPress={ onChange } maxLength="20" />
}

export default Input;
