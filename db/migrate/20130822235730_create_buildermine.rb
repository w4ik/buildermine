class CreateBuildermine < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
	    t.integer :taskid
            t.string :description
	    t.integer :subtaskid
    end    
  end
 
  def down
    drop_table :tasks
  end

end
