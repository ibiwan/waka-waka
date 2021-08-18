class ApplicationController < ActionController::API
    def current_user
        @pattern = /^Bearer (.*)/
        @session_id_match = request.authorization.match @pattern
        return unless @session_id_match

        @session_id = @session_id_match[1]
        @session = Session.find(@session_id)
        return unless @session

        @current_user ||= User.find(@session[:user_id])
    end
end
