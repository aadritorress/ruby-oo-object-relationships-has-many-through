class Waiter

    attr_reader :name, :years_of_experience
    
    @@all = []
  
def initialize (name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience 
    @@all << self 
end 

def self.all
    @@all
end 

def new_meal (customer, total, tip)
    Meal.new(self, customer, total, tip)
end 

def meals 
    Meal.all.select do |meal|
    meal.waiter == self 
end 
end 

def best_tipper
    best_tip = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip 
      #TO REMEMBER <=>
      #It's a general comparison operator. 
      #It returns either a -1, 0, or +1 depending on whether its receiver is less than, 
      #equal to, or greater than its argument.
    end
    best_tip.customer
  end
  

end