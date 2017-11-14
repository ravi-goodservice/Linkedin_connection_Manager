class AddScrapedToLinkedinconnectprofiles < ActiveRecord::Migration
  def change
    add_column :linkedinconnectprofiles, :is_scraped, :boolean ,default: false
  end
end
