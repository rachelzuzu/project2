class EntriesController < ApplicationController
	before_action :authenticate_user!

  def user
  	@user = User.find(params[:id])
  end

  def index
    @entries = Entry.all
    @entry = Entry.new

    respond_to do |format|
      format.html
      format.json { render json: @entries }
    end
  end
	
	def show
	end

	def new
	end

	def edit
	end

  def create

    @entry = Entry.create(params.require(:entry).permit(:food))

    respond_to do |f| 
      f.html
      f.json { render json: @entry }
    end

  end

  def update
    # find the `entry`
    @entry = Entry.find(params[:id])
    # update the entry
    @entry.update_attributes(params.require(:entry).permit(:completed, :food))
    # then respond to format

    respond_to do |format|
      format.html
      format.json { render json: @entry }
    end
  end

  def destroy
    # find the `entry`
    entry = Entry.find(params[:id])
    # delete the `entry`
    entry.destroy()

    respond_to do |format|
      format.html { redirect_to entries_path }
      format.json { render json: nil, status: 200 }
    end
  end

	private
		def entry_params
			params.require(:entry).permit(:title, :text)
		end

end
