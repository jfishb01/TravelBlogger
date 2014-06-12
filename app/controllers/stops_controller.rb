class StopsController < ApplicationController

  def new
    @stop = Stop.new
  end

  def create
  @journey = Journey.find(params[:journey_id])
  @stop = @journey.stops.build(stop_params)

  title_str = @stop.content.split('h1>')[1].strip
  title_str = title_str.split(':')[1].strip
  @stop.title = title_str.chop.chop

  location_str = @stop.content.split('h2>')[1].strip
  location_str = location_str.split(':')[1].strip
  @stop.location = location_str.chop.chop

  content = @stop.content.split('h2>')[2].strip
  content.gsub(/\<br\/\>/, '')
  @stop.content = content

    if @stop.save
      redirect_to journey_stop_url(@journey, @stop)
    else
      render 'new', :method => 'get'
    end
  end

  def show
    @stop = Stop.find(params[:id])
    @journey = Journey.find(params[:journey_id])
  end

  def update

    @stop = Stop.find(params[:id])
    @journey = Journey.find(params[:journey_id])

    params[:images].each do |image|
      @stop.photos.create(image: image)
    end

    if @stop.update_attributes(stop_update_params)
      redirect_to journey_stop_url(@journey, @stop)
    else
      flash[:error] = "There was an error while uploading. Please make sure all uploaded files are images."
      # redirect_to journey_stop_url(@journey, @stop)
      redirect_to root_url
    end
  end

  private

    def stop_params
      params.require(:stop).permit(:latitude, :longitude, :content, :images)
    end

    def stop_update_params
      params.permit(:latitude, :longitude, :content, :images)
    end
end