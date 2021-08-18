class Api::V1::UsersController < ApplicationController
    def show
    end

    def create
        @existing = User.find_by(email: user_create_params[:email])
        if @existing
            render json: { error: 'User with that Email already exists' , status: 400 }, status: 400
            return
        end

        @user = User.new(user_create_params)
        if @user.save
            render json: @user
        else
            render json: { error: 'Unable to create User' }, status: 400
        end
    end


    def update
    end

    def user_create_params
        @create_params ||= params.require(:user).permit(:email, :name)
    end
end
