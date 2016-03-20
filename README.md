#Secure API

Rails app that allows a client to list all Posts via an API.

    GET /api/posts to return all posts
    GET /api/posts/:id gives details of a post
    POST /api/posts creates a post
    PUT /api/posts/:id updates a post
    PATCH /api/posts/:id updates a post
    DELETE /api/posts/:id deletes a post

However, this API will follow standard conventions, meaning:

    It is secured with an OAuth Password Grant (https://github.com/doorkeeper-gem/doorkeeper)
    So, you need to post credentials to /oauth/token with username, password, and "grant_type: 'password'" to get an access token.
    Access Tokens will then be supplied as Authorization Headers: Authorization: Bearer #{token}
    The JSON returned will be customized with JBuilder and will look like the following

/api/posts

{
  posts: [
    {"id": 2, "title": "Yolo"}, 
    {"id": 3, "title": "Bolo"}, 
  ]
}

/api/post

{
  post: {
    "id": 2,
    "title": "Yolo"
  }
}

To test API, we run the api_runner.rb by running ruby api-runner.rb. It should output the following.

Should have 401 if I request api/posts
Creating a User
Creating an oauth token to user
Found 0 posts
Created post with id: $id
Setting title to Macbook
Title is now MacBook
Deleting...
Found 0 posts
Deleting the user to clean up

