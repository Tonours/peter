defmodule Peter.Router do
  use Peter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :auth do
    plug Guardian.Plug.EnsureAuthenticated, handler: Peter.AuthHandler
  end

  scope "/admin", Peter.Admin, as: :admin do
    pipe_through [:browser, :browser_session, :auth]

    get "/pages", PageController, :index
    resources "/repliques", RepliqueController
  end

  scope "/", Peter do
    pipe_through :browser

    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    get "/", PageController, :index
  end

  scope "/api", Peter do
    pipe_through :api

    scope "v1" do
      resources "/repliques", RepliqueController, only: [:index, :show]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Peter do
  #   pipe_through :api
  # end
end
