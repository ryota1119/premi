module PracticePdf

  require 'prawn/measurement_extensions'

  class EstimatePdf < Prawn::Document
    def initialize(user, company, estimate, estimate_details, customer, contact_person)
      super(page_size: 'A4')
      # stroke_axis(step_length: 50)

      @user = user
      @company = company
      @estimate = estimate
      @estimate_details = estimate_details
      @customer = customer
      @contact_person = contact_person

      font 'app/assets/fonts/SourceHanSansTC-Regular.ttf'

      header
      move_down 30
      body
    end

    def header
      draw_text "#{@estimate.created_at.strftime('%Y/%m/%d')}", at: [450, 750]
      move_down 20
      text "お見積書", :align => :center, size: 20
      move_down 10
      move_down 10
      bounding_box([300,710], :width=>200, :height=>130){
        text "#{@company.name}", size: 15
        move_down 10
        text "〒#{@company.postal_code}", size: 10
        move_down 10
        text "#{@company.address}", size: 10
        move_down 10
        text "TEL : #{@company.tel}", size: 10
        move_down 10
        text "FAX : #{@company.fax}", size: 10
        move_down 10
        text "担当者 : #{@user.name}", size: 10
      }
      
      bounding_box([20,710], :width=>250, :height=>70){
        move_down 40
        draw_text "御中", size: 15, at: [210, 40]
        stroke_horizontal_rule
        move_down 30
        draw_text "様", size: 15, at: [210, 10]
        stroke_horizontal_rule
        bounding_box([0, 70], :width=>210, :height=>40){
          text "#{@customer.company_name}",size: 15, align: :center, valign: :center
        }
        bounding_box([0, 30], :width=>210, :height=>30){
          text "#{@contact_person.name}",size: 15, align: :center, valign: :center
        }
      }

      bounding_box([20, 620], :width=>250, :height=>25){
        text "有効期限：", valign: :center
        bounding_box([60, 25], :width=>150, :height=>25){
          text "#{@estimate.effective}", align: :center, valign: :center
          move_down 10
          stroke_horizontal_line  0, 150, :at=> 0
        }
      }

      bounding_box([20, 570], :width=>250, :height=>50){
        font_size(8)
        text "下記の通りお見積り申し上げます。"
        move_down 15
        font_size(13)
        text "お見積り金額"
        move_down 5
        line_width(2)
        stroke_horizontal_rule
      }
    end
    
    def body
      bounding_box([20, 500], :width=>480, :height=>350){
        subtotal = 0
        y = 307
        @estimate_details.each do |detail|
          amount = detail.volume.to_i * detail.price.to_i
          draw_text "#{detail.item.item_name}",size: 15, at: [10, y]
          text_box "#{detail.volume.to_i.to_s(:delimited)}", :at => [230, (y + 20)], :size => 15, :width => 70, :height => 25, :align => :right, :valign => :center
          text_box "#{detail.price.to_i.to_s(:delimited)}", :at => [310, (y + 20)], :size => 15, :width => 70, :height => 25, :align => :right, :valign => :center
          text_box "#{amount.to_s(:delimited)}", :at => [390, (y + 20)], :size => 15, :width => 80, :height => 25, :align => :right, :valign => :center
          y -= 25
          subtotal += amount
        end
        
        tax = subtotal / 10
        total = subtotal + tax
        bounding_box([90, 405], :width=>160, :height=>25){
          text "#{total.to_s(:delimited)}", size: 22, align: :center, valign: :center
        }
        text_box "", :at => [90, 405], :size => 20, :width => 160, :height => 25

        stroke_bounds
        
        horizontal_line(0, 480, at: 325)
        horizontal_line(0, 480, at: 75)
        vertical_line(75, 350, at: 230)
        vertical_line(0, 350, at: 390)
        
        stroke
        
        line_width(0.2)
        
        horizontal_line(0, 480, at: 300)
        horizontal_line(0, 480, at: 275)
        horizontal_line(0, 480, at: 250)
        horizontal_line(0, 480, at: 225)
        horizontal_line(0, 480, at: 200)
        horizontal_line(0, 480, at: 175)
        horizontal_line(0, 480, at: 150)
        horizontal_line(0, 480, at: 125)
        horizontal_line(0, 480, at: 100)
        horizontal_line(0, 480, at: 50)
        horizontal_line(0, 480, at: 25)
        vertical_line(75, 350, at: 310)
        
        stroke
        
        font_size(8)
        
        bounding_box([0, 350], :width=>480, :height=>25){
        text_box('項　目', at: [0, 25], :width=>230, :height=>25, align: :center, valign: :center)
        text_box('数　量', at: [230, 25], :width=>80, :height=>25, align: :center, valign: :center)
        text_box('単　価', at: [310, 25], :width=>80, :height=>25, align: :center, valign: :center)
        text_box('金　額', at: [390, 25], :width=>90, :height=>25, align: :center, valign: :center)
      }
      bounding_box([0, 75], :width=>325, :height=>75){
        text_box('小計', at: [0, 75], :width=>380, :height=>25, align: :right, valign: :center)
        text_box "#{subtotal.to_s(:delimited)}", at: [380, 75], :size => 15, :width=>90, :height=>25, align: :right, valign: :center
        text_box('消費税(10％)', at: [0, 50], :width=>380, :height=>25, align: :right, valign: :center)
        text_box "#{tax.to_s(:delimited)}", at: [380, 50], :size => 15, :width=>90, :height=>25, align: :right, valign: :center
        text_box('合計', at: [0, 25], :width=>380, :height=>25, align: :right, valign: :center)
        text_box "#{total.to_s(:delimited)}", at: [380, 25], :size => 15, :width=>90, :height=>25, align: :right, valign: :center
      }

      }
      bounding_box([20, 130], :width=>480, :height=>130){
        line_width(1)
        stroke_bounds
        horizontal_line(0.mm, 90.mm, at: 20.mm)
      }
    end
  end
end