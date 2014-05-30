class BlogsController < ApplicationController

  def new
    @blog = Blog.new
  end

  def create
  @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = 'Project saved!'
      redirect_to root_url
    else
      render 'new', :method => 'get'
    end
  end

  private

    def blog_params
      params.require(:blog).permit(:name, :photo)
    end

end