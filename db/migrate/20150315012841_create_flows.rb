class CreateFlows < ActiveRecord::Migration
  def change
    create_table :flows do |t|
      t.string :name

      t.belongs_to :source
      t.belongs_to :sink

      t.decimal :amount

      t.timestamps
    end
  end
end
