require "jekyll"
require "fileutils"
require "jekyll-feed-json/generator"

module JekyllFeedJson
  autoload :MetaTag,          "jekyll-feed-json/meta-tag"
  autoload :PageWithoutAFile, "jekyll-feed-json/page-without-a-file.rb"
end

Liquid::Template.register_tag "feed_json_meta", JekyllFeedJson::MetaTag
