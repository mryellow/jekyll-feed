module JekyllFeedJson
  class Generator < Jekyll::Generator
    safe true
    priority :lowest

    # Main plugin action, called by Jekyll-core
    def generate(site)
      puts "Generating JSON feed..."

      @site = site
      return if file_exists?(feed_path)
      @site.pages << content_for_file(feed_path)
    end

    private

    # Path to feed from config, or feed.json for default
    def feed_path
      if @site.config["feed"] && @site.config["feed"]["path"]
        @site.config["feed"]["path"]
      else
        "feed.json"
      end
    end

    # Checks if a file already exists in the site source
    def file_exists?(file_path)
      if @site.respond_to?(:in_source_dir)
        File.exist? @site.in_source_dir(file_path)
      else
        File.exist? Jekyll.sanitized_path(@site.source, file_path)
      end
    end

    # Generates contents for a file
    def content_for_file(file_path)
      file = PageWithoutAFile.new(@site, File.dirname(__FILE__), "", file_path)

      config = Jekyll.configuration({})
      uri = config['url'] + config['baseurl']

      data = {
        :version => "https://jsonfeed.org/version/1",
        :title => config['title'],
        :home_page_url => uri,
        :feed_url => uri + "/feed.json",
        :items => []
      }

      @site.posts.docs.each do |page|
        next if page.data['draft']

        data[:items].push({
          :id => page.id,
          :url => uri + page.url,
          :title => page.data['title'],
          :summary => page.data['excerpt'],
          :date_published => DateTime.parse(page.data['date'].to_s).rfc3339,
          :author => page.data['author'],
          :tags => page.data['categories'] # TODO: CSV the array?
        })
      end

      file.content = JSON.generate(data)
      file.data["layout"] = nil
      file.data["sitemap"] = false
      #file.data["xsl"] = file_exists?("feed.xslt.xml")
      file.output
      file
    end
  end
end
