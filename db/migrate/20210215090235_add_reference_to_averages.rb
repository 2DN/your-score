class AddReferenceToAverages < ActiveRecord::Migration[6.0]
  def change
    add_reference :averages, :score
  end
end
