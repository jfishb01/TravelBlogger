class StaticPagesController < ApplicationController

  def about
  end

  def contact
  end

  def home
    if user_signed_in?
      redirect_to user_path(current_user.obfuscated_id)
    end
  end

  def confirm
  end

end
