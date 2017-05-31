defmodule Peter.Replique do
  use Peter.Web, :model

  schema "repliques" do
    field :title, :string
    field :description, :string
    field :image, :string
    field :song, :string
    field :video, :string
    field :published, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :image, :song, :video, :published])
    |> validate_required([:title, :description, :image, :song, :video, :published])
  end
end
