class RemoveReferencesFromScores < ActiveRecord::Migration[6.0]
  def change
    remove_reference :scores, :average
    remove_reference :scores, :subject
  end
end
