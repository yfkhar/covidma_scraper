class CreateReportsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :excluded_cases
      t.integer :total_cases
      t.integer :total_deaths
      t.integer :total_recovery
      t.datetime :reported_at
    
      t.timestamps
    end
    
  end
end
