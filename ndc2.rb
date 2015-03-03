require 'csv'
CSV.open('ndc9.txt', 'r:utf-8', headers: true, col_sep: "\t").each do |line|
  case line["name_flag"].to_s
  when '1'
    thema = Thema.create!(node: line["ID"])
    nomen1 = Nomen.new(
      name: line["classification"], scheme: 'ndc9',
      dimension: line["dimension"]
    )
    nomen2 = Nomen.create!(name: line["value"])
    nomen2.original_nomina << nomen1
    thema.nomina << nomen1
    puts line["value"]
  end
end
