class Api::V1::SessionsController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        if @user
            @session = Session.new(user: @user)
            @session.save!
            render json: @session
        else
            render json: { error: 'Unable to log in as User' }, status: 400
        end
    end

end
