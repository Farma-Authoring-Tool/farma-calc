Rails.application.routes.default_url_options[:host] = APP_CONFIG[:host][Rails.env.to_sym]

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "educacional.c3sl.ufpr.br",
  :user_name            => ENV['GMAIL_USERNAME'],
  :password             => ENV['GMAIL_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
