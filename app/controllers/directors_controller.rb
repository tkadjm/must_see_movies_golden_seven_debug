class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

  def new_form
  end

  def create_row
    @director = Director.new
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    redirect_to("http://localhost:3000/directors")
  end

  def destroy
    @director = Director.find(params[:id])
    @director.destroy
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row

    d = Director.find(params["id"].to_i)
    d.name = params["the_name"]
    d.dob = params["the_dob"]
    d.bio = params["the_bio"]
    d.image_url = params["the_image_url"]
    d.save
    redirect_to("http://localhost:3000/directors")

  end

end
