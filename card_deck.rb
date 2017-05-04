require './ranks'
require './suits'
require './card'

class CardDeck
	def initialize
		@cards = []
		Suits::SUITS.each do |suit|
			Ranks::RANKS.each do |rank|
				@cards.push Card.new(suit, rank)
			end
		end
	end

	def shuffle
		m = @cards.length
		t = 0
		while m > 0 do
			i = Random.rand(m)
			m -= 1
			t = @cards[m]
			@cards[m] = @cards[i]
			@cards[i] = t
		end
	end

	def cards
		@cards
	end

	def deal
		@cards.pop
	end
end