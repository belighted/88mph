if Rails.env.production?
  ActionMailer::Base.default_url_options[:host] = "belighted-88mph.heroku.com"
else
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end
