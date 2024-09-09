library(tidyverse)

##### 1. OPEN & CREATE

liste_noms_sp <- read.csv("1. Flore/1.1. Key/Raw/List_species_ENI_with_synonym.csv") %>% 
  mutate(species=toupper(nom_eni_fusion_trait)) %>% 
  separate(species,sep=" ",c("GENRE","SP")) %>% 
  mutate(genus=str_sub(GENRE, 1, 4))%>% 
  mutate(sp=str_sub(SP, 1, 7)) %>% 
  mutate(key= paste(genus,sp,sep="")) %>% 
  dplyr::select(-GENRE,-SP,-genus,-sp) %>% 
  mutate(nom_eni_fusion_trait_code=key)

##### 2. SAVE
#write.csv(liste_noms_sp,file="1. Flore/1.1. Key/Processed/key_500_ENI_name_species.csv")

