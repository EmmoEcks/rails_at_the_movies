class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:production_company).all
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
