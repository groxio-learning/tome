import Ecto.Query
Tome.Repo.delete_all(Tome.Feedback.Rating)
Tome.Repo.delete_all(Tome.Library.Book)
now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

fields = [
  {"Designing Elixir Systems with OTP", "9781680506617",  "Learn some OTP", 
      ~D[2019-12-01], "published"}, 
  {"Progamming Ecto", "9781680502824", "Learn some Ecto", 
    ~D[2019-04-01], "published"}, 
  {"Progamming Phoenix LiveView", "9781680508215", "Learn some LiveView", 
    nil, "beta"}
]

books = 
  Enum.map(fields, fn {title, isbn, desc, published, status} -> 
    %{title: title, isbn: isbn, description: desc, status: status, 
    published_on: published, inserted_at: now, updated_at: now}
  end)

Tome.Repo.insert_all(Tome.Library.Book, books)

book_ids = Tome.Repo.all(from b in Tome.Library.Book, select: b.id)

ratings = 
  for _i <- 1..100 do
    random_seconds_ago = -1 * :random.uniform(100 * 24 * 60 * 60)
    time = NaiveDateTime.add(now, random_seconds_ago)
      %{
        inserted_at: time, 
        updated_at: time, 
        book_id: Enum.random(book_ids), 
        stars: :random.uniform(5)
      }
    end

  Tome.Repo.insert_all(Tome.Feedback.Rating, ratings)
  
