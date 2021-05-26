class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
  end

  def edit
   
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
  end

  def show
    
  end


  private
  def photo_params
    params.require(:photo).permit(:name, :text, :image)
  end

  
  def set_photo
    @photo = Photo.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
