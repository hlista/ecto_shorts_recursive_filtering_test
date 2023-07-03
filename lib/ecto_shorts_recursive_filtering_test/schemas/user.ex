defmodule Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    belongs_to :company, Schemas.Company
    has_many :posts, Schemas.Post
    timestamps
  end

  @available_fields [:name, :company_id]

  def create_changeset(params) do
    changeset(%__MODULE__{}, params)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @available_fields)
    |> validate_required(@available_fields)
  end
end
