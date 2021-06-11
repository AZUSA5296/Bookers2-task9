class AddIntroductionToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :introduction, :text
  end
end
