class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photo_templates/index" })
  end

  def show
    url_photo_id = params.fetch("path_photo_id")
    matching_photo_ids = Photo.where({ :id => url_photo_id })
    @the_photo = matching_photo_ids.first
    render({ :template => "photo_templates/show" })
  end

  def create
    new_photo = Photo.new
    new_photo.image = params.fetch("input_image")
    new_photo.image = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")
    new_photo.save
    
    redirect_to("/photos/#{new_photo.id}")
  end

  def update
    the_id = params.fetch("update_id")
    photo = Photo.find(the_id)
    photo.image = params.fetch("input_image")
    photo.image = params.fetch("input_caption")
    photo.save
    
    redirect_to("/photos/#{photo.id}")
  end

  def destroy
    the_id = params.fetch("delete_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.first
    the_photo.destroy
    
    redirect_to("/photos")
  end

end
