class Shutdown
  def shutdown_response(counter, server)
    server.kill_session = true
    "Total requests: #{counter}"
  end
end
