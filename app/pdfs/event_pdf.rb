class EventPdf < Prawn::Document

	def initialize(event)
		super(top_margin: 70)
		@event = Event.all
		# title
		# line_items

		# 將.ttf 檔放在/usr/local/lib/ruby/gems/2.4.0/gems/prawn-1.2.1/data/fonts裡面
		# kaiu.ttf 是繁體中文字型
		# gkai00mp.ttf 是簡體中文字型
		file = "#{Prawn::DATADIR}/fonts/kaiu.ttf"
		font_families["Kai"] = {
		 :normal => { :file => file, :font => "Kai" }
		}

		data0 = [ ["人資表"] ]
		table(data0, :column_widths => [540], :cell_style => { :font => 'Kai', :height => 50, :size => 30 })
		
		data1 = [ ["姓名", "#{event.name}", "證號", "#{event.idnumber}"] ]
		table(data1, :column_widths => [90, 180, 90, 180], :cell_style => { :font => 'Kai', :height => 40 })

		if event.sex == true
			sex = "男"
		else
			sex = "女"
		end
		data2 = [ ["駐地", "#{event.station}", "生日", "#{event.birthday}", "性別", "#{sex}"] ]
		table(data2, :column_widths => [90, 135, 45, 90, 45, 135], :cell_style => { :font => 'Kai', :height => 40 })

		data3 = [ ["學歷", "#{event.education}"] ]
		table(data3, :column_widths => [90, 450], :cell_style => { :font => 'Kai', :height => 100 })

		data4 = [ ["經歷", "#{event.experience}"] ]
		table(data4, :column_widths => [90, 450], :cell_style => { :font => 'Kai', :height => 150 })

		data5 = [ ["聯繫方式", "電話", "#{event.phone}", "微信", "#{event.contact}"] ]
		table(data5, :column_widths => [90, 45, 180, 45, 180], :cell_style => { :font => 'Kai', :height => 40 })

		data6 = [ ["", "電郵", "#{event.email}", "地址", "#{event.address}"] ]
		table(data6, :column_widths => [90, 45, 180, 45, 180], :cell_style => { :font => 'Kai', :height => 40 })

		# my_table1 = make_table([ ["Phone"], ["Email"] ])
		# my_table2 = make_table([ ["#{event.phone}"], ["#{event.email}"] ])
		# my_table3 = make_table([ ["WeChat"], ["Address"] ])
		# my_table4 = make_table([ ["#{event.contact}"], ["#{event.address}"] ])
		# table([ ["Contact", my_table1, my_table2, my_table3, my_table4] ], :column_widths => [90, 45, 180, 45, 180])

		data7 = [ ["接觸", "#{event.process}"] ]
		table(data7, :column_widths => [90, 450], :cell_style => { :font => 'Kai', :height => 200 })

		data8 = [ ["考核", "#{event.assess}"] ]
		table(data8, :column_widths => [90, 450], :cell_style => { :font => 'Kai', :height => 220 })

		data9 = [ ["運用", "#{event.use}" ] ]
		table(data9, :column_widths => [90, 450], :cell_style => { :font => 'Kai', :height => 220 })

		data10 = [ ["工作成效", "#{event.effect}"] ]
		table(data10, :column_widths => [90, 450], :cell_style => { :font => 'Kai', :height => 220 })

		# table(data9, :cell_style => { :font => 'Kai', :size => 15, :inline_format => true }, :column_widths => [90, 450])

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