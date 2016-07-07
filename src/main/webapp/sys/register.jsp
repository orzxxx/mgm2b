<%@ page language="java"  pageEncoding="UTF-8"%>
<script language="javascript">


</script>
<div>
	<form method="post" id="register_form" class="easyui-form" data-options="novalidate:true" >
		<table class="table_info" border="0">
		<tr>
			<td width="100px">
				<label>
					手机号:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="userId" class="easyui-numberbox" maxlength="11"
				data-options="required:true,validType:'mobile'" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>* 11位数字</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					密码:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input id="register_passwd" type="password" name="passwd" maxlength="30" class="easyui-validatebox" data-options="required:true" validType="pwd" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>* 长度6到20位,允许输入数字和字母</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					重复密码:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="password" name="repasswd" maxlength="30" class="easyui-validatebox" data-options="required:true" validType="pwdEquals['#register_passwd']" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					店名:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="mchntName" maxlength="35" class="easyui-validatebox" data-options="required:true" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					姓名:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="userName" maxlength="15" class="easyui-validatebox" data-options="required:true" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					身份证号:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="idCard" maxlength="18" class="easyui-validatebox" data-options="required:true" validType="idCard" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					邮箱:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="email" maxlength="60" class="easyui-validatebox" data-options="required:true" validType="email" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					区域信息:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td style="position: relative;">
					<input id="register_district" readonly name="district" type="text" style="width:220px;" class="easyui-validatebox" data-options="required:true">
				  <%--<input id="register_district" readonly type="text" name="district" readonly class="easyui-validatebox" data-options="required:true" style="width:220px;"/>
				--%>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					详细地址:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="detailedAddress" maxlength="25" class="easyui-validatebox" data-options="required:true" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr >
				<td>
					<label>
						证件类型
					</label>
				</td>
				<td class="tdspace">
				</td>
				<td>
					<input id="register_license" type="radio" checked name="licenseType" value="1" onchange="setValidType('license')"/><span>营业执照</span>
					<span style="float:right;"><input id="register_taxCard" type="radio" name="licenseType" value="2" onchange="setValidType('taxCard')"/><span>税务登记证</span></span>
					<br/>
					<input id="register_orgCode" type="radio" name="licenseType" value="3" onchange="setValidType('orgCode')"/><span>组织机构代码证</span>
				</td>
				<td class="hintspace">
					<tt>*</tt> 
				</td>				
			</tr>
		<tr>
			<td>
				<label>
					证件号:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input id="register_licenseNumber" type="text" name="license" maxlength="20" class="easyui-validatebox" data-options="required:true" validType="license" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>*</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					收款卡号:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="inAcct" maxlength="30" class="easyui-validatebox" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>可选</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					支付宝账号:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="alipayNo" maxlength="30" class="easyui-validatebox" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>可选</tt>
			</td>
		</tr>
		<tr>
			<td>
				<label>
					微信账号:
				</label>
			</td>
			<td class="tdspace">
			</td>
			<td>
				<input type="text" name="wechatNo" maxlength="30" class="easyui-validatebox" style="width:220px;"/>
			</td>
			<td class="hintspace">
				<tt>可选</tt>
			</td>
		</tr>

		</table>
	</form>
</div>
