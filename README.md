
##Secure API

###Rails app that allows a client to list all Posts via an API.

- [x] GET /api/posts to return all posts

- [x] GET /api/posts/:id gives details of a post

- [x] POST /api/posts creates a post

- [x] PUT /api/posts/:id updates a post

- [x] PATCH /api/posts/:id updates a post

- [x] DELETE /api/posts/:id deletes a post

###However, this API will follow standard conventions, meaning:

- [x] It is secured with an OAuth Password Grant (https://github.com/doorkeeper-gem/doorkeeper)

- [x] You need to post credentials to /oauth/token with username, password, and "grant_type: 'password'" to get an access token.

- [x] Access Tokens will then be supplied as Authorization Headers: Authorization: Bearer #{token}

- [x] The JSON returned will be customized with JBuilder and will look like the following

```
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

```

###To test API, we run the api_runner.rb by running ruby api-runner.rb. It should output the following.

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

