defmodule Api.WebsitesTest do
  use Api.DataCase

  alias Api.Websites

  describe "pages" do
    alias Api.Websites.Page

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def page_fixture(attrs \\ %{}) do
      {:ok, page} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Websites.create_page()

      page
    end

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Websites.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Websites.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      assert {:ok, %Page{} = page} = Websites.create_page(@valid_attrs)
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Websites.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      assert {:ok, page} = Websites.update_page(page, @update_attrs)
      assert %Page{} = page
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Websites.update_page(page, @invalid_attrs)
      assert page == Websites.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Websites.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Websites.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Websites.change_page(page)
    end
  end

  describe "components" do
    alias Api.Websites.Component

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def component_fixture(attrs \\ %{}) do
      {:ok, component} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Websites.create_component()

      component
    end

    test "list_components/0 returns all components" do
      component = component_fixture()
      assert Websites.list_components() == [component]
    end

    test "get_component!/1 returns the component with given id" do
      component = component_fixture()
      assert Websites.get_component!(component.id) == component
    end

    test "create_component/1 with valid data creates a component" do
      assert {:ok, %Component{} = component} = Websites.create_component(@valid_attrs)
    end

    test "create_component/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Websites.create_component(@invalid_attrs)
    end

    test "update_component/2 with valid data updates the component" do
      component = component_fixture()
      assert {:ok, component} = Websites.update_component(component, @update_attrs)
      assert %Component{} = component
    end

    test "update_component/2 with invalid data returns error changeset" do
      component = component_fixture()
      assert {:error, %Ecto.Changeset{}} = Websites.update_component(component, @invalid_attrs)
      assert component == Websites.get_component!(component.id)
    end

    test "delete_component/1 deletes the component" do
      component = component_fixture()
      assert {:ok, %Component{}} = Websites.delete_component(component)
      assert_raise Ecto.NoResultsError, fn -> Websites.get_component!(component.id) end
    end

    test "change_component/1 returns a component changeset" do
      component = component_fixture()
      assert %Ecto.Changeset{} = Websites.change_component(component)
    end
  end

  describe "assets" do
    alias Api.Websites.Asset

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def asset_fixture(attrs \\ %{}) do
      {:ok, asset} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Websites.create_asset()

      asset
    end

    test "list_assets/0 returns all assets" do
      asset = asset_fixture()
      assert Websites.list_assets() == [asset]
    end

    test "get_asset!/1 returns the asset with given id" do
      asset = asset_fixture()
      assert Websites.get_asset!(asset.id) == asset
    end

    test "create_asset/1 with valid data creates a asset" do
      assert {:ok, %Asset{} = asset} = Websites.create_asset(@valid_attrs)
    end

    test "create_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Websites.create_asset(@invalid_attrs)
    end

    test "update_asset/2 with valid data updates the asset" do
      asset = asset_fixture()
      assert {:ok, asset} = Websites.update_asset(asset, @update_attrs)
      assert %Asset{} = asset
    end

    test "update_asset/2 with invalid data returns error changeset" do
      asset = asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Websites.update_asset(asset, @invalid_attrs)
      assert asset == Websites.get_asset!(asset.id)
    end

    test "delete_asset/1 deletes the asset" do
      asset = asset_fixture()
      assert {:ok, %Asset{}} = Websites.delete_asset(asset)
      assert_raise Ecto.NoResultsError, fn -> Websites.get_asset!(asset.id) end
    end

    test "change_asset/1 returns a asset changeset" do
      asset = asset_fixture()
      assert %Ecto.Changeset{} = Websites.change_asset(asset)
    end
  end
end
