class App
    attr_accessor :items
  
    def initialize
      @games = []
      @functions = {
        10 => :add_item_game,
      }
    end

  def trigger(int)
    send(@functions[int])
  end

  def input_getter(msj, is_number: false)
    print msj
    is_number ? gets.chomp.to_i : gets.chomp
  end

  def add_item_book()
    print 'Add a date: '
    date = gets.chomp
  end

  def add_item_game()
    multiplayer = input_getter('Is this game multiplayer? [Y/N]: ')
    return add_item_game if multiplayer.capitalize != 'Y' && multiplayer.capitalize != 'N'
    multiplayer_bool = multiplayer.capitalize == 'Y'

    print 'Last time played date (yyyy-mm-dd): '
    last_played_at = gets.chomp

    print 'Publucation date (yyyy-mm-dd): '
    publish_date = gets.chomp

    game = Game.new(multiplayer_bool, last_played_at, publish_date)
    puts game.author.first_name
  end
end