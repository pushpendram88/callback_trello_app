import React, { useEffect, useState } from 'react';

import Card from '../Card/Card.jsx';
import CreateCard from '../CreateCard/createCard.jsx';

function Cards() {

  const [cards, setCards] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('api/v1/cards')
    .then(res => res.json())
    .then(data => {
      setCards(data);
    });

  }, []);

  const onCardCreate = (newCard) => {
    console.log("New Card", newCard);
    setCards([...cards, newCard]);
    setLoading(false);
  };

  return (
    <>
      <CreateCard onCardCreate={ onCardCreate }/>
      { cards && <h2>List of Cards</h2> }
      <ol>
        {
          cards ?
            cards.map(card => <Card card={card} key={card.id}/>) :
            <p>{ ( !loading && cards.length ) ? 'No cards found' : 'Loading...' }</p>
        }
      </ol>
    </>
  );
}

export default Cards;
