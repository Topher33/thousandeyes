module ThousandEyes
  # client
  class Client
    def groups
      self.class.get('/groups.json')['groups']
    end

    def test_groups
      self.class.get('/groups/tests.json')['groups']
    end

    def agent_groups
      self.class.get('/groups/agents.json')['groups']
    end

    def group_ids
      groups.map { |group| group['groupId'] }
    end

    def group_id_by_name(name)
      groups.find { |group| group['name'] == name }['groupId'].to_s
    end

    def group(group_id)
      self.class.get("/groups/#{group_id}.json")
    end

    def create_group(group_type, name, ids)
      data = { name: name }
      data[group_type] = ids.map { |id| { "testId": id } }
      self.class.post("/groups/#{group_type}/new.json", body: data.to_json)
    end

    def update_group(group_id, data)
      self.class.post("/groups/#{group_id}/update.json", body: data)
    end

    def delete_group(group_id)
      self.class.post("/groups/#{group_id}/delete.json", body: '')
    end
  end
end
