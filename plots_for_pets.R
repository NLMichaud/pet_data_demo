require(ggplot2)
require(dplyr)

## read in dataset on cats vs. dogs
cats_and_dogs <- read.csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-09-11/cats_vs_dogs.csv')

## what data does our dataset have??
head(cats_and_dogs)

## let's look at the data.  How many cats and dogs are there in each state?
ggplot(cats_and_dogs, aes(x = cat_population, y = dog_population))

## nothing happens!  Let's add some points
ggplot(cats_and_dogs, aes(x = cat_population, y = dog_population)) + geom_point()

## that's more interesting.. but what states are where??
ggplot(cats_and_dogs, aes(x = cat_population, y = dog_population)) + geom_point() +
  geom_text(aes(label = state))

## what if we want to look at what percet of people have cats and dogs in each state?
ggplot(cats_and_dogs, aes(x = percent_cat_owners, y = percent_dog_owners)) + geom_point()

## let's add the state names again
ggplot(cats_and_dogs, aes(x = percent_cat_owners, y = percent_dog_owners)) + geom_point() +
  geom_text(aes(label = state))

## okay one more.  how many cats and dogs do people have, on average, in each state?
## Try this one on your own!




## Okay, now let's look at pet names
pet_names <- read.csv('https://github.com/rfordatascience/tidytuesday/raw/master/data/2019/2019-03-26/seattle_pets.csv',
                      stringsAsFactors = FALSE)
pet_names <- filter(pet_names, !is.na(animals_name))

## what data do we have?
head(pet_names)

## what are the different pet names?
unique(pet_names$animals_name)

## so many pet names!  how can we figure out the most popular ones?
## we're going to summarize the pet names real quick.
## for each pet name, we want to know how many pets have that name, 
## and how long the name is
pet_names_summary <- pet_names %>% group_by(animals_name) %>%
  summarize(number_of_pets = n(),
            name_length = nchar(first(animals_name))) %>%
  ungroup()

write.csv(pet_names_summary, file = 'pet_names.csv')

## what does our new data look like?
head(pet_names_summary)

## still a lot of names.  let's only look at names that have at least 100 pets with that name/
over_100_pets <- filter(pet_names_summary,  number_of_pets > 100)


## now we can plot it!
ggplot(over_100_pets,
       aes(x = animals_name, y = number_of_pets)) + 
  geom_col()

## really hard to read there.  let's make it a bit easier
ggplot(over_100_pets,
       aes(x = animals_name, y = number_of_pets)) + 
  geom_col() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

## much better.  what is the most common pet name?  what's the least common?

## sometimes easier to answer if the bars are sorted by height
ggplot(over_100_pets,
       aes(x = reorder(animals_name, number_of_pets), y = number_of_pets)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


### challenge!  what if we know what pet names that have at least 35 characters in them.
### how should we get this??

filter(pet_names_summary, name_length >= 35)

