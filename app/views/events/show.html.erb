<div class="container">
    <div id="main" class="row">
		<h1><b><%= @event.name %></b>
		<%= link_to '編輯', edit_event_path(@event), :class => "btn btn-success", :type => 'edit' %></h1>
		
		<b>基本資料：</b>
		<dl class="dl-horizontal">
			<dt>證號：</dt>
			<dd><%= @event.idnumber %></dd>

			<dt>資審：</dt>
			<% if @event.data_validation == true %>	
				<dd>是</dd>
			<% else %>
				<dd>否</dd>
			<% end %>

			<dt>駐地：</dt>
			<dd><%= @event.station %></dd>

			<dt>生日：</dt>
			<dd><%= @event.birthday.strftime("%Y/%m/%d") %></dd>
			
			<dt>性別：</dt>
			<% if @event.sex == true %>	
				<dd>男</dd>
			<% else %>
				<dd>女</dd>
			<% end %>
				
			<dt>學歷：</dt>
			<dd><%= @event.education %></dd>

			<dt>經歷：</dt>
			<dd><%= @event.experience %></dd>
		</dl>

		<b>聯繫方式：</b>
		<dl class="dl-horizontal">
			<dt>電話：</dt>
			<dd><%= @event.phone %></dd>
			<dt>即時通訊：</dt>
			<dd><%= @event.contact %></dd>
			<dt>電郵：</dt>
			<dd><%= @event.email %></dd>
			<dt>地址：</dt>
			<dd><%= @event.address %></dd>
		</dl>

		<table class="table">	
			<tr>
				<td><b>接觸經過</b></td>
				<td><%= simple_format @event.process %></td>
			</tr>
			<tr>
				<td><b>考核策進</b></td>
				<td><%= simple_format @event.assess %></td>
			</tr>
			<tr>
				<td><b>運用規劃</b></td>
				<td><%= simple_format @event.use %></td>
			</tr>
			<tr>
				<td><b>匯補紀錄</b></td>
				<td><%= simple_format @event.money %></td>
			</tr>
			<tr>
				<td><b>工作成效</b></td>
				<td><%= simple_format @event.effect %></td>
			</tr>
			<tr>
				<td><b>檔案上傳</b></td>
				<td><%= image_tag @event.avatar.url(:medium) %></td>
			</tr>
		</table>

		<b><em>留言訊息：</em></b>	
		<table class="table">
			<% @event.messages.each do |e| %>
				<tr>
					<td>
						<%= e.content %>
					</td>
					<td>
						<%= e.user.try(:short_name) %>
					</td>
					<td>				
						<%= link_to '編輯', edit_event_message_path(@event, e), :class => "btn btn-primary" %>
						<%= link_to '刪除', event_message_path(@event, e), :method => :delete, :class => "btn btn-danger" %>
						<!-- 確認視窗 -->
						<!-- :data => { :confirm => "Are you sure?" } -->
					</td>
					<td>
						<% Time.zone = "Taipei" %>
						<%= e.updated_at.strftime("%Y/%m/%d %T") %>
					</td>			
				</tr>
			<% end %>
		</table>
	</div>
</div>