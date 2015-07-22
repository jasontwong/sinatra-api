require "./apps/sinatra_api"

map('/v0') { run SinatraAPI::V0 }
