namespace :feeds do
  desc "feed import"

  task :import => :environment do
    xml = File.open("./atom.xml").read
    feed = RSS::Parser.parse xml
    puts feed.entries.first.category.term
  end
end
