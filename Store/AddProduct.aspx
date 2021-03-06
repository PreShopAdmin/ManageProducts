﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Store/Master.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="PreShop.ManageProducts.Store.AddProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {

            $("#<%= ddlCateogory.ClientID %>").select2({
            });
            $("#<%= ddlCompany.ClientID %>").select2({
            });
        });
        function SaveDescription() {
            var descriptionHtml = $('#txtDescription').html();
            $("#<%= txtDescroption.ClientID%>").val(descriptionHtml);
        }

        function LoadDescription() {
            $('#txtDescription').html($("#<%= txtDescroption.ClientID%>").val());
        }
    </script>
    <link href="Select2/CustomCss.css" rel="stylesheet" />
    <style>
        .select2 {
            width: 100% !important;
        }
    </style>
    <script>
        function HideLabel() {
            var seconds = 10;
            setTimeout(function () {
                document.getElementById("<%=msgDiv.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        function checkUncheck(checked, divID, oldDiv) {
            if (checked == true) {
                $(oldDiv).hide();
                $(divID).show();
            }
            else {
                $(divID).hide();
            }
        }

        function displayHide(checked, divID) {
            if (checked == true) {
                $(divID).show();
            }
            else {
                $(divID).hide();
            }
        }
    </script>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Products</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <label class="control-label col-md-12 col-sm-12 col-xs-12"></label>
                        <div class="col-lg-12">
                            <div aria-live="assertive" id="msgDiv" runat="server" visible="false" style="width: 100%; right: 36px; top: 36px; cursor: auto; text-align: left">
                                <div class="ui-pnotify-icon"><span id="icon" runat="server"></span></div>
                                <div class="ui-pnotify-text">
                                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#AddEditProduct">Add New Product</button>
                            <!-- Pop up -->
                            <div class="modal fade bs-example-modal-lg" role="dialog" aria-hidden="true" id="AddEditProduct">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" id="cls" data-dismiss="modal">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                <asp:Label ID="lblPopUpHeading" runat="server">Add New Product</asp:Label></h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="x_content" style="float: none!important">
                                                <div class="row">
                                                    <div class="col-sm-6 col-md-6 col-lg-6">
                                                        <div class="form-group">
                                                            <label>
                                                                Select Category:&nbsp;
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCateogory" ErrorMessage="*" CssClass="has-error" InitialValue="-1" ValidationGroup="validation"></asp:RequiredFieldValidator>
                                                            </label>
                                                            <asp:DropDownList ID="ddlCateogory" runat="server" class="form-control" TabIndex="2">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-6 col-lg-6">
                                                        <div class="form-group">
                                                            <label>
                                                                Select Company:&nbsp;
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" SetFocusOnError="true" ControlToValidate="ddlCompany" ErrorMessage="*" CssClass="has-error" InitialValue="-1" ValidationGroup="validation"></asp:RequiredFieldValidator>
                                                            </label>
                                                            <asp:DropDownList ID="ddlCompany" runat="server" class="form-control" TabIndex="2">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6 col-md-6 col-lg-6">
                                                        <div class="form-group">
                                                            <label>
                                                                Product Name:&nbsp;
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="has-error" SetFocusOnError="true" ControlToValidate="txtProductName" ErrorMessage="*" ValidationGroup="validation"></asp:RequiredFieldValidator>
                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ErrorMessage="$ symbol is not allowed" ControlToValidate="txtProductName" ValidationExpression="[^$]+" Display="Dynamic" SetFocusOnError="true" ValidationGroup="validation"></asp:RegularExpressionValidator>

                                                            </label>
                                                            <asp:TextBox runat="server" ID="txtProductName" class="form-control col-md-7 col-xs-12" TabIndex="4"></asp:TextBox>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-2">
                                                        <div class="form-group">
                                                            <label>
                                                                &nbsp<span class="required">
                                                                    <asp:RequiredFieldValidator ID="reqFileUpload" runat="server" CssClass="has-error" Display="Dynamic" SetFocusOnError="true" ControlToValidate="flvProductUpload" ErrorMessage="Choose an image" ValidationGroup="validation"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="fileUploadReg" runat="server" Display="Dynamic" ControlToValidate="flvProductUpload" ValidationExpression="^.*\.((j|J)(p|P)(e|E)?(g|G)|(p|P)(n|N)(g|G))$" CssClass="has-error" ErrorMessage="Please choose only PNG or JPG format" ValidationGroup="validation"></asp:RegularExpressionValidator>
                                                                </span>
                                                            </label>
                                                            <asp:FileUpload ID="flvProductUpload" runat="server" AllowMultiple="true" ClientIDMode="Static" />
                                                        </div>

                                                    </div>
                                                    <div id="DivProductImage" runat="server" clientidmode="Static" style="display: none" class="col-sm-4">
                                                        <img id="ProductImage" runat="server" clientidmode="Static" src="#" style="height: 115px;width: 100px;" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-8 col-md-8 col-lg-8 col-lg-offset-2">
                                                        <div class="form-group">

                                                            <label>
                                                                Description:&nbsp;
                                             <asp:RequiredFieldValidator runat="server" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescroption" ErrorMessage="*" CssClass="has-error" ValidationGroup="validation"></asp:RequiredFieldValidator>
                                                            </label>
                                                            <div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#txtDescription">
                                                                <div class="btn-group">
                                                                    <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                                                                    <ul class="dropdown-menu">
                                                                        <li>
                                                                            <a data-edit="fontSize 5">
                                                                                <p style="font-size: 17px">Huge</p>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a data-edit="fontSize 3">
                                                                                <p style="font-size: 14px">Normal</p>
                                                                            </a>
                                                                        </li>
                                                                        <li>
                                                                            <a data-edit="fontSize 1">
                                                                                <p style="font-size: 11px">Small</p>
                                                                            </a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <div class="btn-group">
                                                                    <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
                                                                    <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
                                                                    <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
                                                                    <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
                                                                    <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
                                                                    <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
                                                                    <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
                                                                    <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
                                                                    <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
                                                                    <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
                                                                </div>

                                                                <div class="btn-group">
                                                                    <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
                                                                    <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
                                                                </div>
                                                            </div>
                                                            <div id="txtDescription" onkeyup="SaveDescription();" class="editor-wrapper"></div>
                                                            <asp:TextBox runat="server" ID="txtDescroption" class="form-control col-md-7 col-xs-12" Style="display: none; resize: none!important" TabIndex="4" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row" id="rowFlavourColor" runat="server">
                                                    <div class="col-sm-8 col-md-8 col-lg-8 col-lg-offset-2">
                                                        <div class="form-group">
                                                            <label></label>
                                                            <p>
                                                                Color:
                                                               
                                                                <input type="radio" class="flat" name="gender" id="chkColor" runat="server" checked="" />&nbsp&nbsp
                                                                Flavour:
                                                               
                                                                <input type="radio" class="flat" name="gender" id="chkFlavour" runat="server" />
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-success" OnClick="btnSubmit_Click" EnableViewState="false" TabIndex="4" ValidationGroup="validation" Text="Save" OnClientClick="if (!Page_ClientValidate()){ return false; } this.disabled = true; this.value = 'Saving...';"
                                                UseSubmitBehavior="false" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>Category</th>
                                <th>Company</th>
                                <th>Product Name</th>
                                <th>Description</th>
                                <th id="thAttr" runat="server">Attributes</th>
                                <th id="thActions" runat="server">Action(s)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
                                <ItemTemplate>
                                    <tr class="even gradeX">
                                        <td><%# Eval("[Category]") %></td>
                                        <td><%# Eval("[Company]") %></td>
                                        <td><%# Eval("[Product]") %> &nbsp&nbsp <img src='<%# Eval("Image") %>' style="height: 115px;width: 100px;" /></td>
                                        <td style="white-space: pre-line!important"><%# Eval("[Description]") %></td>
                                        <td id="tdAttr" runat="server"><%# Convert.ToInt32(Eval("[IsColor]"))==1 ? "Colors" : "Flavours" %></td>
                                        <td class="center" id="tdActions" runat="server">
                                            <asp:LinkButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" CommandArgument='<%# Eval("ProductID") %>'><span class="fa fa-edit" style="font-size: 22px!important;"></span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="hfProductID" runat="server" />
    <asp:HiddenField ID="hfSubCategoryID" runat="server" />
    <asp:HiddenField ID="hfDescription" runat="server" />
    <asp:HiddenField ID="hfImagePath" runat="server" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#datatable-responsive').dataTable({
                "bSort": false
            });
        });
        function openModal(id) {
            $(id).modal('show');
        }
        $('#<%= flvProductUpload.ClientID %>').filestyle({
            input: false,
            buttonName: 'btn btn-success btn-sm',
            iconName: 'fa fa-upload',
            buttonText: 'Upload Image'
        });

        function readURL(input) {

            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%= ProductImage.ClientID%>').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        $('#<%= flvProductUpload.ClientID %>').change(function () {
            readURL(this);
            $("#<%= DivProductImage.ClientID%>").show();
        });
    </script>
    <script src='<%= ResolveUrl("../CustomFiles/bootstrap-notify.min.js") %>'></script>
    <link href='<%= ResolveUrl("../CustomFiles/CustomNotify.css") %>' rel="stylesheet" />

</asp:Content>
