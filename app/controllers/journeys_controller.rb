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
      marker.lat stop.latitude.to_s
      marker.lng stop.longitude.to_s
      marker.infowindow "#{stop.title} <br/> See content"
    end

  end

#   def gmaps4rails_marker_picture
#  {
#   "picture" => "/images/marker.png",
#    "width" =>  20,          # integer, mandatory
#    "height" => 20,          # integer, mandatory
#    "marker_anchor" => [-10, -10],   # array,   facultative, [0, 0] is the upper left corner
#                           #                       and [width, height] is the bottom right
#    "shadow_picture" => "/images/marker.png",  # string,  facultative
#    "shadow_width" => "110",
#    "shadow_height" => "110",
#    "shadow_anchor" => [5, 10]
#  }
# end

  private

    def journey_params
      params.require(:journey).permit(:title, :photo)
    end

end