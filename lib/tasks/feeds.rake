namespace :feeds do
  desc "feed import"

  task :import => :environment do
    xml = File.open("./atom.xml").read
    atom = RSS::Parser.parse xml

    feed = Feed.new(
        title: atom.title.content,
        guid: atom.id.content,
        created_at: atom.updated.content,
        updated_at: atom.updated.content
    )

    entry = Entry.new(
        title: atom.entries.first.title.content,
        guid: atom.entries.first.id.content,
        summary: atom.entries.first.summary.content,
        content: atom.entries.first.content.content,
        feed: feed,
        created_at: atom.entries.first.updated.content,
        updated_at: atom.entries.first.updated.content
    )

    author = Author.new(name: atom.entries.first.authors.first.name.content)

    feed.save!
    entry.save!
    author.save!
  end
end
