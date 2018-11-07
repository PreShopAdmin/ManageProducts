<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="PreShop.ManageProducts.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!--flex slider-->
    <script src='<%= ResolveUrl("js/jquery.flexslider.js") %>'></script>
    <link rel="stylesheet" href='<%= ResolveUrl("css/flexslider.css") %>' type="text/css" media="screen" />
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
    <!--flex slider-->
    <script src='<%=ResolveUrl("js/imagezoom.js") %>'></script>
    <!-- //js -->

    <!-- breadcrumbs -->
    <div class="container">
        <ol class="breadcrumb breadcrumb1">
            <li><a href="index.aspx">Home</a></li>
            <li class="active">Product Description</li>
        </ol>
        <div class="clearfix"></div>
    </div>
    <!-- //breadcrumbs -->
    <!-- products -->
    <div class="products">
        <div class="container">
            <div class="single-page">
                <div class="single-page-row" id="detail-21">
                    <asp:Repeater ID="rptProductDesc" runat="server" OnItemDataBound="rptProductDesc_ItemDataBound">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                            <asp:HiddenField ID="hfCompanyID" runat="server" Value='<%# Eval("CompanyID") %>' />
                            <div class="col-md-6 single-top-left">
                                <div class="flexslider">
                                    <ul class="slides">
                                        <li data-thumb='<%# Eval("Image") %>'>
                                            <div class="thumb-image">
                                                <img src='<%# Eval("Image") %>' data-imagezoom="true" class="img-responsive" alt="">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-6 single-top-right">
                                <h3 class="item_name"><%# Eval("Product") %></h3>
                                <p>Processing Time: Item will be shipped out within 2-3 working days. </p>
                                <%--  <div class="single-rating">
                                    <ul>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li><i class="fa fa-star-o" aria-hidden="true"></i></li>
                                        <li class="rating">20 reviews</li>
                                        <li><a href="#">Add your review</a></li>
                                    </ul>
                                </div>--%>
                                <%--<p style="font-size: 30px!important"><%# Eval("Category") %>(<%# Eval("SubCategory") %>)</p>--%>
                                <div class="single-price">
                                    <ul>
                                        <li><%# FormatCurrencyDisplay(Eval("Price").ToString()) %></li>
                                        <li><del>Rs.600</del></li>
                                        <li><span class="w3off">10% OFF</span></li>
                                        <li>Ends on: June,5th</li>
                                        <%--<li><a href="#"><i class="fa fa-gift" aria-hidden="true"></i>Coupon</a></li>--%>
                                    </ul>
                                </div>

                                <p style="color: #f44336!important">Available Size</p>
                                <div class="single-rating">
                                    <ul>
                                        <asp:Repeater ID="rptSizes" runat="server">
                                            <ItemTemplate>
                                                <li>
                                                    <%# Eval("[Size]").ToString().Replace(',', ' ')  %>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                                <p style="color: #f44336!important">About Product</p>
                                <%--<p class="single-rating" style="white-space: pre-line!important; color: #000!important; margin-top: -17px!important;">--%>
                                    <div>
                                        <%# Eval("Description") %>
                                    </div>
                                </p>

                                <button type="submit" class="w3ls-cart" onclick="AddToCart(<%# Eval("ProductID") %>,'<%# Eval("Price") %>',1);"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                <button class="w3ls-cart w3ls-cart-like"><i class="fa fa-heart-o" aria-hidden="true"></i>Add to Wishlist</button>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="clearfix"></div>
                </div>
                <div class="single-page-icons social-icons">
                    <ul>
                        <li>
                            <h4>Share on</h4>
                        </li>
                        <li><a href="#" class="fa fa-facebook icon facebook"></a></li>
                        <li><a href="#" class="fa fa-twitter icon twitter"></a></li>
                        <li><a href="#" class="fa fa-google-plus icon googleplus"></a></li>
                        <li><a href="#" class="fa fa-dribbble icon dribbble"></a></li>
                        <li><a href="#" class="fa fa-rss icon rss"></a></li>
                    </ul>
                </div>
            </div>
            <!-- recommendations -->
            <div class="recommend">
                <h3 class="w3ls-title">Related Products</h3>
                <script>
                    $(document).ready(function () {
                        $("#owl-demo5").owlCarousel({

                            autoPlay: 3000, //Set AutoPlay to 3 seconds
                            items: 4,
                            itemsDesktop: [640, 5],
                            itemsDesktopSmall: [414, 4],
                            navigation: true

                        });

                    });
                </script>
                <div id="owl-demo5" class="owl-carousel">

                    <asp:Repeater ID="rptRelatedProducts" runat="server">
                        <ItemTemplate>
                            <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                            <div class="item">
                                <div class="glry-w3agile-grids agileits" style="height: 330px!important">
                                    <div class="new-tag" id="DivNewOrSale" runat="server" visible="false">
                                        <h6 id="lblValue" runat="server" visible="false"></h6>
                                    </div>
                                    <a href="ProductDetail.aspx<%# Helper.QueryStringModule.Encrypt("ProductID="+Eval("ProductID")+"&CompanyID="+Eval("CompanyId")+"&CategoryID="+Eval("CategoryId")) %>">
                                        <img src='<%# Eval("Image") %>' alt="img"></a>
                                    <div class="view-caption agileits-w3layouts">
                                        <h4><a href='#'><%# Eval("Company") %></a>
                                            &nbsp<a href='#'><%# Eval("Product") %></a></h4>
                                        <p>
                                            <%# 
                                                                   Convert.ToInt32(Eval("BranchID"))==0 ? Eval("StoreName")+"(Main Branch)" 
                                                                    : Convert.ToInt32(Eval("BranchID"))>0 ?  Eval("StoreName")+"("+Eval("BranchName")+")" : ""
                                            %>
                                        </p>
                                        <h5><%# FormatCurrencyDisplay(Eval("Price").ToString()) %></h5>
                                        <div runat="server" visible='<%# Convert.ToBoolean(Eval("IsBooking"))==true %>'>
                                            <button type="button" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
            <!-- //recommendations -->
        </div>
    </div>
    <!--//products-->
</asp:Content>

