# Peepchat

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

https://medium.com/peep-stack/building-a-performant-web-app-with-ember-fastboot-and-phoenix-part-1-fa1241654308#.x626b68x9

#### import to add empty file in priv/repo/migrations/.gitkeep otherwise the travis-CI will throw an error ** (Mix) Could not find migrations directory "priv/repo/migrations" for repo TheLink.Repo

#### .travis.yml
language: elixir
elixir:
- 1.3
otp_release:
- 18.2
sudo: false
addons:
  postgresql: '9.4'


#### add guardian package to mix.exs


#### Generate secret key

> mix phoenix.gen.secret

> heroku config:set GUARDIAN_SECRET=

> git remote add heroku <https://>

#### User initial setup

> mix phoenix.gen.model User users email:string password_hash:string

  def change do
    create table(:users) do
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    # Unique email address constraint, via DB index
    create index(:users, [:email], unique: true)
  end

>mix do ecto.create, ecto.migrate

>MIX_ENV=test mix do ecto.create, ecto.migrate

#### Add comeonin package to encrypted the password

\\ mix.exs
{:comeonin, "~> 2.5"},

