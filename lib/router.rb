require './lib/diagnostics'
require './lib/hello_world'
require './lib/date_time'
require './lib/shutdown'
class Router
  attr_reader :counter
  def initialize
    @diagnostics = Diagnostics.new
    @hello_world = HelloWorld.new
    @date_time = DateTime.new
    @shutdown = Shutdown.new
    @counter = 0
  end

  def route_request(request_lines)
    if check_path(request_lines).eql?("Path: /")
      @counter += 1
      @diagnostics.parse_request_lines(request_lines)
    elsif check_path(request_lines).eql?("Path: /hello")
      @counter += 1
      @hello_world.hello_response
    elsif check_path(request_lines).eql?("Path: /datetime")
      @counter += 1
      @date_time.date_time_response
    elsif check_path(request_lines).eql?("Path: /shutdown")
      @counter += 1
      @shutdown.shutdown_response(counter)
    end
  end

  def check_path(request_lines)
    @diagnostics.get_the_path(request_lines)
  end
end
