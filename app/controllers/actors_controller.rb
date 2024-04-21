class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    d = Actor.new
    d.name = params.fetch("query_name")
    d.dob = params.fetch("query_dob")
    d.bio = params.fetch("query_bio")
    d.image = params.fetch("query_image")
    d.save
    redirect_to("/actors")
  end

  def delete
    the_id = params.fetch("an_id")
    m = Actor.where({:id => the_id })
    the_actor = m.at(0)
    the_actor.destroy
    redirect_to("/actors")
  end


  def modify
    actor_id = params.fetch("an_id")
    actor = Actor.where({:id => actor_id})
    d = actor.at(0)
    d.name = params.fetch("query_name")
    d.dob = params.fetch("query_dob")
    d.bio = params.fetch("query_bio")
    d.image = params.fetch("query_image")
    d.save
    redirect_to("/actors/#{actor_id}")
  end

end
