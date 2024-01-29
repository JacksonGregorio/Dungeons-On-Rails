class AuthenticationController < ApplicationController

    before_action :authorize_request, except: :login

    def login
      if params[:email].nil?
        json_response(error: 'email is required' , status: :unauthorized)
      else
        @player = Player.find_by(email: params[:email])
        if @player && @player.authenticate(params[:password])
          token = JsonWebToken.encode(player_id: @player.id)
          time = Time.now + 24.hours.to_i
          response.headers['Authorization'] = "Bearer #{token}"
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                         playername: @player.playername, type: @player.type_player, company: @player.company}, status: :ok
        else
          json_response(error: 'unauthorized' , status: :unauthorized)
        end
      end
    end
  private

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def login_params
    params.require(:player).permit(:email, :password)
  end

end
