class PublishersController < ApplicationController
  def index
    @publishers = Publisher.joins(:games)
                           .select('publishers.*, COUNT(games.id) AS games_count')
                           .group('publishers.id')
                           .order('games_count DESC')
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
