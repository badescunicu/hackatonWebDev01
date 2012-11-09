require 'test/unit'

class TicTacToePlayer
  def turn
  end
end

class TestPlayer < Test::Unit::TestCase
  def test_truthiness
    functionality_implemented = true 
    assert( functionality_implemented, failure_message = "Functionality not
            implemented")
  end

  def test_responds_to_turn
    tttp = TicTacToePlayer.new
    assert_respond_to( tttp, :turn, failure_message = "An instance of tttPlayer
                      does not respond to test")
  end

  def test_does_not_raise_exception_to_argument
    assert_nothing_raised do
      tttp = TicTacToePlayer.new
      tttp.turn('test')
    end
  end


end

