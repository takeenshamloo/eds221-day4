# Nested for loop warmup ----
file_prefix <- c("temp", "ph", "salinity")
file_suffix <- c(1, 2, 3, 4)

for (i in 1:length(file_prefix)){
  for (j in 1:length(file_suffix)){
    print(paste0(file_prefix[i], "_", file_suffix[j]))
  }
}

# Another nested example ----
odds <- c(1, 3, 5)
evens <- c(2, 4, 6, 8)

for (i in seq_along(odds)){
  for (j in seq_along(evens)){
    print(odds[i] * evens[j])
  }
}

# Setting up our first function ----
birddog_sum <- function(bird, dog){
  pets = bird + dog
  return(pets)
}

birddog_sum(bird = 2, dog = 5)

animal_age <- function(animal, age){
  if (animal == "dog"){
    print(age * 7)
  } else if (animal == "goat") {
    print(age * 4.7)
  }
}

animal_age(animal = "dog", age = 8)

dog_choice <- data.frame(dog_name = c("Khora",
                                      "Teddy",
                                      "Waffle",
                                      "Banjo"),
                         food = c("everything", 
                                  "salmon", 
                                  "pancakes",
                                  "chicken"))

library(tidyverse)
my_sub <- dog_choice |>
  filter(dog_name == "Khora")

dog_menu <- function(name){
  my_sub <- dog_choice |>
    filter(dog_name == name)
  print(paste("My name is", my_sub$dog_name, "and I like to eat", my_sub$food))
}

dog_menu(name = "Teddy")

animal_age <- function(animal, age){
  if (!animal %in% c("dog", "goat")){
    stop("Not a dog or goat...")
  }
  
  if (is.numeric(age) == FALSE){
    stop("Age is not numeric...")
  }
  
  if (age <= 0){
    stop("Age must be greater than 0...")
  }
  
  if (animal == "dog"){
    print(age * 7)
  } else if (animal == "goat") {
    print(age * 4.7)
  }
}
#animal_age(animal = "dog", age = "3")
#animal_age(animal = "trout", age = 3)


