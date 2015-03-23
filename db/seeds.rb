# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 3 Users

user1 = User.create(email: "User1@bla.com", password: "password")
user2 = User.create(email: "User2@bla.com", password: "password")
user3 = User.create(email: "User3@bla.com", password: "password")

# Create 3 Projects

project1 = Project.create(name: "Project1", user: user1)
project2 = Project.create(name: "Project2", user: user2)
project3 = Project.create(name: "Project3", user: user3)


# Create 3 Classes

klass1 = Klass.create(name: "Class1", project: project1)
klass2 = Klass.create(name: "Class2", project: project2)
klass3 = Klass.create(name: "Class3", project: project3)

# Create 3 Klass_result_sets
klass_result_set1 = KlassResultSet.create(klass: klass1, variables: 10, public_variables: 5, protected_variables: 3, private_variables: 2, 
                                          number_of_lines: 100, number_of_methods: 10, average_lines_per_method: 8, average_method_complexity: 10,
                                          weighted_methods_per_class: 100, depth_of_inheritance: 2, LCOM: 5, CBO: 5)

klass_result_set2 = KlassResultSet.create(klass: klass2, variables: 20, public_variables: 10, protected_variables: 6, private_variables: 4, 
                                          number_of_lines: 100, number_of_methods: 10, average_lines_per_method: 8, average_method_complexity: 100,
                                          weighted_methods_per_class: 1000, depth_of_inheritance: 10, LCOM: 5, CBO: 9)

klass_result_set3 = KlassResultSet.create(klass: klass3, variables: 20, public_variables: 10, protected_variables: 6, private_variables: 4, 
                                          number_of_lines: 100, number_of_methods: 10, average_lines_per_method: 8, average_method_complexity: 100,
                                          weighted_methods_per_class: 1000, depth_of_inheritance: 10, LCOM: 5, CBO: 9)


# Create 3 Methoods
method1 = Methood.create(name: "Method1", klass: klass1)
method2 = Methood.create(name: "Method2", klass: klass2)
method3 = Methood.create(name: "Method3", klass: klass3)

# Create 3 Method Result Sets
method_result_set1 = MethodResultSet.create(method: method1, number_of_lines: 10, complexity: 3)
method_result_set2 = MethodResultSet.create(method: method2, number_of_lines: 100, complexity: 2)
method_result_set3 = MethodResultSet.create(method: method3, number_of_lines: 10, complexity: 3)

