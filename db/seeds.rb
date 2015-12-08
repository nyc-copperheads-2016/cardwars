# Jay's Star Wars Deck

# Dont assume that ID's are what you think they will be.  Use objects and build
# associations off of those objects.
Deck.create(name: "Star Wars", round_id: 1)
sw = Deck.find_by(name: "Star Wars")

# Use the AR association Getters/Setters to set the association values.  Dont use
# the underlying id fields if you can avoid it.
star_wars_cards = [
  { question: "The idea for Chewbacca the Wookiee came from George Lucas's pet what?",
    answer: "dog",
    deck: sw
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
###########################################################################################################################
# Courtney's Space Triva Deck!

Deck.create(name: "SPACE!", round_id: 2)
sp_id = Deck.find_by(name: "SPACE").id

space_cards = [
  { question: "What is the closest planet to the Sun?         ",
    answer: "Mercury",
    deck_id: sp_id
  },
  { question: " What is the name of the 2nd biggest planet in our solar system? ",
    answer: " Saturn",
    deck_id: sp_id
  },
  { question: " What is the hottest planet in our solar system?",
    answer: "Venus",
    deck_id: sp_id
  },
  { question: "What planet is famous for its big red spot on it?",
    answer: "Jupiter",
    deck_id: sp_id
  },
  { question: "Can humans breathe normally in space as they can on Earth?",
    answer: "No",
    deck_id: sp_id
  },
  { question: "Is the sun a star or a planet?",
    answer: "A Star",
    deck_id: sp_id
  },
  { question: "What planet is known as the red planet?",
    answer: "Mars",
    deck_id: sp_id
  },
  { question: "What is the name of NASA’s most famous space telescope?",
    answer: " Hubble Space Telescope",
    deck_id: sp_id
  }
]

space_cards.each do |card|
  Card.create(card)
end

