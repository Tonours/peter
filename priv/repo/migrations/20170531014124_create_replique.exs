defmodule Peter.Repo.Migrations.CreateReplique do
  use Ecto.Migration

  def change do
    create table(:repliques) do
      add :title, :string
      add :description, :text
      add :image, :string
      add :song, :string
      add :video, :string
      add :published, :boolean, default: false, null: false

      timestamps()
    end

  end
end
