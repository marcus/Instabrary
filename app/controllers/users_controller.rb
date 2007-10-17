class UsersController < ApplicationController
  # render new.rhtml
  def new
  end

  def create
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    redirect_back_or_default('/')
    flash[:notice] = "Thanks for signing up! You're logged in now. To log in again you'll need to click the link that was sent to you by email."
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    #@user = User.find(params[:id])
    @user = User.find(session[:user])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end
  
  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Your profile was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  def activate
    self.current_user = User.find_by_activation_code(params[:id])
    if logged_in? && !current_user.activated?
      current_user.activate
      flash[:notice] = "Thanks! Your registration is complete!"
    end
    redirect_back_or_default('/')
  end

end
