<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="{{ config('app.name') }}, Yumefave, Laravel Shop, Laravel, Laravel eCommerce, eCommerce, PHP eCommerce" />
    <meta name="description" content="" />
    <meta name="_token" content="{{ $_token or '' }}" />
    <meta name="csrf_token" content="{{ csrf_token() }}">
    <title>{{ $title or config('app.name') }}</title>
    <link href="/favicon.ico" type="image/x-icon" rel="icon" /><link href="/favicon.ico" type="image/x-icon" rel="shortcut icon" />
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
    <link href="/css/site.css" rel="stylesheet" type="text/css" />
    <!--Header block-->
    {{ $headerBlock or '' }}
</head>

<body>

<!-- Google Tag Manager -->
@include('snippets.gtm')
<!-- End Google Tag Manager -->

<div class="container wrapper">

    <!-- Site Top -->
    <div class="row">
        <div class="col-md-12">
            @include('nav.top')
        </div>
    </div>

    <!-- Header -->
    <div class="row">
        <div class="col-sm-4 col-xs-8">
            <a href="/" class="logo">
                <img src="/img/logo.jpg" class="img-responsive" />
            </a>
        </div>
        <div class="col-sm-5 hidden-xs">
            <form method="GET" action="/search">
                <div id="global-search">
                    <div class="input-group col-md-12">
                        <input type="text" class="form-control input-lg" placeholder="Search" name="q" />
                        <span class="input-group-btn">
                            <button class="btn btn-info btn-lg" type="submit" title="Search">
                                <i class="fa fa-search"></i>
                            </button>
                        </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-2 col-md-offset-1 col-sm-3 col-xs-4">
            <div class="mini-basket pull-right">
                <div class="row">
                    <p class="mini-basket-title col-sm-12">
                        <i class="fa fa-shopping-cart text-muted"></i> <a href="{{ route('shop.cart') }}" onclick="dataLayer.push({'event': 'header-cart-click', 'color': 'gray'});"><span class="hidden-xs">Cart</span></a>
{{--                        @if (count(session()->get('cart.items')) > 0)--}}
                            (<span id="cart-global">{{ collect(session()->get('cart.items'))->sum('quantity') }}</span>)
{{--                        @endif--}}
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Menu -->
    @include('nav.main')

    <!-- Body -->
    {{ $slot }}

    <div id="footer">

        <div class="footer-center">

            <div class="wrap-fcenter">
                <div class="row">
                    <div class="col-lg-3 col-md-3"><div class="box pav-custom  ">
                            <div class="box-heading"><h2>Contact Us</h2></div>
                            <div class="box-content">
                                <p>Phone: (714) 359 - 957</p>
                                <p>Email: {{ env('OWNER_EMAIL') }}</p>
                                <p>Address: 00100 Westlands<br /> Nairobi</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3">
                        <div class="box pav-custom  ">
                            <div class="box-heading"><h2>Information</h2></div>
                            <div class="box-content">
                                <ul class="list">
                                    <li><a href="{{ route('page.about') }}" title="About Us">About Us</a></li>
                                    <li><a href="{{ route('page.contact') }}" title="Contact Us">Contact Us</a></li>
                                    <li><a href="{{ route('page.delivery') }}" title="Delivery Information">Shipping & Delivery</a></li>
                                    <li><a href="{{ route('page.terms') }}" title="Terms & Conditions">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3">
                        <div class="box pav-custom  ">
                            <div class="box-heading"><h2>My Account</h2></div>
                            <div class="box-content">
                                <ul class="list">
                                    <li><a href="{{ route('account') }}">Account Settings</a></li>
                                    <li><a href="{{ route('orders') }}">Order History</a></li>
                                    @if (!auth()->check())
                                        <li><a href="{{ route('login') }}">Login</a></li>
                                        <li><a href="{{ url('register') }}">Register</a></li>
                                    @endif
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3">
                        <div class="box pav-custom  ">
                            <div class="box-heading"><h2>Social</h2></div>
                            <div class="box-content">
                                <ul class="social">
                                    <li><a href="https://www.facebook.com/kingwanyama" title="Check out our Facebook page" target="_blank"><i class="fa fa-facebook">&nbsp;</i></a></li>
                                    <li><a href="https://twitter.com/king_wanyama" title="Follow us on Twitter" target="_blank"><i class="fa fa-twitter">&nbsp;</i></a></li>
                                    <li><a href="https://www.instagram.com/king_wanyama/" title="Check out our Instagram page" target="_blank"><i class="fa fa-instagram">&nbsp;</i></a></li>
                                    <li><a href="https://www.youtube.com/channel/UCs6ovXmbr87BzDU642LhHDA" title="Check out our Youtube channel" target="_blank"><i class="fa fa-youtube">&nbsp;</i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div id="powered">
            <div class="container">
                <div class="powered">
                    <div class="copyright pull-left">
                        FELIBAE ENT by <a href="#">King Wanyama</a>.<br />
                        All Rights Reserved © 2020
                    </div>
                    <div class="paypal pull-right"><img src="/img/credit-cards.png" alt=""><a href="#"></a></div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/1.2.1/jquery-migrate.min.js"></script>
<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!--Bottom block-->
{{ $bottomBlock or '' }}
</body>
</html>