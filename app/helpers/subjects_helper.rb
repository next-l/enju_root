module SubjectsHelper
  def subject_label(url)
    JSON.parse(Faraday.get("#{url}.json").body)["term"]
  end
end
