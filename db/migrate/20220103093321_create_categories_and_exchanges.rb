class CreateCategoriesAndExchanges < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    create_table :exchanges do |t|
      t.string :name
      t.integer :amount
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end

    create_table :categories_exchanges, id: false do |t|
      t.belongs_to :category
      t.belongs_to :exchange
    end
  end
end
