require 'csv'
CSV.open('ndc9.txt', 'r:utf-8', headers: true, col_sep: "\t").each do |line|
  case line["name_flag"].to_s
  when '1'
    thema = Thema.where(node: line["ID"]).first
    if line["parent"].present?
      parent_thema = Nomen.where(name: line["parent"], scheme: 'ndc9').first.try(:themata).try(:first)
      thema.parent = parent_thema
      thema.save
    end
    puts line["value"]
  end
end
