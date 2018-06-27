class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.string :description

      t.timestamps null: false #create_at, updated_at - atualiza sempre os dados a serem inseridos
    end
  end
end
