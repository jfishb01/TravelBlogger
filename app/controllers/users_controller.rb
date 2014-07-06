
class UsersController < ApplicationController

  def show
    @user = User.find_by_obfuscated_id(params[:id])
  end

end
