require 'rails_helper'
require 'klass_result_set'

describe KlassResultSet do
  it { expect(KlassResultSet.reflect_on_association(:klass).macro).to eq(:belongs_to) }
  it { expect(KlassResultSet.reflect_on_association(:result_set_group).macro).to  eq(:has_one) }

  before :each do
    @user = User.create(email: "bla@bla.com", password: "blablabla")
    @project = Project.new(name: "Project1", display_tasks: false, user: @user)
    @klass = Klass.new(name: "Klass1", package: "default", project: @project, is_total: false, display_tasks: true)
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
  end

  subject { @klass_result_set } 

  it { should respond_to :klass }
  it { should respond_to :variables} 
  it { should respond_to :public_variables } 
  it { should respond_to :protected_variables } 
  it { should respond_to :private_variables } 
  it { should respond_to :number_of_lines } 
  it { should respond_to :number_of_methods  } 
  it { should respond_to :average_lines_per_method } 
  it { should respond_to :average_lines_per_method } 
  it { should respond_to :average_method_complexity} 
  it { should respond_to :depth_of_inheritance } 
  it { should respond_to :LCOM } 
  it { should respond_to :CBO } 
  it { should respond_to :is_total } 
  it { should respond_to :sdmc} 

  describe "Validation" do
    describe "when there is no klass" do
      before { @klass_result_set.klass = nil }
      it { should_not be_valid }
    end
  end
end
