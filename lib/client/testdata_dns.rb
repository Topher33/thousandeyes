module ThousandEyes
  class Client
    def http_server(test_id)
      self.class.get("/web/http-server/#{test_id}.json")['web']['httpServer']
    end

    def page_load(test_id)
      self.class.get("/web/page-load/#{test_id}.json")['pageLoad']
    end

    def page_load_component_detail
    end

    def transactions(test_id)
    end

    def transaction_detail
    end

    def transaction_component_detail
    end

  end
end
