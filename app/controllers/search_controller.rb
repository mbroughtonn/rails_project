class SearchController < ApplicationController
  def index
    @query = params[:q]
    
    if @query.present?
      @games = Game.where('title LIKE ?', "%#{@query}%")
      @publishers = Publisher.where('name LIKE ?', "%#{@query}%")
      @consoles = Console.where('name LIKE ?', "%#{@query}%")
    else
      @games = []
      @publishers = []
      @consoles = []
    end
  end
end
