
library(dplyr)
library(readtext)
library(tidytext)
library(tokenizers)
library(stringr)

# count average length of sentences in afd program

# convert from docx
sentences <- readtext("afd2017_withouttoc.docx") %>% 
   unnest_tokens(paragraph, text, "paragraphs", to_lower=FALSE, collapse = FALSE,paragraph_break = "\n") %>% 
   filter(!grepl("^[0-9]", paragraph)) %>%
   filter(!grepl("^KAPITEL", paragraph)) %>%
   unnest_tokens(sentence,paragraph, "sentences", to_lower=FALSE) %>%
   mutate(
      length = nchar(sentence),
      sent_truncated = str_trunc(sentence, 110, "right")
   )
print(sentences$sent_truncated)
