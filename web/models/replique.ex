defmodule Peter.Replique do
  use Peter.Web, :model
  use Arc.Ecto.Schema

  schema "repliques" do
    field :title, :string
    field :description, :string
    field :image, Peter.RepliqueImage.Type
    field :song, Peter.RepliqueSong.Type
    field :video, Peter.RepliqueVideo.Type
    field :published, :boolean, default: false

    timestamps()
  end

  @required_fields ~w(title description published)
  @optional_fields ~w()

  @required_file_fields ~w(image video song)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ :invalid) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, @required_file_fields, @optional_file_fields)
  end
end
