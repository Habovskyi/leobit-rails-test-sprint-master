# frozen_string_literal: true

class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :name
      t.text   :description

      t.timestamps
    end
  end
end
