# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Peter.Repo.insert!(%Peter.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Seed user

Peter.Repo.insert!(%Peter.User{email: "bonjour@anthonyguimard.fr", name: "Anthony", password_hash: Comeonin.Bcrypt.hashpwsalt(System.get_env("PETER_USER_PASSWORD"))})
