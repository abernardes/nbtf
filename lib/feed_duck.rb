class FeedDuck
  def map_feed(feed)
    if feed.is_a?(RSS::Rss)
      map_rss(feed.items)
    else
      map_atom(feed.entries)
    end
  end

  private

  def map_rss(entries)
    entries.map do |entry|
      {
        author: entry.author,
        published_at: entry.pubDate,
        title: entry.title,
        content: entry.description,
        url: entry.link,
        id: entry.guid.content
      }
    end
  end

  def map_atom(entries)
    entries.map do |entry|
      {
        author: entry.author.name.content,
        published_at: entry.updated.content,
        title: entry.title.content,
        content: entry.content.content,
        url: entry.link.href,
        id: entry.id.content
      }
    end
  end
end
