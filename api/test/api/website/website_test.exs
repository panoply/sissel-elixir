defmodule Api.WebsiteTest do
  use Api.DataCase

  alias Api.Website

  describe "codes" do
    alias Api.Website.Code

    @valid_attrs %{code: "some code", description: "some description", title: "some title", type: "some type"}
    @update_attrs %{code: "some updated code", description: "some updated description", title: "some updated title", type: "some updated type"}
    @invalid_attrs %{code: nil, description: nil, title: nil, type: nil}

    def code_fixture(attrs \\ %{}) do
      {:ok, code} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Website.create_code()

      code
    end

    test "list_codes/0 returns all codes" do
      code = code_fixture()
      assert Website.list_codes() == [code]
    end

    test "get_code!/1 returns the code with given id" do
      code = code_fixture()
      assert Website.get_code!(code.id) == code
    end

    test "create_code/1 with valid data creates a code" do
      assert {:ok, %Code{} = code} = Website.create_code(@valid_attrs)
      assert code.code == "some code"
      assert code.description == "some description"
      assert code.title == "some title"
      assert code.type == "some type"
    end

    test "create_code/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Website.create_code(@invalid_attrs)
    end

    test "update_code/2 with valid data updates the code" do
      code = code_fixture()
      assert {:ok, code} = Website.update_code(code, @update_attrs)
      assert %Code{} = code
      assert code.code == "some updated code"
      assert code.description == "some updated description"
      assert code.title == "some updated title"
      assert code.type == "some updated type"
    end

    test "update_code/2 with invalid data returns error changeset" do
      code = code_fixture()
      assert {:error, %Ecto.Changeset{}} = Website.update_code(code, @invalid_attrs)
      assert code == Website.get_code!(code.id)
    end

    test "delete_code/1 deletes the code" do
      code = code_fixture()
      assert {:ok, %Code{}} = Website.delete_code(code)
      assert_raise Ecto.NoResultsError, fn -> Website.get_code!(code.id) end
    end

    test "change_code/1 returns a code changeset" do
      code = code_fixture()
      assert %Ecto.Changeset{} = Website.change_code(code)
    end
  end
end
