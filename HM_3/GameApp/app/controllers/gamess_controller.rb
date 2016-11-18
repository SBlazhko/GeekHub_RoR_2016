class GamessController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def new 
    @game = Game.new 
  end

  def create
    game = Game.new(game_params)
    if game.save
      redirect_to game
    else 
      render :new
    end
  end


  def show
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to action: "index"
  end

  private

  def game_params
    params.require(:game).permit(:name, :genre, :size)
  end

  def find_game
    @game = Game.find(params[:id])
  end 
end
