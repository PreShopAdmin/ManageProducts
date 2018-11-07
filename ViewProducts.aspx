<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="PreShop.ManageProducts.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        function BindDataByPrice(Price) {
            var price = Price.split('-');
        }
    </script>

    <div class="products">
        <div class="container">
            <div class="col-md-9 product-w3ls-right">
                <!-- breadcrumbs -->
                <ol class="breadcrumb breadcrumb1">
                    <li><a href='<%= ResolveUrl("~/Home") %>'>Home</a></li>
                    <li class="active">Products</li>
                </ol>
                <div class="clearfix"></div>
                <!-- //breadcrumbs -->
                <div class="product-top">
                    <h4>
                        <asp:Label ID="lblItemHeading" runat="server"></asp:Label></h4>
                    <ul>
                        <li class="dropdown head-dpdn">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Filter By<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Low price</a></li>
                                <li><a href="#">High price</a></li>
                                <li><a href="#">Latest</a></li>
                                <li><a href="#">Popular</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="products-row">

                    <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
                        <ItemTemplate>

                            <div class="col-md-3 product-grids">
                                <div class="agile-products" style="height: 295px!important">
                                    <div class="new-tag" id="DivNewOrSale" runat="server" visible="false">
                                        <h6 id="lblValue" runat="server"></h6>
                                    </div>

                                    <a href="ProductDetail.aspx<%# Helper.QueryStringModule.Encrypt("ProductID="+Eval("ProductID")+"&CompanyID="+Eval("CompanyId")+"&CategoryID="+Eval("CategoryId")) %>">
                                        <img src='<%# Eval("Image") %>' class="img-responsive" alt="img"></a>
                                    <div class="agile-product-text">
                                        <h5><a href="ProductDetail.aspx<%# Helper.QueryStringModule.Encrypt("ProductID="+Eval("ProductID")+"&CompanyID="+Eval("CompanyId")+"&CategoryID="+Eval("CategoryId")) %>"><%# Eval("Product") %></a></h5>
                                        <p>
                                            <%# 
                                                                   Convert.ToInt32(Eval("BranchID"))==0 ? Eval("StoreName")+"(Main Branch)" 
                                                                    : Convert.ToInt32(Eval("BranchID"))>0 ?  Eval("StoreName")+"("+Eval("BranchName")+")" : ""
                                            %>
                                        </p>
                                        <h6><%--<del>$200</del>--%> <%# FormatCurrencyDisplay(Eval("Price").ToString()) %></h6>

                                        <div runat="server" visible='<%# Convert.ToBoolean(Eval("IsBooking"))==true %>'>
                                            <button type="button" class="w3ls-cart pw3ls-cart" onclick="AddToCart(<%# Eval("ProductID") %>,'<%# Eval("Price") %>',1);"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblEmpty" runat="server" Style="color: #ff6a00!important" Visible="false"></asp:Label>
                        </FooterTemplate>
                    </asp:Repeater>

                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-md-3 rsidebar">
                <div class="rsidebar-top">
                    <div class="slider-left">
                        <h4>Filter By Price</h4>
                        <div class="row row1 scroll-pane">
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox" onchange='BindDataByPrice(this.value);' value="0-500"><i></i>0 - 500
                            </label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>$100 - $200
                            </label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>$200 - $250 
                            </label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>$250 - $300
                            </label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>$350 - $400
                            </label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>$450 - $500 
                            </label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>More</label>
                        </div>
                    </div>
                    <div class="sidebar-row">
                        <h4>Electronics</h4>
                        <ul class="faq">
                            <li class="item1"><a href="#">Mobile phones<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="#">Smart phones</a></li>
                                    <li class="subitem1"><a href="#">Accessories</a></li>
                                    <li class="subitem1"><a href="#">Tabs</a></li>
                                </ul>
                            </li>
                            <li class="item2"><a href="#">Large appliances<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="#">Refrigerators </a></li>
                                    <li class="subitem1"><a href="#">Washing Machine </a></li>
                                    <li class="subitem1"><a href="#">Kitchen Appliances </a></li>
                                    <li class="subitem1"><a href="#">Air Conditioner</a></li>
                                </ul>
                            </li>
                            <li class="item3"><a href="#">Entertainment<span class="glyphicon glyphicon-menu-down"></span></a>
                                <ul>
                                    <li class="subitem1"><a href="#">Tv & Accessories</a></li>
                                    <li class="subitem1"><a href="#">Digital Camera </a></li>
                                    <li class="subitem1"><a href="#">Computer</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- script for tabs -->
                        <script type="text/javascript">
                            $(function () {

                                var menu_ul = $('.faq > li > ul'),
									   menu_a = $('.faq > li > a');

                                menu_ul.hide();

                                menu_a.click(function (e) {
                                    e.preventDefault();
                                    if (!$(this).hasClass('active')) {
                                        menu_a.removeClass('active');
                                        menu_ul.filter(':visible').slideUp('normal');
                                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                                    } else {
                                        $(this).removeClass('active');
                                        $(this).next().stop(true, true).slideUp('normal');
                                    }
                                });

                            });
                        </script>
                        <!-- script for tabs -->
                    </div>
                    <div class="sidebar-row">
                        <h4>DISCOUNTS</h4>
                        <div class="row row1 scroll-pane">
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Upto - 10% (20)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>70% - 60% (5)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>50% - 40% (7)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>30% - 20% (2)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>10% - 5% (5)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
                            <label class="checkbox">
                                <input type="checkbox" name="checkbox"><i></i>Other(50)</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <!-- recommendations -->
            <div class="recommend">
                <h3 class="w3ls-title">Our Recommendations </h3>
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
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>20%
                                    <br>
                                    Off</h6>
                            </div>
                            <a href="products1.html">
                                <img src="images/f2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products1.html">Women Sandal</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$20</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Women Sandal" />
                                    <input type="hidden" name="amount" value="20.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <a href="products.html">
                                <img src="images/e4.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products.html">Digital Camera</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$80</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Digital Camera" />
                                    <input type="hidden" name="amount" value="100.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>New</h6>
                            </div>
                            <a href="products4.html">
                                <img src="images/s1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products4.html">Roller Skates</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$180</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Roller Skates" />
                                    <input type="hidden" name="amount" value="180.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <a href="products1.html">
                                <img src="images/f1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products1.html">T Shirt</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$10</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="T Shirt" />
                                    <input type="hidden" name="amount" value="10.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>New</h6>
                            </div>
                            <a href="products6.html">
                                <img src="images/p1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products6.html">Coffee Mug</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$14</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Coffee Mug" />
                                    <input type="hidden" name="amount" value="14.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>20%
                                    <br>
                                    Off</h6>
                            </div>
                            <a href="products6.html">
                                <img src="images/p2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products6.html">Teddy bear</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$20</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Teddy bear" />
                                    <input type="hidden" name="amount" value="20.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <a href="products4.html">
                                <img src="images/s2.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products4.html">Football</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$70</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Football" />
                                    <input type="hidden" name="amount" value="70.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="glry-w3agile-grids agileits">
                            <div class="new-tag">
                                <h6>Sale</h6>
                            </div>
                            <a href="products3.html">
                                <img src="images/h1.png" alt="img"></a>
                            <div class="view-caption agileits-w3layouts">
                                <h4><a href="products3.html">Wall Clock</a></h4>
                                <p>Lorem ipsum dolor sit amet consectetur</p>
                                <h5>$80</h5>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value="Wall Clock" />
                                    <input type="hidden" name="amount" value="80.00" />
                                    <button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //recommendations -->
        </div>
    </div>

</asp:Content>

