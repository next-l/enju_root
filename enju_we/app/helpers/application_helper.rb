module ApplicationHelper
  def frbr_graph(resource)
    File.open("#{Rails.root.to_s}/public/#{resource.class.to_s.downcase.pluralize}/#{resource.id}.svg").read.html_safe if Setting.generate_graph
  rescue Errno::ENOENT
  end

  def subject_label(url)
    JSON.parse(Faraday.get("#{url}.json").body)["term"]
  end
end
