module ThousandEyes
  # client
  class Client
    def alert_rules
      self.class.get('/alert-rules.json')['alertRules']
    end

    def alerts
      self.class.get('/alerts.json')
    end

  end
end
