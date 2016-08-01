module ThousandEyes
  class Client
    
    def metrics(test_id)
      self.class.get("/net/metrics/#{test_id}.json")['net']['metrics']
    end

  end
end
