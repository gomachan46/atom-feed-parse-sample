class SamplesController < ApplicationController
  def index
    @entry = JSON.parse(sample_response)
  end

  def sample_response
    entry = Entry.includes([:authors, :links, :category]).first
    res = entry.attributes.compact
    res[:authors] = entry.authors
    res[:links] = entry.links
    res[:category] = entry.category
    res[:enclosure_link] = entry.enclosure_link
    res[:related_links] = entry.related_links

    res.to_json
  end
end
