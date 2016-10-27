require './lib/diagnostics'
require './lib/hello_world'
require './lib/date_time'
require './lib/shutdown'
require './lib/word_search'
require './lib/game'

class Router
  attr_reader :counter
  def initialize
    @diagnostics = Diagnostics.new
    @hello_world = HelloWorld.new
    @date_time   = DateTime.new
    @shutdown    = Shutdown.new
    @word_search = WordSearch.new
    @game        = Game.new
    @counter     = 0
  end

  def route_request(request_lines, server)
    @counter += 1
    if check_path(request_lines).eql?("Path: /hello")
      @hello_world.hello_response
    elsif check_path(request_lines).eql?("Path: /datetime")
      @date_time.date_time_response
    elsif check_path(request_lines).eql?("Path: /shutdown")
      @shutdown.shutdown_response(counter, server)
    elsif check_path(request_lines).eql?("Path: /word_search?word=#{parameter(request_lines)}") && request_lines[0].include?("GET")
      @word_search.word_search_response(parameter(request_lines))
    elsif check_path(request_lines).eql?("Path: /start_game") && request_lines[0].include?("POST")
      @game.start_game
    elsif check_path(request_lines).eql?("Path: /game?guess=#{parameter(request_lines)}") && request_lines[0].include?("POST")
      @game.game_feedback(parameter(request_lines))
    end
  end

  def parameter(request_lines)
    "#{request_lines[0].split[1].split("=")[1]}"
  end

  def check_path(request_lines)
    @diagnostics.get_the_path(request_lines)
  end
end
