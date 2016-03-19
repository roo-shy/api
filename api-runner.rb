require 'http'

puts "Should have 401 if I request api/posts"
r = Http.get("http://127.0.0.1:3000/api/posts.json")

def safe_status_code(response)

  if response.respond_to? :status_code
    response.status_code
  else
    response.status
  end
end


if safe_status_code(r) != 401
  fail "This should have been a 401"
end

puts "Creating a User"
body = JSON.parse(Http.post("http://127.0.0.1:3000/api/users.json", json: {user: {username: "YoYoYo", password: "12345678"}}))
user = body["user"]
unless user["id"].to_i > 0
  fail "This should have created a user"
end

puts "Creating an oauth token to user"

auth = JSON.parse(Http.post("http://127.0.0.1:3000/oauth/token", json: {username: "YoYoYo", password: "12345678", grant_type: "password"}))
auth_token = auth["access_token"]

unless auth_token.length > 0
  fail "We should have received an auth token"
end

response = Http.auth("Bearer #{auth_token}").get("http://127.0.0.1:3000/api/posts.json")

body = JSON.parse(response)

puts "Found #{body["posts"].count} posts"


body = JSON.parse(Http.auth("Bearer #{auth_token}").post("http://127.0.0.1:3000/api/posts.json", json: {post: {title: "Yo"}}))
post = body["post"]

puts "Created post with id: #{post["id"]}"

puts "Setting title to Macbook"

JSON.parse(Http.auth("Bearer #{auth_token}").put("http://127.0.0.1:3000/api/posts/#{post["id"]}.json", json: {post: {title: "MacBook"}}))
body = JSON.parse(Http.auth("Bearer #{auth_token}").get("http://127.0.0.1:3000/api/posts/#{post["id"]}.json"))
post = body["post"]
puts "Title is now #{post["title"]}"

puts "Deleting..."

body = JSON.parse(Http.auth("Bearer #{auth_token}").get("http://127.0.0.1:3000/api/posts.json"))
posts = body["posts"]
posts.each do |post|
  Http.auth("Bearer #{auth_token}").delete("http://127.0.0.1:3000/api/posts/#{post["id"]}")
end

body = JSON.parse(Http.auth("Bearer #{auth_token}").get("http://127.0.0.1:3000/api/posts.json"))

posts = body["posts"]
puts "Found #{posts.count} posts"

puts "Deleting the user to clean up"

Http.auth("Bearer #{auth_token}").delete("http://127.0.0.1:3000/api/users/#{user["id"]}")
