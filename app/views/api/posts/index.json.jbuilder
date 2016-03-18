json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.post_text post.post_text
end
