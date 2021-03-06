class PhotosController < ApplicationController
  before_action :set_photo, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @photos = Photo.includes(:user).order("created_at DESC")
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
    @comment = Comment.new
    @comments = @photo.comments.includes(:user)
  end

  def search
    @photos = Photo.search(params[:keyword])
  end


  private
  def photo_params
    params.require(:photo).permit(:text, :image).merge(user_id: current_user.id)
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
