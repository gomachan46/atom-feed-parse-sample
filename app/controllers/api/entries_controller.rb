module Api
  class EntriesController < ApplicationController
    def index
      render json: Entry.all
    end

    def show
      render json: Entry.first
    end
  end
end
