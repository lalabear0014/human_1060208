class EventPdf < Prawn::Document

	def initialize(event)
		super(top_margin: 70)
		@event = Event.all
		# title
		# line_items

		file = "#{Prawn::DATADIR}/fonts/gkai00mp.ttf"
		font_families["Kai"] = {
		 :normal => { :file => file, :font => "Kai" }
		}

		data0 = [ ["人資表"] ]
		table(data0, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [540])
		
		data1 = [ ["姓名", "#{event.name}", "證號", "looooooooooooooooooooooooooooooong"] ]
		table(data1, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 180, 90, 180])

		data2 = [ ["駐地", "隕石坑", "生日", "#{event.birthday}", "性別", "OOO"] ]
		table(data2, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 135, 45, 90, 45, 135])

		data3 = [ ["學歷", "怪獸大學"] ]
		table(data3, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 450])

		data4 = [ ["經歷", "老師"] ]
		table(data4, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 450])

		data5 = [ ["聯繫方式", "電話", "#{event.phone}", "微信", "#{event.contact}"] ]
		table(data5, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 45, 180, 45, 180])

		data6 = [ ["", "電郵", "#{event.email}", "地址", "#{event.address}"] ]
		table(data6, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 45, 180, 45, 180])

		# my_table1 = make_table([ ["Phone"], ["Email"] ])
		# my_table2 = make_table([ ["#{event.phone}"], ["#{event.email}"] ])
		# my_table3 = make_table([ ["WeChat"], ["Address"] ])
		# my_table4 = make_table([ ["#{event.contact}"], ["#{event.address}"] ])
		# table([ ["Contact", my_table1, my_table2, my_table3, my_table4] ], :column_widths => [90, 45, 180, 45, 180])

		data7 = [ ["接觸", "保育"] ]
		table(data7, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 450])

		data8 = [ ["考核", "一二三"] ]
		table(data8, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 450])

		data9 = [ ["運用", "四五六" ] ]
		table(data9, :cell_style => { :font => 'Kai', :inline_format => true }, :column_widths => [90, 450])

		data10 = [ ["工作成效", "好極了！"] ]
		table(data10, :cell_style => { :font => 'Kai', :size => 15, :inline_format => true }, :column_widths => [90, 450])
	
	end

	def title
		text "Human List", size: 30, style: :bold
	end

	def line_items
		move_down 15
		table line_item_rows do
			row(0).font_style = :bold
			column(1..3).align = :right
			self.row_colors = ["DDDDDD", "FFFFFF"]
			self.header = true
		end
	end

	def line_item_rows
		[["Name", "Birthday", "Email", "Phone", "QQ 0r WeChat", "Address"]] +
		@event.map do |item|
			[item.name, item.birthday, item.email, item.phone, item.contact, item.address]
		end
	end

end