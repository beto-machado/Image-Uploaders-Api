class AddSlugToUploader < ActiveRecord::Migration[6.1]
  def change
    add_column :uploaders, :slug, :string, null: false
    add_index :uploaders, :slug, unique: true
  end
end
