alias MyTwitter.Repo
alias MyTwitter.Management.Tweet

Repo.insert! %Tweet{
  user_id: 2,
  text: "My first tweet",
  likes: 50,
  created_at: NaiveDateTime.add(~N[2020-01-02 00:29:10], 2)
}

Repo.insert! %Tweet{
  user_id: 2,
  text: "My second tweet",
  likes: 26,
  created_at: NaiveDateTime.add(~N[2020-01-02 10:29:10], 2)
}

Repo.insert! %Tweet{
  user_id: 1,
  text: "My second tweet",
  likes: 16,
  created_at: NaiveDateTime.add(~N[2020-03-02 00:29:10], 2)
}

Repo.insert! %Tweet{
  user_id: 1,
  text: "My Third tweet",
  likes: 19,
  created_at: NaiveDateTime.add(~N[2020-05-02 00:29:10], 2)
}

Repo.insert! %Tweet{
  user_id: 3,
  text: "My first tweet",
  likes: 19,
  created_at: NaiveDateTime.add(~N[2020-01-02 00:29:10], 2)
}

Repo.insert! %Tweet{
  user_id: 3,
  text: "My second tweet",
  likes: 12,
  created_at: NaiveDateTime.add(~N[2020-02-02 00:29:10], 2)
}
