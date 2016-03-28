module Api
  class EntriesController < ApplicationController
    def index
      render json: Entry.all
    end

    def show
      entry = Entry.includes([:authors, :links, :category]).first
      res = entry.attributes.compact
      res[:authors] = entry.authors
      res[:links] = entry.links
      res[:enclosure_link] = entry.enclosure_link
      res[:related_links] = entry.related_links
      res[:category] = entry.category
      render json: res
    end
  end
end
