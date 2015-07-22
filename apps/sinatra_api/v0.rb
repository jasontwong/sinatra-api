require 'multi_json'
require 'sinatra/respond_with'

module SinatraAPI
  class V0 < Base
    register Sinatra::RespondWith
    # {{{ before do
    before do
      halt 404 if settings.production? && !request.secure?

      allow = false
      allow = request.env['HTTP_AUTHORIZATION'] == DEV_KEY unless settings.production?
      unless allow
        halt 401, {
          'Content-Type' => 'application/json'
        }, { 
          error: {
            message: 'Invalid API Key'
          }
        }.to_json
      end
    end

    # }}}
    # {{{ get '/data/:type.:format' do
    get '/data/:type.:format' do
      info = {
        test: {
          foo: 'bar'
        }
      }
      data = info[params['type'].to_sym]

      respond_to do |f|
        f.json { data.to_json }
      end
    end

    # }}}
  end
end
