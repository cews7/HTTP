class Diagnostics
  def parse_request_lines(request_lines)
    "<pre>\n" +
    [get_the_verb(request_lines),
    get_the_path(request_lines),
    get_the_protocol(request_lines),
    get_the_host(request_lines),
    get_the_port(request_lines),
    get_the_origin(request_lines),
    get_the_accept(request_lines)].join("\n") +
    "\n</pre>"
  end

  def get_the_verb(request_lines)
    "Verb: " + "#{request_lines[0].split[0]}"
  end

  def get_the_path(request_lines)
    "Path: " + "#{request_lines[0].split[1]}"
  end

  def get_the_protocol(request_lines)
    "Protocol: " + "#{request_lines[0].split[2]}"
  end

  def get_the_host(request_lines)
    "Host:" + "#{request_lines[1].split(":")[1]}"
  end

  def get_the_port(request_lines)
    "Port: " + "#{request_lines[1].split(":")[2]}"
  end

  def get_the_origin(request_lines)
    "Origin:" + "#{request_lines[1].split(":")[1]}"
  end

  def get_the_accept(request_lines)
    "Accept:" + "#{request_lines[6].split(":")[1]}"
  end
end
