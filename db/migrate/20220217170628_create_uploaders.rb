class CreateUploaders < ActiveRecord::Migration[6.1]
  def change
    create_table :uploaders do |t|

      t.timestamps
    end
  end
end
