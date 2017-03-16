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

		data0 = [ ["Human List"] ]
		table(data0, :column_widths => [540])
		
		data1 = [ ["Name", "#{event.name}", "IDnumber", "#{event.idnumber}"] ]
		table(data1, :column_widths => [90, 180, 90, 180])

		data2 = [ ["Station", "#{event.station}", "Birthday", "#{event.birthday}", "Sex", "OOO"] ]
		table(data2, :column_widths => [90, 135, 45, 90, 45, 135])

		data3 = [ ["Education", "#{event.education}"] ]
		table(data3, :column_widths => [90, 450])

		data4 = [ ["Experience", "#{event.experience}"] ]
		table(data4, :column_widths => [90, 450])

		data5 = [ ["Contact", "Phone", "#{event.phone}", "WeChat", "#{event.contact}"] ]
		table(data5, :column_widths => [90, 45, 180, 45, 180])

		data6 = [ ["", "Email", "#{event.email}", "Address", "#{event.address}"] ]
		table(data6, :column_widths => [90, 45, 180, 45, 180])

		# my_table1 = make_table([ ["Phone"], ["Email"] ])
		# my_table2 = make_table([ ["#{event.phone}"], ["#{event.email}"] ])
		# my_table3 = make_table([ ["WeChat"], ["Address"] ])
		# my_table4 = make_table([ ["#{event.contact}"], ["#{event.address}"] ])
		# table([ ["Contact", my_table1, my_table2, my_table3, my_table4] ], :column_widths => [90, 45, 180, 45, 180])

		data7 = [ ["Process", "#{event.process}"] ]
		table(data7, :column_widths => [90, 450])

		data8 = [ ["Assess", "#{event.assess}"] ]
		table(data8, :column_widths => [90, 450])

		data9 = [ ["Use", "#{event.use}" ] ]
		table(data9, :column_widths => [90, 450])

		data10 = [ ["Effect", "#{event.effect}"] ]
		table(data10, :column_widths => [90, 450])
		
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