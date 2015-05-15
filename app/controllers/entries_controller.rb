class EntriesController < ApplicationController
	# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
 
  def index
    # to reference, entries are tied to log id, so reference log_id as in rake routes
    # so you can find log in your entries index view
    @log=Log.find(params[:log_id])

    respond_to do |format|
      format.html
      format.json { render json: @log.entries }
    end
  end
	
	def show
    if params[:q]
      #TODO REFACTOR TO ENTRY MODEL
      search = params[:q]
      if search
        resp = Typhoeus.get(
          "http://api.nal.usda.gov/usda/ndb/search",
          params: {
          format: "json",
          q: search,
          sort: "n",
          max: 30,
          offset: 0,
          api_key: "bT0Q1R0Js9aaOsjTR9ro6Oax1y21Wg2J8fmr74Vc"
          }
        )
        @foods = JSON.parse(resp.body)["list"]["item"]
      else 
        @foods = []
      end
    end
    @user = current_user
    # find the article we are interested in
    # pass in params[:id] to get :id parameter from request
    # @ is an instance variable to hold a reference to the entry object
    @entry = Entry.find(params[:id])
	end

	def new
    @entry=Entry.new
    @log=Log.find(params[:log_id])
	end

	def edit
    @entry=Entry.find(params[:id])
    @log=Log.find(params[:log_id])
	end

  def create
    @log=Log.find(params[:log_id])
    # @food_details = Entry.get_food_details(params[:ndbno_id])
    @entry = @log.entries.new(entry_params)

  # def self.get_details(ndbno_id)
  #   resp = Typhoeus.get(
  #       "http://api.nal.usda.gov/usda/ndb/reports",
  #       params: {
  #         format: "json",
  #         ndbno: nbdno_id,
  #         type: "b",
  #         api_key: "bT0Q1R0Js9aaOsjTR9ro6Oax1y21Wg2J8fmr74Vc"
  #       }
  #     )
  #   @food = JSON.parse(resp.body)["report"]
  #   return @food
  # end

# saving the model in the database
    if @entry.save
      redirect_to user_log_entry_path(current_user, @entry.log, @entry)
    else
      render 'new'
    end
  end

  def update
    @entry = Entry.find(params[:id])

    if params[:ndbno].present?
      resp = Typhoeus.get(
        "http://api.nal.usda.gov/usda/ndb/reports",
        params: {
        format: "json",
        ndbno: params[:ndbno],
        type: "b",
        api_key: "bT0Q1R0Js9aaOsjTR9ro6Oax1y21Wg2J8fmr74Vc"
        }
      )
      @food = JSON.parse(resp.body)["report"]

      @report = @entry.reports.new

      @report.name = @food["food"]["name"]
      @report.ndbno = params[:ndbno]
      @report.kcal = @food["food"]["nutrients"][1]["measures"][0]["value"]
      @report.protein = @food["food"]["nutrients"][2]["measures"][0]["value"]
      @report.fat = @food["food"]["nutrients"][3]["measures"][0]["value"]
      @report.carb = @food["food"]["nutrients"][4]["measures"][0]["value"]

      @report.save
      
      redirect_to @entry  
    end

    unless params[:ndbno].present?
      if @entry.update(entry_params)
        # redirect back to the show page with the way our routes are nested
        # @entry.log can also be params[:log_id]
        redirect_to user_log_entry_path(current_user, @entry.log, @entry)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

      redirect_to user_log_path(current_user, @entry.log)
  end

# made private to make sure it can't be called outside its intended context
	private
		def entry_params
			params.require(:entry).permit(:date, :food, :mood, :avatar)
		end

end
