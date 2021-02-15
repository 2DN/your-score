class AddReferenceToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :subjects, :score
  end
end
