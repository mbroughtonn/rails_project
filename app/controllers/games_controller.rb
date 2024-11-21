class GamesController < ApplicationController
  def index
    per_page = 25
    @games = Game.page(params[:page]).per(per_page)
  end

  def show
    @game = Game.find(params[:id])
  end
end
