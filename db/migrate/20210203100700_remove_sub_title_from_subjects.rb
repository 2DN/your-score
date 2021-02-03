class RemoveSubTitleFromSubjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :subjects, :sub_title
  end
end
