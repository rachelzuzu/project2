class ReportsController < ApplicationController
  #before_action :set_report, only: [ :edit, :update, :destroy]

  def index
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

  def show
    report = params[:q]
    if report 
      resp = Typhoeus.get(
        "http://api.nal.usda.gov/usda/ndb/reports",
        params: {
        format: "json",
        ndbno: report,
        type: "b",
        api_key: "bT0Q1R0Js9aaOsjTR9ro6Oax1y21Wg2J8fmr74Vc"
        }
      )
      @food = JSON.parse(resp.body)["report"]
    else
      @food = {}
    end
  end

  def create
    # @entry = Entry.find(params[:entry_id])


    # params = {"entry": {
      # { unit": "blah", "protine": "12" }
    # }

    puts params
    # smoke test
    # add one hidden fields
    # put the params variable and look at it in the server
    # add the rest of the hidden fields
    # look at params
    # add entry_id to params
    # @report = @entry.reports.create(params)
    # redirect_to [@entry, "/entries/:entry_id"]
  end

  private

  def report_params
    params.require(@food).permit(:name)
  end
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_report
  #     @report = Report.find(params[:id])
  #   end

end
