class PhotosController < ApplicationController

  def edit
    @journey = Journey.find_by_obfuscated_id(params[:journey_id])
    @stop = Stop.find(params[:stop_id])
    @photo = Photo.find(params[:id])
  end

  def update
    @journey = Journey.find_by_obfuscated_id(params[:journey_id])
    @stop = Stop.find(params[:stop_id])
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to journey_stop_url(@journey, @stop)
    else
      flash[:error] = "There was an error while uploading. Please make sure all uploaded files are images."
      # redirect_to journey_stop_url(@journey, @stop)
      redirect_to root_url
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @stop = Stop.find(params[:stop_id])
    @journey = Journey.find_by_obfuscated_id(params[:journey_id])
    @photo.destroy

    redirect_to journey_stop_path(@journey, @stop)
  end

  private

    def photo_params
      params.require(:photo).permit(:stop_id, :journey_id, :image, :title, :caption, :created_at, :updated_at)
    end
end