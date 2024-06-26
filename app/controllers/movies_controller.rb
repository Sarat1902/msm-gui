class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    m = Movie.new
    m.title = params.fetch("query_title")
    m.year = params.fetch("query_year")
    m.duration = params.fetch("query_duration")
    m.image = params.fetch("query_image")
    m.director_id = params.fetch("query_director_id")
    m.description = params.fetch("query_description")
    m.save

    redirect_to("/movies")
  end

  def delete
    the_id = params.fetch("an_id")
    m = Movie.where({:id => the_id })
    the_movie = m.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end

  def modify
    movie_id = params.fetch("an_id")
    movie = Movie.where({:id => movie_id})
    m = movie.at(0)
    m.title = params.fetch("query_title")
    m.year = params.fetch("query_year")
    m.duration = params.fetch("query_duration")
    m.image = params.fetch("query_image")
    m.director_id = params.fetch("query_director_id")
    m.description = params.fetch("query_description")
    m.save

    redirect_to("/movies/#{movie_id}")
  end


end
