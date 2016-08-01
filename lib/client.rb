require 'httparty'

module ThousandEyes
  # class
  class Client
    include HTTParty
    base_uri 'https://api.thousandeyes.com/'
    format :json

    def initialize(user = 'noreply@thousandeyes.com', 
                   pass = 'g351mw5xqhvkmh1vq6zfm51c62wyzib2', 
                   *account_id)
      self.class.basic_auth(user, pass)
      self.class.default_params(aid: account_id) if account_id
      self.class.headers('Accept' => 'application/json', 'Content-Type' => 'application/json')
    end

    def accounts
      self.class.get('/accounts.json')['account']
    end

    Dir[File.expand_path('client/*.rb', File.dirname(__FILE__))].each { |f| require f }

  end
end
