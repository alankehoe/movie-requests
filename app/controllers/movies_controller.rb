class MoviesController < ApplicationController
  before_action :set_movie, only: [:destroy]

  # GET /movies
  def index
    @movies = Movie.all
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_url
    else
      render action: 'new'
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    redirect_to movies_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movie
    @movie = Movie.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movie_params
    params.require(:movie).permit(:name)
  end

end