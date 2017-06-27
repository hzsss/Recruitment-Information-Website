<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<%@ include file = "head.txt" %>
</head>
<body>
<center><form action="helpPublish" name="form" method="post">
		<table>
			<tr>
				<tb>信息类别</tb>
				<tb>
				<select name="newstype"> 
				<option value="餐饮">餐饮</option> 
      			<option value="家政">家政</option> 
      			<option value="美容美发">美容美发</option>
      			<option value="旅游">旅游</option>
      			<option value="娱乐休闲">娱乐休闲</option>
				<option value="保健按摩">保健按摩</option> 
      			<option value="运动健身">运动健身</option> 
      			<option value="人事后勤">人事后勤</option>
      			<option value="行政">行政</option>
      			<option value="司机">司机</option>   
				<option value="高级管理">高级管理</option> 
      			<option value="销售">销售</option> 
      			<option value="客服">客服</option>
      			<option value="采购贸易">采购贸易</option>
      			<option value="超市百货零售">超市百货零售</option>   
				<option value="淘宝">淘宝</option> 
      			<option value="房产中介">房产中介</option> 
      			<option value="酒店">酒店</option>
      			<option value="市场媒介公关">市场媒介公关</option>
      			<option value="广告会展">广告会展</option>   
				<option value="美术创意设计">美术创意设计</option> 
      			<option value="技工">技工</option> 
      			<option value="生产管理研发">生产管理研发</option>
      			<option value="物流仓储">物流仓储</option>
      			<option value="服装纺织">服装纺织</option>   
				<option value="质检">质检</option> 
      			<option value="汽车制造">汽车制造</option> 
      			<option value="计算机网络通信">计算机网络通信</option>
      			<option value="电子电气">电子电气</option>
      			<option value="机械仪表仪器">机械仪表仪器</option>   
				<option value="法律">法律</option> 
      			<option value="教育培训">教育培训</option> 
      			<option value="翻译">翻译</option>
      			<option value="编辑印刷">编辑印刷</option>
      			<option value="审计统计">审计统计</option>   
				<option value="保险">保险</option> 
      			<option value="医院医疗护理">医院医疗护理</option> 
      			<option value="制药">制药</option>
      			<option value="环保">环保</option>
      			<option value="建筑">建筑</option>   
				<option value="物业管理">物业管理</option> 
      			<option value="农林牧渔业">农林牧渔业</option> 
      			<option value="其他">其他</option>    
				</select>
			</tr><br>
			<tr>
				<tb>信息标题</tb>
				<tb><input type="text" name="title"></tb>
			</tr><br>
			<tr>
				<td>请输入要发布的招聘信息</td>
			</tr>
			<tr>
				<td><TextArea name="message" Rows="6" Cols="80"></TextArea></td>
			</tr>
		
			<tr>
				您的姓名<tb><input type="text" name="contact"></tb>
			</tr><br>
			<tr>
				<tb>联系方式</tb><tb><input type="text" name="number"></tb>
			</tr><br>
		</table>
		<input type="submit" name="g" value="发布">
	</center></form>
</body>
</html>