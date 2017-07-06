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

  pipeline :admin_layout do
    plug :put_layout, {Peter.LayoutView, :admin}
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :auth do
    plug Guardian.Plug.EnsureAuthenticated, handler: Peter.AuthHandler
  end


  scope "/", Peter do
    pipe_through :browser

    get "/", PageController, :index

  end

  scope "/sessions", Peter do
    pipe_through [:browser, :admin_layout]

    resources "/", SessionController, only: [:new, :create, :delete]
  end

  scope "/admin", Peter.Admin, as: :admin do
    pipe_through [:browser, :browser_session, :auth, :admin_layout]

    get "/", PageController, :index
    resources "/repliques", RepliqueController
  end

  scope "/api", Peter do
    pipe_through :api

    scope "/v1" do
      resources "/repliques", RepliqueController, only: [:index, :show]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Peter do
  #   pipe_through :api
  # end
end
