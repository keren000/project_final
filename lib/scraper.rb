class ProjectFinal::Scraper
  def initialize(url = nil)
    @url = url
  end

def scrape_article_info
 @doc = Nokogiri::HTML(open("https://www.cosmopolitan.fr/,20-livres-cultes-a-avoir-lu-au-moins-une-fois-dans-sa-vie,1967630.asp"))
 @doc.search("div.Article-slide").each do |article_l|
  info = ProjectFinal::Info.new
   a_t = article_l.search("a")

   info.url = a_t.attr("href").text
   info.title = article_l.search("div.Article-slideTitle").text
   info.summary = article_l.search("div.Article-slideText.Article-text").text

   info.save
  end
end



end
