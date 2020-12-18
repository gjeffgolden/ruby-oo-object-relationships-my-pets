require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize name, species="human"
    @name = name
    @species = species 
    @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def cats 
  Cat.all.select {|cats| cats.owner == self}
  end

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end

  def my_pets
    [dogs, cats].flatten
  end

  def buy_cat name
    Cat.new name, self
  end

  def buy_dog name
    Dog.new name, self
  end

  def walk_dogs
  dogs.each {|dog| dog.mood="happy"}
  end

  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    my_pets.each {|pet| pet.mood = "nervous"} + 
    my_pets.each {|pet| pet.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

end