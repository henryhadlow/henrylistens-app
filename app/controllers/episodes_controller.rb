class EpisodesController < ApplicationController

  def index
  end

  def import
    feedly_user_id = Rails.application.secrets.feedly_user_id
    feedly_access_token = Rails.application.secrets.feedly_access_token

    url_starred_ids = "https://cloud.feedly.com/v3/streams/ids?streamId=user/" + feedly_user_id + "/tag/global.saved"

    # Get a list of starred ids from feedly API using my credentials
    starred_ids = HTTParty.get(url_starred_ids,
    :headers => { 'Content-Type' => 'application/json',
                  'Authorization' => feedly_access_token } )

    body = { "ids" => starred_ids["ids"] }.to_json
    url_starred_items = "https://cloud.feedly.com/v3/entries/.mget"

    # Get full details of starred ids
    starred_items = HTTParty.post(url_starred_items,
    :body => body,
    :headers => { 'Content-Type' => 'application/json' } )

    @output = starred_items
  end

  private
end
