class SetDefaultCompleted < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  		t.change :completed, :boolean, :default=>false
		end
  end
end
