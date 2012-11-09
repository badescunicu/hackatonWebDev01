require 'test/unit'

class TicTacToePlayer

  def initialize(nume = 'default')
  end

  def turn(gamestate)
    if( gamestate.class.to_s != "Hash" )
      raise ArgumentError
    elsif( gamestate.keys.length != 2)
        raise ArgumentError
    elsif( (gamestate.values[0].class.to_s != "Array" &&
          gamestate.values[0] != nil ) ||
          (gamestate.values[1].class.to_s != "Array" &&
          gamestate.values[1] != nil) )
          raise ArgumentError
    end



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
      tttp.turn({:key => nil, :key2 => nil})
    end
  end

  def test_does_not_raise_exception_to_hash_argument
    assert_nothing_raised do
      tttp = TicTacToePlayer.new
      tttp.turn({:owned_by_x =>[2,1], :owned_by_y =>[3,5]})
    end
  end

  def test_does_raise_exception_to_invalid_arguments
    assert_raise(ArgumentError) do
      tttp = TicTacToePlayer.new
      tttp.turn('test')
      tttp.turn([2,1,3])
    end
  end

  def test_class_has_constructor
    tttp = TicTacToePlayer.new('test')
  end

end

