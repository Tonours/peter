defmodule Peter.RepliqueImage do
  use Arc.Definition
  use Arc.Ecto.Definition

  # Include ecto support (requires package arc_ecto installed):
  # use Arc.Ecto.Definition

  @versions [:original, :thumb]

  # To add a thumbnail version:
  # @versions [:original, :thumb]

  # Whitelist file extensions:
  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 250x250^ -gravity center -extent 250x250 -format png", :png}
  end

  # Override the persisted filenames:
  def filename(version, {file}) do
    file_name =
      Path.basename(file.file_name, Path.extname(file.file_name))
      |> String.normalize(:nfd)
      |> String.replace(~r/[^A-z\s]/u, "")
      |> String.replace(~r/\s/, "-")

    hash = Base.encode64(file_name)

    "#{version}_#{file_name}_#{hash}"
  end

  # Override the storage directory:
  def storage_dir() do
    "medias/repliques/images"
  end

end
