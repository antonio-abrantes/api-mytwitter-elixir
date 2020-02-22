alias MyTwitter.Repo
alias MyTwitter.Management.User

Repo.insert! %User{
  email: "antonio@hotmail.com",
  name: "Antonio Abrantes",
  nickname: "antonio_abrantes",
  password: "1234"
}

Repo.insert! %User{
  email: "ana@hotmail.com",
  name: "Ana Paula",
  nickname: "ana_paula",
  password: "1234"
}

Repo.insert! %User{
  email: "jonas@hotmail.com",
  name: "Jonas Qualquer",
  nickname: "jonas_q",
  password: "1234"
}

Repo.insert! %User{
  email: "fulano@hotmail.com",
  name: "Fulano de Tal",
  nickname: "fulano_t",
  password: "1234",
}

Repo.insert! %User{
  email: "ciclano@hotmail.com",
  name: "Ciclano de Qualquer",
  nickname: "ciclano_q",
  password: "1234"
}
