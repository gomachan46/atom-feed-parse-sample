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

    link = Link.new(
        rel: atom.entries.first.links.first.rel,
        type: atom.entries.first.links.first.type,
        length: atom.entries.first.links.first.length,
        href: atom.entries.first.links.first.href,
        title: atom.entries.first.links.first.title
    )

    entry_author = EntryAuthor.new(entry: entry, author: author)
    entry_category = EntryCategory.new(entry: entry, category: Category.find_by_term(atom.entries.first.category.term))
    entry_link = EntryLink.new(entry: entry, link: link)

    feed.save!
    entry.save!
    author.save!
    link.save!
    entry_author.save!
    entry_category.save!
    entry_link.save!
  end
end
