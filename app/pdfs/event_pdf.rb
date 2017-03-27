class EventPdf < Prawn::Document

	def initialize(event)
		super(top_margin: 30)

		font_family

		# double_line
		stroke do
			self.line_width = 10
			line [250, 1000], [-50, 700]
		 	line [280, 1000], [-50, 670]
		end

		# update_time
		Time.zone = "Taipei"
		text "製表日期：#{event.updated_at.strftime("%Y/%m/%d")}", size: 12, align: :right

		header_footer(event)

	end

	def font_family
		# 將.ttf 檔放在/usr/local/lib/ruby/gems/2.4.0/gems/prawn-1.2.1/data/fonts裡面
		# kaiu.ttf 是繁體中文字型
		# gkai00mp.ttf 是簡體中文字型
		file = "#{Prawn::DATADIR}/fonts/kaiu.ttf"
		font_families["Kai"] = {
			:normal => { :file => file, :font => "Kai" }
		}
		font "Kai"
	end

	def table_content(event)
		font_family

		# title
		data0 = [ ["人資表"] ]
		table(data0, :column_widths => [540], :cell_style => { :size => 20 })

		if event.data_validation == true
			data_validation = "是"
		else
			data_validation = "否"
		end

		data1 = [ ["姓名", "#{event.name}", "證號", "#{event.idnumber}", "資審", "#{data_validation}"] ]
		table(data1, :column_widths => [90, 140, 65, 130, 65, 50], :cell_style => { :size => 14 })

		if event.sex == true
			sex = "男"
		else
			sex = "女"
		end
		data2 = [ ["駐地", "#{event.station}", "生日", "#{event.birthday.strftime("%Y/%m/%d")}", "性別", "#{sex}"] ]
		table(data2, :column_widths => [90, 140, 65, 130, 65, 50], :cell_style => { :size => 14 })

		data3 = [ ["學歷", "#{event.education}"] ]
		table(data3, :column_widths => [90, 450], :cell_style => { :size => 14 })

		data4 = [ ["經歷", "#{event.experience}"] ]
		table(data4, :column_widths => [90, 450], :cell_style => { :size => 14 })

		data5 = [ ["聯繫方式", "電話", "#{event.phone}", "即時通訊", "#{event.contact}"] ]
		table(data5, :column_widths => [90, 45, 120, 85, 200], :cell_style => { :size => 14 })

		data6 = [ ["", "電郵", "#{event.email}", "地址", "#{event.address}"] ]
		table(data6, :column_widths => [90, 45, 120, 85, 200], :cell_style => { :size => 14 })

		# my_table1 = make_table([ ["電話"], ["電郵"] ])
		# my_table2 = make_table([ ["#{event.phone}"], ["#{event.email}"] ])
		# my_table3 = make_table([ ["即時通訊"], ["地址"] ])
		# my_table4 = make_table([ ["#{event.contact}"], ["#{event.address}"] ])
		# table([ ["聯繫方式", my_table1, my_table2, my_table3, my_table4] ], :column_widths => [90, 45, 120, 85, 200], :cell_style => { :size => 14 })

		data7 = [ ["接觸經過", "#{event.process}"] ]
		table(data7, :column_widths => [90, 450], :cell_style => { :size => 14 })

		data8 = [ ["考核策進", "#{event.assess}"] ]
		table(data8, :column_widths => [90, 450], :cell_style => { :size => 14 })

		data9 = [ ["運用規劃", "#{event.use}" ] ]
		table(data9, :column_widths => [90, 450], :cell_style => { :size => 14 })

		data10 = [ ["匯補紀錄", "#{event.money}"] ]
		table(data10, :column_widths => [90, 450], :cell_style => { :size => 14 })

		data11 = [ ["工作成效", "#{event.effect}"] ]
		table(data11, :column_widths => [90, 450], :cell_style => { :size => 14 })
	end

	def title
		text "嘰嘰喳喳(好久好久以後才可以看)", size: 12
	end

	def header_footer(event)
		font_family

		# body
		bounding_box([bounds.left, bounds.top - 25], :width  => bounds.width, :height => bounds.height - 50) do
			table_content(event)
		end

		repeat :all do
		    # header
		    bounding_box([bounds.left+10, bounds.top-9], :width => bounds.width) do
		        cell :content => title,
		             #:background_color => 'FFFFFF',
		             :width => bounds.width,
		             :height => 0,
		             :align => :left,
		             #:text_color => "000000"
		             #:borders => [:bottom],
		             #:border_width => 2,
		             :border_color => 'FFFFFF'
		             #:padding => 12
		    end    
	  	end

	  	# footer
		bounding_box([bounds.left, bounds.bottom-10], :width => bounds.width) do
		    # start_new_page		# 下一頁
		    string = "第<page>頁，共<total>頁"
		    options = {
			    :at => [bounds.left+0, 0],		# 從左邊算起[0,0]的位置
			    :align => :center,				# 置中
			    :start_count_at => 0,			# 頁碼從1開始
			    :page_filter => :all,
			    :size => 10
			}
		    number_pages string, options
		end
	end

end