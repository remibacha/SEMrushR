# SEMrushR

### Description

This R package implements methods for querying SEO and SEM data from SEMrush using its API.
This API uses a basic authentication with an API key. 
NB : To get this API key, you need to have a SEMrush [Business plan](https://fr.semrush.com/prices/?ref=7924552608&refer_source=&utm_source=berush&utm_medium=promo).

The script is explained step by step on my blog post "[Guide complet de l’API de SEMrush avec R (package)](https://remibacha.com/api-semrush/) (French)"



## Install
```
devtools::install_github("remibacha/SEMrushR")
```

## Getting started
Get your SEMrush API key (you will have to replace the "xxxxxxxxxxxxxxxxxxx" in above examples with it) and load the SEMrushR package :
```
library(SEMrushR)
```

## Main SEMrushR Functions

### 1. Related Keywords
This function provides an extended list of related keywords, synonyms, and variations relevant to a queried term in a chosen database.
```
related_keywords("frank ocean","fr",10,"xxxxxxxxxxxxxxxxxxx")
```

### 2. Phrase Match Keywords
This function provides a list of phrase matches and alternate search queries, including particular keywords or keyword expressions.provides an extended list of related keywords, synonyms, and variations relevant to a queried term in a chosen database.

```
phrase_match_keywords("kanye west","fr",10,"xxxxxxxxxxxxxxxxxxx")
```

### 3. Keyword Overview All Databases
This function provides a summary of a keyword, including its volume, CPC, competition, and the number of results in all regional databases.

```
keyword_overview_all("tyler the creator","fr","xxxxxxxxxxxxxxxxxxx")
```

### 4. Organic Results
This function lists domains that are ranking in Google top 20 organic search results with a requested keyword.

```
organic_results("travis scott","fr",100,"xxxxxxxxxxxxxxxxxxx")
```

## Feedbacks
Questions and feedbacks welcome!

You want to contribute ? Open a pull request ;-) If you encounter a bug or want to suggest an enhancement, please open an issue.
