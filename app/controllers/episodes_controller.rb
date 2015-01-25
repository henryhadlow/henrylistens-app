class EpisodesController < ApplicationController

  def index
  end

  def import
    feedly_user_id = Rails.application.secrets.feedly_user_id
    feedly_access_token = Rails.application.secrets.feedly_access_token

    # Get a list of starred ids from feedly API using my credentials
    url_starred_ids = "https://cloud.feedly.com/v3/streams/ids?streamId=user/" + feedly_user_id + "/tag/global.saved"
    starred_ids = HTTParty.get(url_starred_ids,
    :headers => { 'Content-Type' => 'application/json',
                  'Authorization' => feedly_access_token } )

    # Compare ids to the database and remove duplicates

    # Get full details of starred ids
    body = { "ids" => starred_ids["ids"] }.to_json
    url_starred_episodes = "https://cloud.feedly.com/v3/entries/.mget"
    starred_episodes = HTTParty.post(url_starred_episodes,
    :body => body,
    :headers => { 'Content-Type' => 'application/json' } )

    # Store the episodes in the db
    starred_episodes.each do |episode|
      # Select keys to store in db
      episode_to_store = {
        :feedly_id => episode["id"],
        :show => episode["origin"]["title"],
        :title => episode["title"],
        :description => episode["summary"]["content"],
        # and store the whole response as json
        :json => episode.to_json
      }
      Episode.create!(episode_to_store.to_hash)
    end

  end

end
