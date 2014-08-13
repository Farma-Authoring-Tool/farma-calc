module ApplicationHelper
  def markdown(text)
    options = {:hard_wrap => true, :filter_html => true, :autolink => true,
               :no_intraemphasis => true, :fenced_code => true, :gh_blockcode => true}
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(text).html_safe
  end

  # Method added for experiment 53e9fa9f759b743c2d00002f
  def user_belongs_to_control_group
    return false if current_user.nil?
    teams_id = APP_CONFIG[:experiment][:control_group]
    teams_id.each do |id|
      id = Moped::BSON::ObjectId.from_string(id)
      return true if current_user.team_ids.include?(id)
    end
    return false
  end
end
