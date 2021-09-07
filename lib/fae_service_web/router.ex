defmodule FaeServiceWeb.Router do
  use FaeServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/api", FaeServiceWeb do
    pipe_through :api
    resources "/businesses", BusinessController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery, :browser]
      live_dashboard "/dashboard", metrics: FaeServiceWeb.Telemetry
    end
  end
end
