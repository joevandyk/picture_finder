class FindController < ApplicationController
  def create
    query = params[:query]
    search_uri = "http://api.search.live.net/xml.aspx"
    r = RestClient.get(search_uri,
                       :params => {
                         :query => query,
                         :sources => 'image',
                         "Image.Filters" => 'Size:Medium',
                         :Appid => 'C3153D6EC8CD21E7BC784BD3087A3B415C352027'})
    n = Nokogiri(r).remove_namespaces!
    results = n.css('MediaUrl')
    if results.present?
      image = results[rand(results.length)].content
      flash[:notice] = "Found one!"
      redirect_to root_path(:image => Base64.encode64(image), :query => query)
    else
      flash[:notice] = "Sorry, nothing found"
      redirect_to root_path(:query => query)
    end
  end
end
