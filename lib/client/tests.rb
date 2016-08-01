module ThousandEyes
  # client
  class Client
    def tests
      self.class.get('/tests.json')['test']
    end

    def test_ids
      tests.map { |test| test['testId'] }
    end

    def test(test_id)
      self.class.get("/tests/#{test_id}.json")['test']
    end

    def create_test(test_type, data)
      self.class.post("/tests/#{test_type}/new.json", body: data)
    end

    def update_test(test_type, test_id, data)
      self.class.post("/tests/#{test_type}/#{test_id}/update.json", body: data)
    end

    def delete_test(test_type, test_id)
      self.class.post("/tests/#{test_type}/#{test_id}/delete.json", body: '')
    end
  end
end
