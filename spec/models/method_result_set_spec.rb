require 'rails_helper'
require 'method_result_set'

describe MethodResultSet do
  it { expect(MethodResultSet.reflect_on_association(:methood).macro).to eq(:belongs_to) }
  it { expect(MethodResultSet.reflect_on_association(:result_set_group).macro).to  eq(:has_one) }


  before :each do
    @user = User.create(email: "bla@bla.com", password: "blablabla")
    @project = Project.new(name: "Project1", display_tasks: false, user: @user)
    @klass = Klass.new(name: "Klass1", package: "default", project: @project, is_total: false, display_tasks: true)
    @methood = Methood.new(name: "Method1", klass: @klass)
    @method_result_set = MethodResultSet.new(methood: @methood,
                                            number_of_lines: 10,
                                            complexity: 2)
  end


  subject { @method_result_set } 

  it { should respond_to :methood }
  it { should respond_to :number_of_lines } 
  it { should respond_to :complexity } 

  describe "Validation" do
    describe "when there is no method" do
      before { @method_result_set.methood = nil }
      it { should_not be_valid }
    end
  end
end
