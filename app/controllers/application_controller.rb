
class ApplicationController < ActionController::Base

    skip_before_action :verify_authenticity_token

    def not_found
        render json: { error: 'not_found' }
      end
    
      def authorize_request
        header = cookies[:Authorization]
        if header
          header_parts = header.split(' ')
          if header_parts.length == 2 && header_parts[0] == 'Bearer'
            token = header_parts[1]
            begin
              @decoded = JsonWebToken.decode(token)
              if @decoded
                 @current_user = @decoded
                 @current_player_id = @current_user['player_id']['$oid']
              else
                render json: {errors: 'Token is invalid'}, status: :unauthorized
                puts 'Token is invalid'
              end
            rescue ActiveRecord::RecordNotFound => e
              render json: { errors: e.message }, status: :unauthorized
              puts e.message
            rescue JWT::DecodeError => e
              render json: { errors: e.message }, status: :unauthorized
              puts e.message
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
