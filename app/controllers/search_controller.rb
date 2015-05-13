class SearchController < ApplicationController
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

  def report
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
end
