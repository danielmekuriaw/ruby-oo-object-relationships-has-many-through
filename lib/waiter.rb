class Waiter

    attr_accessor :name, :yrs_experience
  
    @@all = []
  
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
  
    def self.all
      @@all
    end

    def new_meal(customer_instance, total, tip)
        meal_instance = Meal.new(self,customer_instance, total, tip)
    end

    def meals
        Meal.all.select{
            |meal| meal.waiter == self
        }
    end
    
    def best_tipper
        Meal.all.max_by{
            |meal| meal.tip
        }.customer
    end
  
  end 