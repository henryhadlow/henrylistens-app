xml.instruct! :xml, :version => "1.0"
xml.rss(:version => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/", "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "xmlns:media" => 'http://search.yahoo.com/mrss/') do
    xml.title "henrylistens"
    xml.description "A podcast of podcasts. Things @henryhadlow likes."
    xml.link root_path
    xml.media(:content, :url => "henrylistens-logo-web.jpg", :type => "image/jpeg")
    xml.language "en-gb"
    xml.copyright "&#x2117; &amp; &#xA9; 2014 John Smith &amp; Family"
    xml.itunes(:subtitle, "A podcast of podcasts. Things @henryhadlow likes.")
    xml.itunes(:author, "Henry Hadlow")
    xml.itunes(:summary, "henrylistens is a feed of episodes from other podcasts. Each week @henryhadlow listens to all sorts of things so you don't have to.")
    xml.itunes(:owner) do
      xml.itunes(:name, "Henry Hadlow")
      xml.itunes(:email, "henry@manofscience.co.uk")
    end
    xml.itunes(:image, "href" => "http://henrylistens-logo-web.jpg") # TO DO
    xml.itunes(:category, "text" => "Society &amp; Culture") do
      xml.itunes(:category, "text" => "Personal Journals")
    end

    @episodes.each do |episode|
      xml.item do
        xml.title episode.title
        xml.description episode.description.html_safe

        json = JSON.parse episode["json"]

      end
    end
  end
end
