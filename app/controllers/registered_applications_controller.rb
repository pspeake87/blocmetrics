class RegisteredApplicationsController < ApplicationController
  def index
    
    
  if current_user
  @user = current_user
    
  @registered_applications = @user.registered_applications.all
else
end
  
  end

  def show
    @user = current_user
    @registered_application = @user.registered_applications.find(params[:id])
    
    @events = @registered_application.events.group_by(&:name)
  end

  def new
     @registered_application = RegisteredApplication.new
  end


  def create
      @user = current_user
      @registered_application = @user.registered_applications.build(params.require(:registered_application).permit(:name, :url))
     if @registered_application.save
       flash[:notice] = "Registered application was saved."
       redirect_to registered_applications_path
     else
       flash[:error] = "There was an error saving the registered application. Please try again."
       render :new
     end
   end

  def edit
      @user = current_user
      @registered_application = @user.registered_applications.find(params[:id])

     
  end

  def update
      @user = current_user
      @registered_application = @user.registered_applications.find(params[:id])
       if @registered_application.update_attributes(params.require(:registered_application).permit(:name, :url))
       flash[:notice] = "Registered application was saved."
       redirect_to registered_applications_path
     else
       flash[:error] = "There was an error saving the registered application. Please try again."
       render :edit
     end
  end

  def destroy
    @user = current_user
    @registered_application = @user.registered_applications.find(params[:id])

    if @registered_application.destroy
       flash[:notice] = "Registered application was saved."
       redirect_to @registered_application
     else
       flash[:error] = "There was an error saving the registered application. Please try again."
       render :index
     end

  end
end
