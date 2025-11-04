source "https://rubygems.org"

ruby "~> 3.4.0"

# Core Jekyll
gem "jekyll", "~> 4.4"
gem "webrick", "~> 1.8"

# Theme support
gem "jekyll-remote-theme", "~> 0.4"

# SCSS/Sass
gem "jekyll-sass-converter", "~> 3.0"
gem "sass-embedded", "~> 1.93"

# Address version conflicts
gem "public_suffix", ">= 6.0.2"

# Plugins
group :jekyll_plugins do
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-feed", "~> 0.17"
end

# Platform-specific
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance booster for watching directories on Windows
gem "wdm", "~> 0.2", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock http_parser.rb to v0.6.x on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]
