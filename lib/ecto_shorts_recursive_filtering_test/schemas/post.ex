defmodule Schemas.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    belongs_to :user, Schemas.User
    belongs_to :category, Schemas.Category
    timestamps
  end

  @available_fields [:content, :user_id, :category_id]

  def create_changeset(params) do
    changeset(%Schemas.Post{}, params)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, @available_fields)
    |> validate_required(@available_fields)
  end
end
