import React, { useState } from 'react';

import Input from '../shared/Input/Input.jsx';
import Button from '../shared/Button/Button.jsx';

function CreateCard({ onCardCreate }) {

  const [text, setText] = useState('');

  const handleTextChange = (event) => {
    setText(event.target.value);

    if(event.code === 'Enter') {
      handleCardCreate();
    }
  };

  const handleCardCreate = () => {

    const data = new FormData();
    data.append("text", text);

    fetch('api/v1/cards', {
      method: 'POST',
      body: data
    })
    .then(response => response.json())
    .then(data => {
      console.log(data);
      onCardCreate(data.card);
      setText('');
      alert(data.message);
    })
    .catch((error) => {
      const errorMessage = error.errors || error.message;
      alert(errorMessage);
    });
  };

  return (
    <>
      <Input onChange={ handleTextChange } initialText={ text }/>
      <Button onClick={ handleCardCreate } buttonText="Create Card" />
    </>
  );
}

export default CreateCard;
