class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.timestamps

      t.string :title #追加
      t.text :body #追加
      t.integer :user_id #追加

    end
  end
end
