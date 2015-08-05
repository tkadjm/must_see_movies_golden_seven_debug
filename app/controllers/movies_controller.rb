class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
  end

  def create_row

    @movie = Movie.new
    @movie.title = params[:the_title]
    @movie.year = params[:the_year]
    @movie.duration = params[:the_duration]
    @movie.description = params[:the_description]
    @movie.image_url = params[:the_image_url]
    @movie.director_id = params[:director_id]

    @movie.save
    render("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    m = Movie.find(params["id"].to_i)
    m.title = params["title"]
    m.year = params["year"]
    m.duration = params["duration"]
    m.description = params["description"]
    m.image_url = params["image_url"]
    m.director_id = params["director_id"]
    m.save
    @movie = m

    render("show")
  end

  def destroy
    movie = Movie.find(params[:id])
    @title = movie.title
    movie.destroy
  end
end
