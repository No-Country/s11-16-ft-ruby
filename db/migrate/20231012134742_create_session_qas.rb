class CreateSessionQas < ActiveRecord::Migration[7.0]
  def change
    create_table :session_qas do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
