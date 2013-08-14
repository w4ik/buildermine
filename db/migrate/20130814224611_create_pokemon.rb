class CreatePokemon < ActiveRecord::Migration
  def up
	  create_table :pokemons do |t|
		  t.string :name
		  t.string :power	  
          end
  end

  def down
	  drop_table :models
  end
end
