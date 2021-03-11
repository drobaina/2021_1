
### criar a conta no github

### baixar o git

## para o mac https://git-scm.com/download/mac

install.packages("usethis")
library(usethis)



### informe o seu git 

usethis::use_git_config(user.name = "drobaina", # Seu nome
                        user.email = "drobaina@fgv.br") # Seu email

### no terminal 

###  $ git config --global user.name "drobaina"

###  $ git config --global user.email diogo.robaina@fgv.br

## pegue seu token

usethis::create_github_token()

### vai abrir uma página de token

usethis::edit_r_environ()

### GITHUB_PAT = token

### criar projeto

getwd()
usethis::create_project("2021_1") 

### no console

usethis::use_git()

usethis::use_github()
### https://www.kaggle.com/hamelg/dplyr-in-r

