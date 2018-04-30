defmodule Api.SisselTest do
  use Api.DataCase

  alias Api.Sissel

  describe "sections" do
    alias Api.Sissel.Section

    @valid_attrs %{content: "some content", page: "some page", title: "some title"}
    @update_attrs %{content: "some updated content", page: "some updated page", title: "some updated title"}
    @invalid_attrs %{content: nil, page: nil, title: nil}

    def section_fixture(attrs \\ %{}) do
      {:ok, section} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sissel.create_section()

      section
    end

    test "list_sections/0 returns all sections" do
      section = section_fixture()
      assert Sissel.list_sections() == [section]
    end

    test "get_section!/1 returns the section with given id" do
      section = section_fixture()
      assert Sissel.get_section!(section.id) == section
    end

    test "create_section/1 with valid data creates a section" do
      assert {:ok, %Section{} = section} = Sissel.create_section(@valid_attrs)
      assert section.content == "some content"
      assert section.page == "some page"
      assert section.title == "some title"
    end

    test "create_section/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sissel.create_section(@invalid_attrs)
    end

    test "update_section/2 with valid data updates the section" do
      section = section_fixture()
      assert {:ok, section} = Sissel.update_section(section, @update_attrs)
      assert %Section{} = section
      assert section.content == "some updated content"
      assert section.page == "some updated page"
      assert section.title == "some updated title"
    end

    test "update_section/2 with invalid data returns error changeset" do
      section = section_fixture()
      assert {:error, %Ecto.Changeset{}} = Sissel.update_section(section, @invalid_attrs)
      assert section == Sissel.get_section!(section.id)
    end

    test "delete_section/1 deletes the section" do
      section = section_fixture()
      assert {:ok, %Section{}} = Sissel.delete_section(section)
      assert_raise Ecto.NoResultsError, fn -> Sissel.get_section!(section.id) end
    end

    test "change_section/1 returns a section changeset" do
      section = section_fixture()
      assert %Ecto.Changeset{} = Sissel.change_section(section)
    end
  end
end
