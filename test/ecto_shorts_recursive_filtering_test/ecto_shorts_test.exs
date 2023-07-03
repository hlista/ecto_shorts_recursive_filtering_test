defmodule EctoShortsRecursiveFilteringTest.EctoShortsTest do
  use EctoShortsRecursiveFilteringTestWeb.ConnCase, async: true
  alias EctoShorts.Actions

  setup do
    {:ok, television} = Actions.create(Schemas.Category, %{name: "Television"})

    {:ok, company_one} = Actions.create(Schemas.Company, %{name: "company one"})

    {:ok, max} = Actions.create(Schemas.User, %{company_id: company_one.id, name: "Max"})

    Actions.create(Schemas.Post, %{user_id: max.id, content: "post 1", category_id: television.id})
    Actions.create(Schemas.Post, %{user_id: max.id, content: "post 2", category_id: television.id})
    Actions.create(Schemas.Post, %{user_id: max.id, content: "post 3", category_id: television.id})
    Actions.create(Schemas.Post, %{user_id: max.id, content: "post 4", category_id: television.id})
    :ok
  end

  test "query for users that have posted in the television catgory, will return duplicates", context do
    IO.inspect Actions.all(Schemas.User, %{
      posts: %{
        category: %{
          name: "Television"
        }
      }
    })

    IO.inspect EctoShorts.CommonFilters.convert_params_to_filter(
      Schemas.User, %{
        posts: %{
          category: %{
            name: "Television"
          }
        }
      }
    )
  end
end
