class AddScrapedDatetimeToLinkedinconnectprofiles < ActiveRecord::Migration
  def change
    add_column :linkedinconnectprofiles, :scraped_datetime, :datetime
  end
end
