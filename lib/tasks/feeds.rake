namespace :feeds do
  desc "feed import"

  task :import => :environment do
    xml = File.open("./atom.xml").read
    atom = RSS::Parser.parse xml

    feed = Feed.new(title: atom.title.content, guid: atom.id.content, created_at: atom.updated.content, updated_at: atom.updated.content)
    feed.save!
  end
end
