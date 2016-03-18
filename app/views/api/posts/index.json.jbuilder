json.posts @posts do |post|
  json.partial! "post", post: post
end
json.meta do
  json.time Time.now
  json.total_count @posts.total_count
  json.page @posts.current_page
end
