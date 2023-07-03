defmodule EctoShortsRecursiveFilteringTest.Repo.Migrations.AddTables do
  use Ecto.Migration

  def change do

    create table(:companies) do
      add :name, :string

      timestamps
    end

    create table(:users) do
      add :name, :string
      add :company_id, references(:companies)

      timestamps
    end

    create table(:categories) do
      add :name, :string

      timestamps
    end

    create table(:posts) do
      add :content, :string
      add :user_id, references(:users)
      add :category_id, references(:categories)

      timestamps
    end
  end
end
