class EpisodesController < ApplicationController

  def index
  end

  def import
    feedly_user_id = Rails.application.secrets.feedly_user_id
    feedly_access_token = Rails.application.secrets.feedly_access_token

    url = "https://cloud.feedly.com/v3/streams/ids?streamId=user/" + feedly_user_id + "/tag/global.saved"

    # Get a list of starred ids from feedly API using my credentials
    starred_ids = HTTParty.get(url.to_str,
    :headers => { 'Content-Type' => 'application/json',
                  'Authorization' => feedly_access_token } )

    @output = JSON.pretty_generate(starred_ids)
  end
end
