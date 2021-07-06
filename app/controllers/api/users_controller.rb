class Api::UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            render :show
        else
            render json: @user.errors.full_messages, status: 402
        end
    end

    def show
        render :show
    end

    def user_params
        params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :zipcode)
    end
end