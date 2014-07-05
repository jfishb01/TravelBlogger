class JourneysController < ApplicationController

  before_action :correct_user?, only: [:edit, :update, :destroy]

  def new
    # @journey = Journey.new
    @journey = current_user.journeys.new
  end

  def edit
    @journey = Journey.find(params[:id])
  end

  def create
  @journey = current_user.journeys.build(journey_params)
    if @journey.save
      redirect_to journey_path(@journey)
    else
      render 'new', :method => 'get'
    end
  end

  def show
    @journey = Journey.find(params[:id])

    @markers = []

    @journey.stops.each do |stop|
      marker_hash = { lat: stop.latitude, lng: stop.longitude,
        infowindow: "#{stop.title} <br/> <a href='" + journey_stop_path(@journey, stop) + "'>See content</a>",
        marker_title: stop.title }
      @markers.push(marker_hash)
    end
  end

  def update
    @journey = Journey.find(params[:id])

    if @journey.update_attributes(journey_params)
      redirect_to journey_url(@journey)
    else
      redirect_to root_url
    end

  end

  def destroy
    @journey = Journey.find(params[:id])
    @journey.destroy

    redirect_to root_url
  end

  private

    def journey_params
      params.require(:journey).permit(:title, :photo)
    end

    def correct_user?
      # @journey = current_user.journeys.find_by(id: params[:id])
      # redirect_to root_url if @journey.nil?
    end

end