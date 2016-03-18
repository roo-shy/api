if Post.all.blank?
  Post.create title: "For Adam LaRoche, the decision to walk away from baseball was easy", post_text: "A world-class hunter who produces shows with the “Duck Dynasty” guys, he exists
  in a kind of Southern-fried fantasy life. The game was an important part, but it was always just a part",
  user_id: 1

  Post.create title: "The musical prodigy who stole a prized Stradivarius", post_text:"The crime defied logic. Philip Johnson brazenly stole a priceless 18th-century violin while its owner, musician Roman Totenberg, was just feet away.
  Johnson played it in plain sight — the instrument unrecognized until after his death 31 years later", user_id: 2

  Post.create title: "U.S. mail service to Cuba resumes", post_text:"Days before Monday’s groundbreaking trip to Cuba by President Obama and Michelle Obama, mail
  service has  resumed between the U.S. and the island nation.", user_id: 3

end

if User.all.blank?
  User.create username: "Adam Kilgore", password: "1234"
  User.create username: "Geoff Edgers", password: "1234"
  User.create username: "Joe Davidson", password: "1234"

end
