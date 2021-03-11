library(tidyverse)

dados <- mtcars   

dados <- dados %>% rownames_to_column("modelo") %>% 
  filter(cyl == 4) %>%
  mutate(hp_por_tonelada = hp/wt) %>%
  select(modelo,mpg,hp,wt,hp_por_tonelada) %>%
  arrange(desc(hp_por_tonelada))

### selecionar os cinco primeiros

dados %>% top_n(6, mpg)

### buscar algumas linhas
dados %>% slice(1,3,5)

### testagem?

dados %>% sample_frac(0.30, replace = F) %>%
  arrange(modelo)


### referências 
# https://www.kaggle.com/hamelg/dplyr-in-r
# https://courses.cs.ut.ee/MTAT.03.183/2017_fall/uploads/Main/dplyr.html
# https://rstudio-pubs-static.s3.amazonaws.com/437983_4fe3dc615f7e4b2784767ae0a292b60d.html
# https://livro.curso-r.com/7-4-o-pacote-stringr.html

?stringr

### fórmulas https://github.com/rstudio/cheatsheets/blob/master/strings.pdf

### funções

# str_length() VERSUS length(). 
# str_length() - número de caracteres 
# length() - retorna o comprimento do objeto


sudeste <- c("Espírito Santo", "Minas Gerais",
             "São Paulo", "Rio de Janeiro")

sudeste %>% str_length()

sudeste %>% length()

### maiúsculas e minúsculas 

sudeste %>%str_to_lower() # todas minúsculas
sudeste %>%str_to_upper() # todas maiúsculas
sudeste %>%str_to_title() # só a primeira maiúscula

### remover espaços que "surgem" nos formulários 

flamenguista <- c("sim", "não ", " não", "sim") 


flamenguista %>% table()

flamenguista %>% str_trim() %>% table()

### você busca apenas um pedaço da string

nomes <- c( "01-Ana", "02-João", "03-Pedro" , "O4-Rafael")

nomes %>% str_sub(start = 4)

nomes %>% str_sub(end = 2)

nomes %>% str_sub(4,4) ## pode "cortar" antes e depois

### "juntar" os caracteres?

str_c(nomes," - ", sudeste ) ### vetor separador vetor

### projeto extremamente relevante 
# https://towardsdatascience.com/using-stringr-and-regex-to-extract-features-from-textual-alphanumeric-and-punctuation-data-in-r-2565256c0a77


### instalar o pacote
install.packages("titanic")
### chamar
library(titanic)
### criar o objeto
df = titanic_train 

### chamar a biblioteca
library(stringr)

### salvar nomes com letra minúscula
df$lcName = str_to_lower( df$Name )

### a estratégia

#                     (?<=\\s)[[:alpha:]]+(?=\\.)

## (?<=\\s) indica que o trecho procurado é precedido (?<=) por um espaço em branco (\\s).
## [[:alpha:]]+ indica que o trecho procurado consiste em uma ou mais (+) letras ([[:alpha:]]).
## (?=\\.) indica que o texto procurado é precedido (? =) por um ponto (\\.).

### foco no https://www.devmedia.com.br/iniciando-expressoes-regulares/6557

df$title = str_extract( df$lcName, "(?<=\\s)[[:alpha:]]+(?=\\.)" )


### extrair o sobrenome

### incluir quaisquer tipos de caracteres (.) que tenham 1 
# caractere ou mais de comprimento (+) e sejam seguidos 
# por uma vírgula (? = \\,)

df$family=str_extract(df$lcName,".+(?=,)")

t=data.frame(table(df$family))

head(t, 10)

### extrair informação do ticket

### colocar tudo em minúscula
df$lcTicket=str_to_lower(df$Ticket)

head(df$lcTicket,10)

### remover caracteres de pontuação equivalente a [.,!?:...] 
df$lcTicket=str_replace_all(df$lcTicket,"[:punct:]","")

head(df$lcTicket,10)

### remover acrônimo ou sigla
df$Ticketinfo = str_extract( df$lcTicket, ".+(?=\\s(?=[[:digit:]]{3,}))|[[:alpha:]]+" )

head(df$Ticketinfo,10)

### remover espaços 
df$Ticketinfo = str_replace_all( df$Ticketinfo, "\\s", "" )

head(df$Ticketinfo,10)

### remover NA 
df$Ticketinfo = ifelse( is.na(df$Ticketinfo), "none", df$Ticketinfo )


