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
    @hash = Gmaps4rails.build_markers(@journey.stops) do |stop, marker|
      marker.lat stop.latitude
      marker.lng stop.longitude
    end
  end

  private

    def journey_params
      params.require(:journey).permit(:title, :photo)
    end

end