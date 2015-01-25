class AddJsonToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :json, :text
  end
end
