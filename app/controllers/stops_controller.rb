class StopsController < ApplicationController

  def new
    @stop = Stop.new
  end

  def create
  @journey = Journey.find(params[:journey_id])
  @stop = @journey.stops.build(stop_params)
    if @stop.save
      flash[:success] = 'Stop Created!'
      redirect_to journey_stop_url(@journey, @stop)
    else
      render 'new', :method => 'get'
    end
  end

  def show
    @stop = Stop.find(params[:id])
  end

  private

    def stop_params
      params.require(:stop).permit(:location, :title, :latitude, :longitude, :content)
    end

end