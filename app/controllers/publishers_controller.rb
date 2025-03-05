class PublishersController < ApplicationController
  def index
    per_page = 25
    @publishers = Publisher.joins(:games)
                           .select('publishers.*, COUNT(games.id) AS games_count')
                           .group('publishers.id')
                           .order('games_count DESC')
                           .page(params[:page])
                           .per(per_page)
  end

  def show
    per_page = 25
    @publisher = Publisher.find(params[:id])
    @games = @publisher.games.page(params[:page]).per(per_page)
  end
end
