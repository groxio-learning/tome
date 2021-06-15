defmodule Tome.Repo.Migrations.CreateRatings do
  use Ecto.Migration

  def change do
    create table(:ratings) do
      add :stars, :integer
      add :book_id, references(:books)
      
      timestamps()
    end
  end
end
