defmodule Schemas.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    timestamps
  end

  @available_fields [:name]

  def create_changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, @available_fields)
    |> validate_required(@available_fields)
  end
end
