require_relative '../spec_helper'

describe Card do
  @card1 = Card.new(answer: "Yes", question: "Answer Yes")
  describe 'reader_methods' do
    it 'returns its own answer' do
      expect(@card1.answer).to eq "Yes"
    end
    it 'returns its own question' do
      expect(@card1.question).to eq "Answer Yes"
    end
  end
  describe 'is_correct?' do
    @corect_guess = "Yes"
    @case_insensitive_guess = "yes"
    @wrong_guess = "no"
    it 'returns true if guess is correct case-sensitive' do
      expect(@card1.is_correct?(@correct_guess)).to eq true
    end
    it 'returns true if guess is correct case-insensitive' do
      expect(@card1.is_correct?(@case_insensitive_guess)).to eq true
    end
    it 'returns false if guess is incorrect' do
      expect(@card1.is_correct?(@wrong_guess)).to eq false
    end
  end
end
