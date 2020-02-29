class AuthenticationController < ApplicationController
    def login
        @user = User.find_by(username: params[:username])

        if !@user 
            render json: {message: "Not today bitch"}, status: :unauthorized
        else 
            if !@user.authenticate(params[:password])
                render json: {message: "SIKKKEEE"}, status: :unauthorized
            else 
                payload = {id: @user.id}
                secret = Rails.application.secret_key_base
                token = JWT.encode(payload, secret)

                render json: {token: token}
            end
        end
    end
end
