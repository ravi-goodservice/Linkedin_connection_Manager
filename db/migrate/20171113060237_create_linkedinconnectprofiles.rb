class CreateLinkedinconnectprofiles < ActiveRecord::Migration
  def change
    create_table :linkedinconnectprofiles do |t|
      t.string :linkedinid
      t.string :connectionsent
      t.string :ConnectionSentByAccount
      t.datetime :connectiondatetime

      t.timestamps null: false
    end
  end
end
