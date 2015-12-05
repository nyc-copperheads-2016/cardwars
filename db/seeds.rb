# Jay's Star Wars Deck

Deck.create(name: "Star Wars")
sw_id = Deck.find_by(name: "Star Wars").id

star_wars_cards = [
  { question: "The idea for Chewbacca the Wookiee came from George Lucas's pet what?",
    answer: "dog",
    deck_id: sw_id
  },
  { question: "How many times is the phrase, 'I have a bad feeling about this.' said in the three movies?",
    answer: "5",
    deck_id: sw_id
  },
  { question: "Who killed the Emperor in 'Return of the Jedi'?",
    answer: "Darth Vader",
    deck_id: sw_id
  },
  { question: "Who said the following quote: 'Would somebody get this big walking carpet out of my way'?",
    answer: "Princess Leia",
    deck_id: sw_id
  },
  { question: "Who says this: 'I'm altering the deal, pray I don't alter it any further.'?",
    answer: "Darth Vader",
    deck_id: sw_id
  },
  { question: "Who says this: 'Try not. Do or do not. There is no try.'?",
    answer: "Yoda",
    deck_id: sw_id
  },
  { question: "What can supposedly be seen floating in the asteroid field in 'The Empire Strikes Back'?",
    answer: "A Potato",
    deck_id: sw_id
  },
  { question: "Which of the movies in the trilogy is the longest?",
    answer: "Return of the Jedi",
    deck_id: sw_id
  }
]

star_wars_cards.each do |card|
  Card.create(card)
end
