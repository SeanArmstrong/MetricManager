class ResultSetGroup < ActiveRecord::Base
  belongs_to :result_set, :polymorphic => true
end
