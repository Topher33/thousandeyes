module ThousandEyes
  class Client
    def agents
      self.class.get('/agents.json')['agents']
    end
    
    def agent(agent_id)
      self.class.get("/agents/#{agent_id}.json")['agents']
    end

    def update_agent(agent_id, data)
      # params?
      self.class.post("/agents/#{agent_id}/update.json", body: data)
    end

    def delete_agent(agent_id)
      self.class.post("/agents/#{agent_id}/delete.json", body: '')
    end

    def bgp_monitors
      self.class.get('/bgp-monitors.json')['bgpMonitors']
    end
  end
end
