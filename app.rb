require 'sinatra/base'
require './lib/player.rb'
require './lib/game.rb'

class Battle < Sinatra::Base

  enable :sessions

before do 
  @game = Game.instance
end
 
get '/' do
    erb(:index)
  end

  post '/names' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    @game = Game.create(player1, player2)
    redirect '/play'
  end

  get '/play' do
  
    erb(:play)
  end

  get '/action' do
  
    @game.attack(@game.opponent_of(@game.current_turn))
    @game.switch_turns
    if @game.hp_check?
      redirect '/game_over'
    end
    erb(:action)
  end

  post '/switch-turns' do
  
    @game.switch_turns
    redirect '/play'
  end

  get '/game_over' do
 
    erb(:game_over)
  end

  #starts the server if ruby file executed directly
  run! if app_file == $0
end
