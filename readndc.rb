require 'csv'
csv = CSV.table(open('themata_url.txt'), col_sep: "\t", converters: nil)
@cls = ""
@work = ""
File.open('kyokasho_all.txt').each do |e|
  line = e.chomp.split("=")
  case line[0]
  when 'ID'
    @work = line[1]
  when 'CLSK'
    @cls = line[1]
  when 'CLSD'
    @cls += " #{line[1]}"
  when '--NACSIS-CATP--'
    csv.each do |a|
      w = Work.where(identifier: @work).first
      subject = Subject.new(url: a[:url])
      subject.work = w
      if subject.save
        puts "#{@work}: #{a[:url]}" if "NDC9 #{a[:ndc]}" == @cls
      end
    end
    @cls = ""
    @work = ""
  end
end
