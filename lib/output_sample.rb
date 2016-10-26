puts "Ready for a request"

puts "Got this request:"
puts request_lines.inspect

puts "Sending response."
output = "<html><head></head><body>#{response}</body></html>"
headers = ["http/1.1 200 ok",
  "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
  "server: ruby",
  "content-type: text/html; charset=iso-8859-1",
  "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  client.puts headers
  client.puts output

  puts ["Wrote this response:", headers, output].join("\n")
  puts "\nResponse complete, exiting."
