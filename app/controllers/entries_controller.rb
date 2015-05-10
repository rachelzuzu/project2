class EntriesController < ApplicationController
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def index
    # @entries = current_user.entries
    @entries = Entry.all
    respond_to do |format|
      format.html
      format.json { render json: @entries }
    end
  end
	
	def show
    # find the article we are interested in
    # pass in params[:id] to get :id parameter from request
    # @ is an instance variable to hold a reference to the entry object
    @entry = Entry.find(params[:id])
	end

	def new
    @entry=Entry.new
	end

	def edit
    @entry=Entry.find(params[:id])
	end

  def create
    @entry = Entry.new(entry_params)
# saving the model in the database
    if @entry.save
      # create a new entry, if the entry saves 
      # we add it to current_user entries
      current_user.entries << @entry
      redirect_to entries_path
    else
      render 'new'
    end
  end

  def update
    @entry = Entry.find(params[:id])
   
    if @entry.update(entry_params)
      redirect_to @entry
    else
      render 'edit'
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    redirect_to entries_path
  end

# made private to make sure it can't be called outside its intended context
	private
		def entry_params
			params.require(:entry).permit(:date, :food, :mood, :avatar)
		end

end
