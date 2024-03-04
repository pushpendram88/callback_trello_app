class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :trello_card_id
      t.string :text
      t.timestamps
    end
  end
end
