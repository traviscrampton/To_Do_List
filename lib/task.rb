class Task

  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch('description')
      tasks.push(Task.new({:description => description}))
    end
    tasks
  end


  define_method(:==) do |another_task|
    self.description().==(another_task.description())
  end
end


# @@all_descriptions = []

# define_method(:initialize) do |description|
#   @description = description
# end

# define_method(:description) do
#   @description
# end

# define_singleton_method(:all) do
#   @@all_descriptions
# end

# define_method(:save) do
#   @@all_descriptions.push(self)
# end
#
# define_singleton_method(:clear) do
#   @@all_descriptions = []
# end
