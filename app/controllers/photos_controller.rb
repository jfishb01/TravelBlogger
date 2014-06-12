# class PhotosController < ApplicationController

#   def create
#   @journey = Journey.find(params[:journey_id])
#   @stop = Stop.find(params[:stop_id])
#   @photo = @journey.stops(params[:stop_id]).build(photo_params)
#   asdfasdf = adsfads
#   logger.debug("PHOTO: #{@photo}")

#     if @photo.save
#       redirect_to journey_stop_url(@journey, @stop)
#     else
#       flash[:error] = "There was an error while uploading. Please make sure all uploaded files are images."
#       # redirect_to journey_stop_url(@journey, @stop)
#       redirect_to root_url
#     end
#   end

#   private

#     def photo_params
#       params.require(:photos).permit(:stop_id, :journey_id, :image)
#     end
# end