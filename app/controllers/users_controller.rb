class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def show
    # Parameters: {"path_username"=>"aaa"}
    # whatever the a href calls path_username, my route.rb calls it this and hence this is what I fetch in my controller
    url_username = params.fetch("path_username")
    User.where({ :username => url_username })
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.first
    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show" })
    end
  end

end
