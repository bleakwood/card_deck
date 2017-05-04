require './card_deck'

class AssertionError < RuntimeError
end

class CardDeckTest
	def assert &block
		raise AssertionError unless yield
	end

	def assert_shuffle
		cd = CardDeck.new
		top_card = cd.cards[cd.cards.length - 1]
		cd.shuffle
		new_top_card = cd.cards[cd.cards.length - 1]
		assert {top_card.rank != new_top_card.rank || top_card.suit != new_top_card.suit}
	end

	def assert_deal
		cd = CardDeck.new
		top_card = cd.cards[cd.cards.length - 1]
		length_before_deal = cd.cards.length
		dealt_card = cd.deal
		3.times do 
			cd.deal
		end
		assert {top_card.rank == dealt_card.rank && top_card.suit == dealt_card.suit}
		assert {cd.cards.length == length_before_deal - 4}
	end
end

begin
	cdt = CardDeckTest.new
	cdt.assert_shuffle
	cdt.assert_deal
	puts "tests passed"
rescue AssertionError => e
	puts e.message
	puts e.backtrace.inspect
end