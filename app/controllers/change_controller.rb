class ChangeController < ApplicationController
  def nickname
    if params['nickname']
      if is_nickname_valid? params['nickname']
        session['nickname'] = @nickname = params['nickname']
        flash[:notice] = "Nickname has been changed to #{@nickname}"
      else
        flash[:notice] = "Please choose a nickname that is more then 2 characters and shorter then 20"
      end
      
      if params['room']
        redirect_to show_room_path params['room']
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end