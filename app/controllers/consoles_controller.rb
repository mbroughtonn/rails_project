class ConsolesController < ApplicationController
  def index
    per_page = 25
    @consoles = Console.page(params[:page]).per(per_page)
  end

  def show
    per_page = 25
    @console = Console.find(params[:id])
    @games = @console.games.page(params[:page]).per(per_page)
  end
end
