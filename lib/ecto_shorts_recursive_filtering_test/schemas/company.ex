defmodule Schemas.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :name, :string
    has_many :users, Schemas.User
    timestamps
  end

  @available_fields [:name]

  def create_changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, @available_fields)
    |> validate_required(@available_fields)
  end
end
