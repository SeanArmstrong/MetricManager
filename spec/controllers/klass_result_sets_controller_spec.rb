require 'rails_helper'
require 'klass_result_sets_controller'
require 'controller_helpers'

describe KlassesController do

  before :each do
    @user1 = User.create(email: "bla@bla.com", password: "blablabla")
    @user2 = User.create(email: "bla2@bla2.com", password: "blablabla2")
    @project1 = Project.create(name: "Project1", display_tasks: false, user: @user1)
    @project2 = Project.create(name: "Project2", display_tasks: false, user: @user2)
    @klass1 = Klass.create(name: "Klass1", package: "default", project: @project1, is_total: false, display_tasks: true)
    @klass2 = Klass.create(name: "Klass2", package: "default", project: @project2, is_total: false, display_tasks: true)
    @klass_result_set = KlassResultSet.new(klass: @klass,
                                           variables: 3,
                                           public_variables: 1,
                                           protected_variables: 1,
                                           private_variables: 1,
                                           number_of_lines: 200,
                                           number_of_methods: 10,
                                           average_lines_per_method: 10,
                                           average_method_complexity: 10,
                                           depth_of_inheritance: 1,
                                           LCOM: 3,
                                           CBO: 3,
                                           is_total: true,
                                           sdmc: 1)
    sign_in @user1
  end

  #No routes
