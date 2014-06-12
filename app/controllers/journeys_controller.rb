class JourneysController < ApplicationController

  def new
    @journey = Journey.new
  end

  def create
  @journey = current_user.journeys.build(journey_params)
    if @journey.save
      flash[:success] = 'Journey Created!'
      redirect_to root_url
    else
      render 'new', :method => 'get'
    end
  end

  def show
    @journey = Journey.find(params[:id])

    @markers = []

    @journey.stops.each do |stop|
      marker_hash = { lat: stop.latitude, lng: stop.longitude,
        infowindow: "#{stop.title} <br/> See content", marker_title: stop.title }
      @markers.push(marker_hash)
    end

  end


  private

    def journey_params
      params.require(:journey).permit(:title, :photo)
    end

end