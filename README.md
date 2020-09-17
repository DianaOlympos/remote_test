# RemotePoints

This is a project that return the points of users.
Points get updated every minute, and are stored in postgres.

You can get 2 random users through calling
`GET localhost:4000/`

```elixir
{
  'users': [{id: 1, points: 30}, {id: 72, points: 30}],
  'timestamp': `2020-07-30 17:09:33`
}
```

## Running the project

This was built for OTP 23 with elixir 1.10 and postgres 12. The postgres db goes in `.db` by default. There is a `./bin/setup.sh` for quick setup but if you prefer to do things by hand:

* There is a shell.nix at the root to setup a local environment. You can use `nix-shell` to get a fully setup shell. Otherwise, use `lorri` with `direnv`. Otherwise you can use your normal version manager.
* You can start postgres with `./bin/start.sh`
* Setup the project with `mix setup`
* Start Phoenix endpoint with `mix phx.server`
* You can stop the postgres instance with `./bin/stop.sh`

Now you can visit [`localhost:3000`](http://localhost:4000) from your browser or with curl locally

```bash
curl "localhost:4000"
```

## Thinking

* Integer max size in postgres is done with a check constraint. Could have been decimal, but exercise ask for integer.
* timestamps field or 2 timestamp ? i went with the 2 from ecto
* I use the context because why not, the generator do it
* It is understood that the users returned will be the one from the current handle_call. Only the timestamp will be from the previous handle_call. Otherwise bootstrap problem. Can be solved but not in the requirements anymore
