defmodule Tome.Feedback.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ratings" do
    field :stars, :integer
    
    timestamps()
    belongs_to :book, Tome.Library.Book
  end
  
  def new(book) do
    Ecto.build_assoc(book, :ratings)
  end
  
  def changeset(rating, params \\ %{}) do
    rating
      |> cast(params, [:stars, :book_id]) 
      |> validate_required([:stars, :book_id])
  end
end