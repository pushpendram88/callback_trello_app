import React from 'react';

function Card({ card }) {
  return (
    <li>
      { card.text }
    </li>
  );
}

export default Card;
