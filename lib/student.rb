# Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
class Student

  attr_accessor :name, :grade
  attr_reader :id

def  initialize(name, grade, id = nil)
 @id = id
 @name = name
 @grade = grade
end

# attributes
#    has a name and a grade
#    has an id that is readable but not writable

def self.create_table
  sql = <<-SQL
  CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade TEXT
  )
  SQL
  DB[:conn].execute(sql)
end

# .create_table
#    creates the students table in the database

def self.drop_table
  sql = <<-SQL
  DROP TABLE students;
  SQL
  DB[:conn].execute(sql)
end

# .drop_table
#     drops the students table from the database

def save
  sql = <<-SQL
    INSERT INTO students (name, grade)
    VALUES (?,?)
    SQL

    DB[:conn].execute(sql, self.name, self.grade)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
end

# #save
#    saves an instance of the Student class to the database

def self.create(name:, grade:)
   student = Student.new(name, grade)
   student.save
   student
end

# .create
#     takes in a hash of attributes and uses metaprogramming to create a new student object. Then it uses the #save method to
#  save that student to the database (FAILED - 1)
#     returns the new object that it instantiated (FAILED - 2)

end
