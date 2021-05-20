class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @phpto = Photo.new
  end

  def create
    Photo.create(photo_params)
  end


  private
  def photo_params
    params.require(:photo).permit(:name, :text, :image)
  end
  
end
