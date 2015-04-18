require 'rails_helper'
require 'method_result_sets_controller'
require 'controller_helpers'

describe MethoodsController do

  before :each do
    @user1 = User.create(email: "bla@bla.com", password: "blablabla")
    @project1 = Project.create(name: "Project1", display_tasks: false, user: @user1)
    @klass1 = Klass.create(name: "Klass1", package: "default", project: @project1, is_total: false, display_tasks: true)
    @klass2 = Klass.create(name: "Klass2", package: "default", project: @project2, is_total: false, display_tasks: true)
    @methood1 = Methood.create(name: "Method1", klass: @klass1)
    @methood2 = Methood.create(name: "Method1", klass: @klass1)
    @methood3 = Methood.create(name: "Method1", klass: @klass2)
    @method_result_set = MethodResultSet.new(methood: @methood,
                                            number_of_lines: 10,
                                            complexity: 2)

    sign_in @user1
  end
