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

    atom.entries.each do |e|
      entry = Entry.new(
          title: e.title.content,
          guid: e.id.content,
          summary: e.summary.content,
          content: e.content.content,
          feed: feed,
          created_at: e.updated.content,
          updated_at: e.updated.content
      )

      authors = e.authors.map do |author|
        Author.new(name: author.name.content)
      end
      links = e.links.map do |link|
        Link.new(
          rel: link.rel,
          type: link.type,
          length: link.length,
          href: link.href,
          title: link.title
        )
      end

      entry_authors = authors.map do |author|
        EntryAuthor.new(entry: entry, author: author)
      end
      entry_links = links.map do |link|
        EntryLink.new(entry: entry, link: link)
      end
      entry_categories = e.categories.map do |category|
        EntryCategory.new(entry: entry, category: Category.find_by_term(category.term))
      end

      feed.save!
      entry.save!

      authors.each { |author| author.save! }
      links.each { |link| link.save! }

      entry_authors.each { |ea| ea.save! }
      entry_links.each { |el| el.save! }
      entry_categories.each { |ec| ec.save! }
    end
  end
end
