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
    a = Actor.new
    a.name = params.fetch("the_name")
    a.dob = params.fetch("the_dob")
    a.image = params.fetch("the_image")
    a.actor_id = params.fetch("the_actor_id")

    a.save

    redirect_to("/actors")
  end

  def destroy
    the_id = params.fetch("an_id")
   matching_actors = Actor.where({:id => the_id})

the_actor = matching_actors.at(0)
the_actor.destroy
redirect_to("/movies")
  end

  def update
    a_id = params.fetch("the_id")
    matching_actors = Actor.where({:id => a_id})
    the_actor = matching_actors.at(0)
  
    the_actor.name = params.fetch("the_name")
    the_actor.dob = params.fetch("the_dob")
    the_actor.image = params.fetch("the_image")
    the_actor.actor_id = params.fetch("the_actor_id")
  
    redirect_to("/actor/#{the_actor.id}")
  end

end
