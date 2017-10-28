class PagesController < ApplicationController

  def index
    id = session[:user_id]
    @user2 = User.find_by(id: id)

    if @user2.is_first_time
      redirect_to  edit_user_registration_path(@user2.id)
    end
    #copiar el edit de la carpeta views/users/edit.html.erb

  end

  def new
  end

  def show
  end
end
