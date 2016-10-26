class HelloWorld
  def initialize
    @hello_counter = 0
  end

  def count
    @hello_counter += 1
  end

  def hello_response
    "Hello, World! #{count}"
  end
end
