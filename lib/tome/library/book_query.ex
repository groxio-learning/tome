defmodule Tome.Library.BookQuery do
  import Ecto.Query, only: [from: 2]
  alias Tome.Library.Book
  
  # def new, do: Book
  
  def new do
    from b in Book, 
    where: b.status != "deleted"
  end
  
  def published(query) do
    from b in query, 
    where: b.status == "published"
  end

  def beta(query) do
    from b in query, 
    where: b.status == "beta"
  end
  
  def recent(query, date \\ Date.add(Date.utc_today(), -14)) do
    from b in query, 
    where: b.published_on <= ^date
  end
  
  def as_title_tuples(query) do
    from b in query, 
    select: {b.id, b.title}, 
    order_by: [asc: b.title]
  end
end