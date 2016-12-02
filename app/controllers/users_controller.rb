class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
         @user = User.find(params[:id])
         @order = Order.find_by(params[:user_id])
        
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            @order = Order.new(user_id: @user.id)
            @order.save
            session[:user_id] = @user.id
            redirect_to @user, notice: "Thanks for signing up!"
        else
            render :new
        end 
    end

private

    def user_params
        params.require(:user).
        permit(:name, :email, :password, :password_confirmation)
    end
end
