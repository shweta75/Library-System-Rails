class Item < ApplicationRecord
    validates_presence_of :title
 
 def self.to_csv
   attributes = %w{isbn title description author}
   CSV.generate(headers: true) do |csv|
     csv << attributes
     all.find_each do |item|
       csv << attributes.map{ |attr| item.send(attr) }
     end
   end
 end
 
 def self.to_xlsx
   wb = xlsx_package.workbook
 
   wb.styles do |style|
     project_heading = style.add_style(b: true, sz: 14)
     heading = style.add_style(b: true)
 
     wb.add_worksheet(name: "Items") do |sheet|
       # Add a title row
       sheet.add_row ["Books"], style: project_heading
       # Add the date this was downloaded
       sheet.add_row ["Downloaded at", Time.now.strftime("%b %-d, %Y")]
       # Add a blank row
       sheet.add_row []
       # Create the header row
       sheet.add_row ["Isbn", "Title", "Description", "Author"], style: heading
       # Create the database reference row
       sheet.add_row ["isbn", "title", "description", "author"], style: heading
       # Create entries for each item
       @items.each do |item|
         sheet.add_row [item.isbn, item.title, item.description, item.author]
       end
     end
   end
 end

end
