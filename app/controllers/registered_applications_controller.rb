class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    
    @events = @registered_application.events.group_by(&:name)
  end

  def new
     @registered_application = RegisteredApplication.new
  end


  def create
      @registered_application = RegisteredApplication.new(params.require(:registered_application).permit(:name, :url))
     if @registered_application.save
       flash[:notice] = "Registered application was saved."
       redirect_to registered_applications_path
     else
       flash[:error] = "There was an error saving the registered application. Please try again."
       render :new
     end
   end

  def edit
      @registered_application = RegisteredApplication.find(params[:id])

     
  end

  def update
      @registered_application = RegisteredApplication.find(params[:id])
       if @registered_application.update_attributes(params.require(:registered_application).permit(:name, :url))
       flash[:notice] = "Registered application was saved."
       redirect_to registered_applications_path
     else
       flash[:error] = "There was an error saving the registered application. Please try again."
       render :edit
     end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])

    if @registered_application.destroy
       flash[:notice] = "Registered application was saved."
       redirect_to @registered_application
     else
       flash[:error] = "There was an error saving the registered application. Please try again."
       render :index
     end

  end
end
