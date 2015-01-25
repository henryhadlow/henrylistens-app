class AddShowToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :show, :string
  end
end
