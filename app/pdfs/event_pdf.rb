class EventPdf < Prawn::Document

	def initialize(event)
		super(top_margin: 25)
		@event = Event.all

		# line_items

		# 將.ttf 檔放在/usr/local/lib/ruby/gems/2.4.0/gems/prawn-1.2.1/data/fonts裡面
		# kaiu.ttf 是繁體中文字型
		# gkai00mp.ttf 是簡體中文字型
		file = "#{Prawn::DATADIR}/fonts/kaiu.ttf"
		font_families["Kai"] = {
		 :normal => { :file => file, :font => "Kai" }
		}
		font "Kai"

		# line
		stroke do
			self.line_width = 10
			line [250, 1000], [-50, 700]
		 	line [280, 1000], [-50, 670]
		end

		Time.zone = "Taipei"
		text "製表日期：#{event.updated_at.strftime("%Y/%m/%d")}", size: 12, align: :right

		title
		data0 = [ ["人資表"] ]
		table(data0, :column_widths => [540], :cell_style => { :height => 40, :size => 20 })

		data1 = [ ["姓名", "#{event.name}", "證號", "#{event.idnumber}", "資審", "是"] ]
		table(data1, :column_widths => [90, 140, 65, 130, 65, 50], :cell_style => { :height => 40, :size => 14 })

		if event.sex == true
			sex = "男"
		else
			sex = "女"
		end
		data2 = [ ["駐地", "#{event.station}", "生日", "#{event.birthday.strftime("%Y/%m/%d")}", "性別", "#{sex}"] ]
		table(data2, :column_widths => [90, 140, 65, 130, 65, 50], :cell_style => { :height => 40, :size => 14 })

		data3 = [ ["學歷", "#{event.education}"] ]
		table(data3, :column_widths => [90, 450], :cell_style => { :height => 100, :size => 14 })

		data4 = [ ["經歷", "#{event.experience}"] ]
		table(data4, :column_widths => [90, 450], :cell_style => { :height => 150, :size => 14 })

		data5 = [ ["聯繫方式", "電話", "#{event.phone}", "即時通訊", "#{event.contact}"] ]
		table(data5, :column_widths => [90, 45, 120, 85, 200], :cell_style => { :height => 35, :size => 14 })

		data6 = [ ["", "電郵", "#{event.email}", "地址", "#{event.address}"] ]
		table(data6, :column_widths => [90, 45, 120, 85, 200], :cell_style => { :height => 35, :size => 14 })

		# my_table1 = make_table([ ["Phone"], ["Email"] ])
		# my_table2 = make_table([ ["#{event.phone}"], ["#{event.email}"] ])
		# my_table3 = make_table([ ["WeChat"], ["Address"] ])
		# my_table4 = make_table([ ["#{event.contact}"], ["#{event.address}"] ])
		# table([ ["Contact", my_table1, my_table2, my_table3, my_table4] ], :column_widths => [90, 45, 180, 45, 180])

		data7 = [ ["接觸經過", "#{event.process}"] ]
		table(data7, :column_widths => [90, 450], :cell_style => { :height => 242, :size => 14 })

		page

		title

		data8 = [ ["考核策進", "#{event.assess}"] ]
		table(data8, :column_widths => [90, 450], :cell_style => { :height => 248, :size => 14 })

		data9 = [ ["運用規劃", "#{event.use}" ] ]
		table(data9, :column_widths => [90, 450], :cell_style => { :height => 248, :size => 14 })

		data10 = [ ["匯補紀錄", "YOYOYO"] ]
		table(data10, :column_widths => [90, 450], :cell_style => { :height => 200, :size => 14 })

		page

		title

		data11 = [ ["工作成效", "#{event.effect}"] ]
		table(data11, :column_widths => [90, 450], :cell_style => { :height => 300, :size => 14 })

		# table(data9, :cell_style => { :font => 'Kai', :size => 15, :inline_format => true }, :column_widths => [90, 450])

	end

	def title
		move_down 15
		text "嘰嘰喳喳(好久好久以後才可以看)", size: 12
	end

	def page
		start_new_page		# 下一頁
		
		string = "第<page>頁，共3頁"
	    options = {
		    :at => [bounds.left + 0, 0],	# 從左邊算起[0,0]的位置
		    :align => :center,				# 置中
		    :start_count_at => 1			# 頁碼從1開始
		}
	    number_pages string, options
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