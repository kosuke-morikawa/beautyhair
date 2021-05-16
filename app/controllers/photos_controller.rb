class PhotosController < ApplicationController
  def index
    @phptos = Photo.all
  end

  
end
