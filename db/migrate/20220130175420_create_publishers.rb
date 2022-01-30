class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :nazwa

      t.timestamps
    end
  end
end
