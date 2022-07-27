require "http"

system "clear"

response = HTTP.get("http://localhost:3000/all_contacts")

pp JSON.parse(response.body)
