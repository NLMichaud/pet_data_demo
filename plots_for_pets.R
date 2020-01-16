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
pet_names <- read.csv('https://raw.githubusercontent.com/NLMichaud/pet_data_demo/master/pet_names.csv',
                      stringsAsFactors = FALSE)

## what data do we have?
head(pet_names)

## what are the different pet names?
unique(pet_names$animals_name)

## so many pet names!  how can we figure out the most popular ones?
## let's only look at names that have at least 100 pets with that name
over_100_pets <- filter(pet_names,  number_of_pets > 100)

## now we can plot it!
ggplot(over_100_pets,
       aes(x = animals_name, y = number_of_pets)) + 
  geom_col()

## really hard to read there.  let's make it a bit easier
ggplot(over_100_pets,
       aes(x = animals_name, y = number_of_pets)) + 
  geom_col() +
  coord_flip()

## much better.  what is the most common pet name?  what's the least common?

## sometimes easier to answer if the bars are sorted by height
ggplot(over_100_pets,
       aes(x = reorder(animals_name, number_of_pets), y = number_of_pets)) +
  geom_col() +
  coord_flip()



### challenge!  what if we know what pet names that have at least 35 characters in them.
### how should we get this??


