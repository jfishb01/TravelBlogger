class StopsController < ApplicationController

  before_action :correct_user?, only: [:new, :create, :edit, :update, :destroy]

  def new
    @stop = Stop.new
    @journey = Journey.find(params[:journey_id])
  end

  def edit
    @stop = Stop.find(params[:id])
    @journey = Journey.find(params[:journey_id])
  end

  def create
  @journey = Journey.find(params[:journey_id])
  @stop = @journey.stops.build(stop_params)

    if @stop.save
      redirect_to journey_stop_url(@journey, @stop)
    else
      render 'new', :method => 'get'
    end
  end

  def show
    @stop = Stop.find(params[:id])
    @journey = Journey.find(params[:journey_id])

    @markers = []

    marker_hash = { lat: @stop.latitude, lng: @stop.longitude,
      infowindow: "#{@stop.location}",
      marker_title: @stop.title }
    @markers.push(marker_hash)

  end

  def update

    @stop = Stop.find(params[:id])
    @journey = Journey.find(params[:journey_id])

    if(!params[:images].nil?)
      params[:images].each do |image|
        @stop.photos.create(image: image)
      end
    end

    if @stop.update_attributes(stop_params)
      redirect_to journey_stop_url(@journey, @stop)
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    @journey = Journey.find(params[:journey_id])
    @stop.destroy

    redirect_to journey_path(@journey)
  end

  private

    def stop_params
      params.require(:stop).permit(:title, :location, :latitude, :longitude, :content,
        :images, :start_date, :end_date, :updated_at, :created_at)
    end

    def stop_update_params
      params.permit(:title, :location, :latitude, :longitude, :content, :images, :start_date, :end_date, :updated_at)
    end

    def correct_user?
      # @journey = current_user.journeys.find_by(:journey_id, params[:journey_id])
      # @stop = @journey.stops.find_by(id: params[:id])
      # redirect_to root_url if @stop.nil?
    end
end