class AuthenticationController < ApplicationController

    def login
      if params[:email].nil?
        json_response(error: 'email is required' , status: :unauthorized)
      else
        @player = Player.find_by(email: params[:email])
        puts @player, 'player'
        if @player&.authenticate(params[:password])
          puts @player, 'player'
          token = JsonWebToken.encode(player_id: @player.id)
          time = Time.now + 24.hours.to_i
          @token = "Bearer #{token}"
          response.headers['Authorization'] = @token
          session[:Authorization] = @token
          puts response.headers['Authorization'], 'response'
          redirect_to "/characters/new"
          else
            json_response(error: 'Invalid email or password', status: :unauthorized)
            format.turbo_stream { render :form }
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
