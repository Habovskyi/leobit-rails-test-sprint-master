# frozen_string_literal: true

class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.string  :full_name
      t.text    :description
      t.integer :number_of_oscars, default: 0
      t.string  :gender
      t.boolean :is_married, default: false

      t.timestamps
    end
  end
end
