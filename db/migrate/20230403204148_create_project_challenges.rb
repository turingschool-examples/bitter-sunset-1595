class CreateProjectChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :project_challenges do |t|
      t.references :projects, foreign_key: true
      t.references :challenges, foreign_key: true
    
      t.timestamps
    end
  end
end
