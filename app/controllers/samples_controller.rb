class SamplesController < ApplicationController
  def index
    @entries = Entry.all.order("created_at desc").as_json
  end

  def show
    @entry = JSON.parse(sample_response(params[:id]))
  end

  def sample_response(id)
    entry = Entry.includes([:authors, :links, :categories]).find(id)
    res = entry.attributes.compact
    res[:authors] = entry.authors
    res[:links] = entry.links
    res[:categories] = entry.categories
    res[:enclosure_link] = entry.enclosure_link
    res[:related_links] = entry.related_links

    res.to_json
  end
end
