class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :trouble_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
  end
end
