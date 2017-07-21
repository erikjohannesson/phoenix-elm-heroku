# Phoenix + Elm + Brunch starter app, ready for Heroku deployment

## Introduction

This is a very basic [Phoenix] and [Elm] application that can be used as a starting point for new applications. It has been configured for deployment to [Heroku]. It is using [Brunch] to build all assets.

The application has been built using Phoenix v1.3.0-rc.2 and Elm 0.18.

[Phoenix]: http://www.phoenixframework.org/
[Heroku]: https://www.heroku.com/
[Elm]: http://elm-lang.org/
[Brunch]: http://brunch.io

## Installation

1. Clone the repo and make sure to have the heroku toolbelt installed. In the project root, run:

```
mix deps.get
heroku create --buildpack "https://github.com/HashNuke/heroku-buildpack-elixir.git"
heroku buildpacks:add https://github.com/gjaldon/heroku-buildpack-phoenix-static.git
heroku addons:create heroku-postgresql:hobby-dev
heroku config:set POOL_SIZE=18
```

2. In `config/prod.exs`, replace the placeholder "REPLACE_WITH_HEROKU_APPLICATION_NAME" with whatever name heroku gave you when you ran `heroku create`, and commit the changes.

3. Now run `mix phx.gen.secret` and copy-paste the returned string into the command `heroku config:set SECRET_KEY_BASE="<insert_secret_key_here>"`, 
   
4. Before deploying, let's test to make sure the application runs locally. Run:

```
cd assets && npm install --save-dev elm-brunch elm && cd ..
mix phx.server
```
Then visit [`localhost:4000`](http://localhost:4000) from your browser.

5. Finally, deploy using `git push heroku master` and visit your app using `heroku open`


### If deployment fails

If Heroku deployment fails due to version issues, you may need to create a file `elixir_buildpack.config` in the application root dir, with contents:

    erlang_version=X.X
    elixir_version=Y.Y

To find the version numbers:
* Erlang: https://stackoverflow.com/questions/9560815/how-to-get-erlangs-release-version-number-from-a-shell
* Elixir: `elixir -v`

In case of any other issues, check, e.g.:
* Phoenix 1.3.0-rc.2 Heroku deployment guide: https://hexdocs.pm/phoenix/1.3.0-rc.2/heroku.html (not completely up to date as of writing this)
* Deploying a Phoenix 1.3 Umbrella app to Heroku (has some useful updates for non-umbrella apps too): https://hackernoon.com/deploying-a-phoenix-1-3-umbrella-app-to-heroku-452436b2b37f
* Phoenix static buildpack: https://github.com/gjaldon/heroku-buildpack-phoenix-static
