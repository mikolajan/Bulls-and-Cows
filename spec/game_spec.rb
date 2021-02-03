require 'game'

describe Game do
  describe '.new' do
    it 'assigns instance variables' do
      game = Game.new('1224')

      expect(game.hidden_word).to eq '1224'
      expect(game.checked_words).to be_empty
    end
  end

  describe '#check_word' do
    context 'check simple words' do
      before(:each) { @game = Game.new('123') }

      it 'returns 0b0c' do
        expect(@game.check_word('5678')).to eq '0b0c'
      end

      it 'returns 1b0c' do
        expect(@game.check_word('145')).to eq '1b0c'
        expect(@game.check_word('425')).to eq '1b0c'
        expect(@game.check_word('453')).to eq '1b0c'
      end

      it 'returns 2b0c' do
        expect(@game.check_word('124')).to eq '2b0c'
        expect(@game.check_word('143')).to eq '2b0c'
        expect(@game.check_word('423')).to eq '2b0c'
      end

      it 'returns 3b0c' do
        expect(@game.check_word('123')).to eq '3b0c'
      end

      it 'returns 0b1c' do
        expect(@game.check_word('345')).to eq '0b1c'
        expect(@game.check_word('451')).to eq '0b1c'
      end

      it 'returns 0b2c' do
        expect(@game.check_word('412')).to eq '0b2c'
        expect(@game.check_word('235')).to eq '0b2c'
      end

      it 'returns 0b3c' do
        expect(@game.check_word('231')).to eq '0b3c'
      end
    end

    context 'check difficult words' do
      it 'returns 0b9c' do
        game = Game.new('123456789')

        expect(game.check_word('912345678')).to eq '0b9c'
      end

      it 'returns 9b0c' do
        game = Game.new('999999999')

        expect(game.check_word('999999999')).to eq '9b0c'
      end

      it 'returns 0b6c' do
        game = Game.new('111222')

        expect(game.check_word('222111')).to eq '0b6c'
      end

      it 'returns 2b2c' do
        game = Game.new('12222')

        expect(game.check_word('22211')).to eq '2b2c'
      end

      it 'returns 3b2c' do
        game = Game.new('12221')

        expect(game.check_word('22211')).to eq '3b2c'
      end
    end
  end

  describe '#finish?' do
    before(:each) { @game = Game.new('1234') }

    it 'returns true' do
      expect(@game.finish?('abort')).to be true
      expect(@game.finish?('1234')).to be true
    end

    it 'returns false' do
      expect(@game.finish?('abotr')).to be false
      expect(@game.finish?('4321')).to be false
    end
  end
end
