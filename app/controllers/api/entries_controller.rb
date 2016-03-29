module Api
  class EntriesController < ApplicationController
    def index
      render json: Entry.all.order("created_at desc")
    end

    def show
      entry = Entry.includes([:authors, :links, :categories]).first
      res = entry.attributes.compact
      res[:authors] = entry.authors
      res[:links] = entry.links
      res[:enclosure_link] = entry.enclosure_link
      res[:related_links] = entry.related_links
      res[:categories] = entry.categories
      render json: res
    end
  end
end
