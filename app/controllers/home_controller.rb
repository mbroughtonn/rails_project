class HomeController < ApplicationController
  def index
    @games = Game.all.limit(10)

    @publishers = Publisher.all.limit(10)
  end
end
