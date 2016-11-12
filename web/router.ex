defmodule Peepchat.Router do
  use Peepchat.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", Peepchat do
    pipe_through :api

    # Registration
    post "/register", RegistrationController, :create
    
    # Route stuff to our SessionController
    # resources "/session", SessionController, only: [:index]

    # Login
    post "/token", SessionController, :create, as: :login

  end
end
