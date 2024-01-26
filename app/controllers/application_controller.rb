class ApplicationController < ActionController::Base
    
    skip_before_action :verify_authenticity_token
    def not_found
        render json: { error: 'not_found' }
      end
    
      def authorize_request
        header = request.headers['Authorization']
        if header
          header_parts = header.split(' ')
          if header_parts.length == 2 && header_parts[0] == 'Bearer'
            token = header_parts[1]
            puts token, 'token'
            begin
              @decoded = JsonWebToken.decode(token)
              puts @decoded, 'decoded'
              if @decoded
                decode_id_player = @decoded[:player_id]
                @current_player = Player.find(decode_id_player)
              else
                render json: {errors: 'Token is invalid'}, status: :unauthorized
              end
            rescue ActiveRecord::RecordNotFound => e
              render json: { errors: e.message }, status: :unauthorized
            rescue JWT::DecodeError => e
              render json: { errors: e.message }, status: :unauthorized
            end
          else
            render json: { errors: 'Invalid Authorization header format. Expected "Bearer token"' }, status: :unauthorized
          end
        else
          render json: { errors: 'Missing Authorization header' }, status: :unauthorized
        end
      end

      private

      def json_response(object, status = :ok)
        render json: object, status: status
      end


end
