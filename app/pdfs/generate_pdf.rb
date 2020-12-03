class GeneratePdf < Prawn::Document
    def initialize(items)
      super()
      @items = items
      header
      text_content
      table_content
    end
    
    def header
      #This inserts an image in the pdf file and sets the size of the image
      image "#{Rails.root}/app/assets/images/image_rails.png", width: 530, height: 150
    end
    
    def text_content
      # The cursor for inserting content starts on the top left of the page.
      # Here we move it down a little to create more space between the text and the image inserted above
      y_position = cursor - 50
    
      # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
     
     
      # bounding_box([200, y_position], :width => 270, :height => 300) do
      #   text "**************Library books List**************", size: 15, style: :bold
      # end
    
      # bounding_box([300, y_position], :width => 270, :height => 300) do
      #   text "Put any text here.", size: 15, style: :bold
      #   text "Put any text here."
      # end
    
    end
    
    def table_content
      # This makes a call to items_rows and gets back an array of data that will populate the columns
      # rows of a table
      # I have then included some styling to include a header and make its text bold
      # and made the row background colors alternate between grey and white
      # Then I have set the table column widths
      table items_rows do
        row(0).font_style = :bold
        self.header = true
        self.row_colors = ['DDDDDD', 'FFFFFF']
        # self.column_widths = [540, 540, 540, 540]
      end
    end
    
    def items_rows
      [['isbn', 'Title', 'Description', 'Author']] +
        @items.map do |item|
        [item.id, item.title, item.description, item.author]
      end
    end
   end
   