class Dog 
  attr_accessor :id, :name, :breed 
  
  def initialize(name:, breed:, id: nil)
    @name, @breed, @id = name, breed, id
  end
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs(
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
    );
    SQL
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
    DROP TABLE IF EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end
  
  def save
    if self.id
      self.update
    else
      sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, self.name, self.breed)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end
    self
  end
  
  def self.create(attribute_hash)
    dog = Dog.new(attribute_hash)
    dog.save
    dog
  end
  
  def self.new_from_db(row)
    new_dog = self.new
    new_dog.id = row[0]
    new_dog.name = row[1]
    new_dog.breed = row[2]
    new_dog
  end
  
  def self.find_by_id
    
  end
  
  def self.find_or_create_by
    
  end
  
  def self.find_by_name
    
  end
  
  def update
    
  end
  
end




