<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Empty.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
                <script type="text/javascript" src="myScripts/jquery-2.1.3.min.js"></script>
                <script type="text/javascript" src="myScripts/kendo.all.min.js"></script>
                
                <link rel="stylesheet" href="myScripts/kendo.common.min.css" />
                <link rel="stylesheet" href="myScripts/kendo.default.min.css" />
                <link rel="stylesheet" href="myScripts/kendo.dataviz.min.css" />
                <link rel="stylesheet" href="myScripts/kendo.dataviz.default.min.css" />
<title>My Phonebook</title>

<style type="text/css">
    
    
    
    html { font-size: 12px; font-family: Arial, Helvetica, sans-serif; }
    
</style>

<style scoped>

            .forms li > * {
                width: 200px;
            }
        </style>

</head>

<body>
    <form id="form1" runat="server">
    
    <div class="demo-section k-header" style="height: 560px;"></br>
		
        <div class="box-col">
        <ul class="forms">
		
			<li>
                <asp:TextBox id="TextBox1" runat="server" class="k-textbox"/></br>
                <asp:Label ID="Label_1" Text="name" AssociatedControlID="TextBox1" runat="server" style="font-size: 10px;" />
            </li>
			
			<li>
                <asp:TextBox id="TextBox2" runat="server" class="k-textbox"/></br>
                <asp:Label ID="Label_2" Text="phone" AssociatedControlID="TextBox2" runat="server"  style="font-size: 10px;" />
            </li>
			
			<li>
                <asp:Button ID="Button1" runat="server" Text="Insert" onclick="Button1_Click" class="k-button"/>
            </li>
			
        </ul>
        </div></br>

        <div class="box-col">
        <ul class="forms">
            
			<li>
                <asp:TextBox id="TextBox_del" runat="server" class="k-textbox"/></br>
                <asp:Label ID="Label_3" Text="contact id" AssociatedControlID="TextBox_del" runat="server"  style="font-size: 10px;" />
            </li>
			
			<li>
                <asp:Button ID="Button2" runat="server" Text="Delete" 
        onclick="Button2_Click"  class="k-button"/>
            </li>
			
			
        </ul>
        </div></br>

    <div class="box-col">
        <ul class="forms">
            
			<li>
                <asp:TextBox id="ID_TO_EDIT_TXT" runat="server" class="k-textbox"/></br>
                <asp:Label ID="Label1" Text="contact id" AssociatedControlID="ID_TO_EDIT_TXT" runat="server" style="font-size: 10px;" />
            </li>
			
			<li>
                <asp:TextBox id="TextBox_NEWNAME" runat="server" class="k-textbox"/></br>
                <asp:Label ID="Label2" Text="new name" AssociatedControlID="TextBox_NEWNAME" runat="server" style="font-size: 10px;" />
            </li>
			
			<li>
                <asp:TextBox id="TextBox_NEWPHONE" runat="server" class="k-textbox"/></br>
                <asp:Label ID="Label3" Text="new phone" AssociatedControlID="TextBox_NEWPHONE" runat="server" style="font-size: 10px;" />
            </li>

            <li>
                <asp:Button ID="Button3" runat="server" Text="Update" onclick="Button3_Click" class="k-button"/>
            </li>

            </br>
            <li>
                <input id="btn_clear" type="button" onclick="clearfields()" value="Clear all fields" class="k-button"/>
            </li>

            </br>
            <li>
                <span class="k-textbox k-space-left">
                    <input id="search_fld" type="text" value="" />
                    <a href="#" class="k-icon k-i-search">&nbsp;</a>
                </span>
            </li>
			
        </ul>
        </div></br>

        <div class="box-col"  id="div1" style="position:absolute;top: 3%;left: 220px;right:2%;"></div>
		

	</div>
    
    <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Integer" 
    ControlToValidate="TextBox2" ErrorMessage="Value must be a whole number"  />
    <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                    ErrorMessage="This expression does not validate." 
                                    ControlToValidate="TextBox1"     
                                    ValidationExpression="^[A-Z]?[- a-zA-Z]+$"  />

    <asp:CompareValidator ID="CompareValidator2" runat="server" Operator="DataTypeCheck" Type="Integer" 
    ControlToValidate="TextBox_del" ErrorMessage="Value must be a whole number"  />
    
    <asp:CompareValidator ID="CompareValidator3" runat="server" Operator="DataTypeCheck" Type="Integer" 
    ControlToValidate="ID_TO_EDIT_TXT" ErrorMessage="Value must be a whole number"  />
    <asp:CompareValidator ID="CompareValidator4" runat="server" Operator="DataTypeCheck" Type="Integer" 
    ControlToValidate="TextBox_NEWPHONE" ErrorMessage="Value must be a whole number"  />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                    ErrorMessage="This expression does not validate." 
                                    ControlToValidate="TextBox_NEWNAME"     
                                    ValidationExpression="^[A-Z]?[- a-zA-Z]+$"  />
    
    

    <script type="text/javascript">
        
        function j_fnc() {
            var d_source = [<%=getData() %>];
            $("#div1").kendoGrid({
										dataSource: d_source,
                                        height: 540,
                                        groupable: true,
                                        sortable: true,
                                        pageSize: 8,
                        
                                        pageable: {
                                            refresh: true,
                                            pageSizes: true
                                        },

										columns:[
											{field: "id", title: "Id", width: 50},
											{field: "name", title: "Contact Name"},
											{field: "phone", title: "Contact Phone", width: 150}
											]
									});

         }
         j_fnc();

         function clearfields() {
                        document.getElementById("TextBox1").value="";
                        document.getElementById("TextBox2").value="";
                        document.getElementById("TextBox_del").value="";
                        document.getElementById("ID_TO_EDIT_TXT").value="";
                        document.getElementById("TextBox_NEWNAME").value="";
                        document.getElementById("TextBox_NEWPHONE").value="";
                        document.getElementById("search_fld").value="";
                        document.getElementById("TextBox1").focus();
         }
    </script>
    
    </form>
</body>
</html>
