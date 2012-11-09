require 'test/unit'

class TicTacToePlayer

BOARD = [:a1, :a2, :a3, :b1, :b2, :b3, :c1, :c2, :c3]
WINNING_COMBINATIONS = [[:a1, :a2, :a3],
                          [:b1, :b2, :b3],
                          [:c1, :c2, :c3],
                          [:a1, :b1, :c1],
                          [:a2, :b2, :c2],
                          [:a3, :b3, :c3],
                          [:a1, :b2, :c3],
                          [:c1, :b2, :a3]]

  def initialize(nume = 'X')
    if( nume != 'X' && nume != '0')
      raise ArgumentError
    end
    @nume = nume
    @owned_by_x = []
    @owned_by_zero = []
  end

  def nume
    @nume
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

    @owned_by_x = gamestate[:owned_by_x].to_a
    @owned_by_zero = gamestate[:owned_by_zero].to_a

    WINNING_COMBINATIONS.each do |wcomb|
      if( wcomb - @owned_by_x).empty?
        return "X won"
      end
      if( wcomb - @owned_by_zero ).empty?
        return "0 won"
      end
    end

# if( @owned_by_x.length + @owned_by_zero.length >= 9)
#      return 'Tie'
#    end

    if( @nume == 'X' )
      @owned_by_x << (BOARD - @owned_by_x - @owned_by_zero).sample
    else
      @owned_by_zero << (BOARD - @owned_by_x - @owned_by_zero).sample
    end

    gamestate = {:owned_by_x => @owned_by_x, :owned_by_zero => @owned_by_zero}
    return gamestate


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


  def test_does_raise_exception_to_invalid_arguments
    assert_raise(ArgumentError) do
      tttp = TicTacToePlayer.new
      tttp.turn('test')
      tttp.turn([2,1,3])
    end
  end

  def test_class_has_constructor
    tttp = TicTacToePlayer.new()
  end

  def test_raise_exception_to_invalid_constructor
    assert_raise(ArgumentError) do
    tttp = TicTacToePlayer.new('random')
    end
  end

  def test_winner
    tttp = TicTacToePlayer.new('X')
    assert_equal(tttp.turn({:owned_by_x => [:b1, :b2, :b3], :owned_by_zero =>
                           []}), 'X won')
  end

  def test_respond_to_nume
    tttp = TicTacToePlayer.new('X')
    assert_respond_to(tttp, :nume)
  end


end

