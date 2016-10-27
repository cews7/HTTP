require 'socket'
require './lib/router'
require './lib/diagnostics'

class WebServer
  attr_reader   :client
  attr_accessor :kill_session
  def initialize
    @router       = Router.new
    @kill_session = false
  end

  def start_web_server
    tcp_server = TCPServer.new(9292)
    server_loop(tcp_server)
  end

  def server_loop(tcp_server)
    request_lines = []
    loop do
      client = tcp_server.accept
      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end
      client.puts @router.route_request(request_lines, self)
      client.puts Diagnostics.new.parse_request_lines(request_lines)
      request_lines = []
      client.close
      break if kill_session == true
    end
  end
end

if __FILE__ == $0
  server = WebServer.new
  server.start_web_server
end
