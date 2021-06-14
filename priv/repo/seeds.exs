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