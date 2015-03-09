require 'csv'
csv = CSV.table(open('themata_url.txt'), col_sep: "\t", converters: nil)
csv_hash = {}
csv.map{|row| csv_hash.store(row[:ndc], row[:url])}
@clsk = @clsd = ""
@work = ""
File.open('kyokasho_all.txt').each do |e|
  line = e.chomp.split("=")
  case line[0]
  when 'ID'
    @work = line[1]
  when 'CLSK'
    @clsk = line[1]
  when 'CLSD'
    @clsd = line[1]
  when '--NACSIS-CATP--'
    w = Work.where(identifier: @work).first
    url = csv_hash["#{@clsd.strip}"]
    subject = Subject.create(url: url)
    w.subjects << subject if w
    puts url
    @clsk = @clsd = ""
    @work = ""
  end
end
