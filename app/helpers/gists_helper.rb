module GistsHelper
  def gist_hash(gist_url)
    /(?<=com\/).*/.match(gist_url)
  end
end
