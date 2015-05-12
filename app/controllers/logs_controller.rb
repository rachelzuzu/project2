class LogsController < ApplicationController
	

	def index
		@log=Log.new
	end
	
	def show
		# i want to show logs/3; its a url parameter; rake routes shows :id
		@log=Log.find(params[:id])
	end

	def new
	end

	def edit
		@log=Log.find(params[:id])
	end

	def create
		# calling :kind through log_params
		@log = current_user.logs.new(log_params)
		# saving the log in the database
	    if @log.save
	      redirect_to user_log_path(current_user, @log)
	    else
	      render 'new'
	    end
	end

	def update
	end

    def destroy
    	@log=Log.find(params[:id])
    	@log.destroy
    		redirect_to user_logs_path(current_user)
    	end

	
	# cannot call log_params in a route, unless im in the log controller; to keep it dry
	private
		def log_params
			params.require(:log).permit(:kind)
		end
end
