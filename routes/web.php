<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Auth::routes();

// Homepage
Route::get('/', 'HomeController@index')->name('home');

// Shop
Route::group(['prefix' => 'shop', 'as' => 'shop'], function() {

    // Home - URL: /shop
    Route::get('/', 'ShopController@index');

    // Category - URL: /shop/c/{uri}
    Route::get('c/{uri}-{category}', 'ShopController@category')
        ->where([
            'uri' => '[0-9a-z\-]+',
            'category' => '[0-9]+'
        ])
        ->name('.category');

    // Product - URL: /shop/p/{uri}-{product}.html
    Route::get('p/{uri}-{product}.html', function($uri, $product) {
        return view('shop.products.show', compact('product'));
    })->where([
        'uri' => '[0-9a-z\-]+',
        'product' => '[0-9]+'
    ])->name('.product');

    // Checkout
    Route::group(['prefix' => 'checkout', 'as' => '.checkout'], function() {
        // Checkout - URL: /shop/checkout
        Route::get('/', 'ShopController@checkout');

        // Checkout with PayPal - URL: /shop/checkout/paypal
        Route::get('paypal', 'ShopController@checkoutPayPal')->name('.paypal');

        // Submit Checkout - URL: /shop/checkout (POST)
        Route::post('/', 'ShopController@checkoutSubmit')->name('.submit');

        // Login at Checkout - URL: /shop/checkout/login (POST)
        Route::post('login', 'ShopController@login')->name('.login');

        // Confirmation - URL: /shop/confirmation/{order_number}/{confirmation_code}
        Route::get('confirmation/{order_number}/{confirmation_code}', function($orderNumber, $confirmationCode) {
            return view('shop.checkout.confirmation', [
                'orderNumber' => $orderNumber,
                'confirmationCode' => $confirmationCode
            ]);
        })->where([
            'orderNumber' => '[0-9]+',
            'confirmationCode' => '[A-Z0-9]{6}'
        ])->name('.confirmation');
    });

    // Cart
    Route::group(['prefix' => 'cart', 'as' => '.cart'], function() {
        // Cart - URL: /shop/cart
        Route::get('/', 'CartController@index');

        // Add item to cart: URL: /shop/cart/add (POST)
        Route::post('add', 'CartController@add')->name('.add');

        // Update Cart - URL: /shop/cart/update (POST)
        Route::post('update', 'CartController@update')->name('.update');

        // Empty Cart - URL: /shop/cart/empty
        Route::get('empty', 'CartController@reset')->name('.empty');
    });

    // Addresses
    Route::group(['prefix' => 'addresses', 'as' => '.addresses'], function() {
        // Create/edit address - URL: /shop/addresses/manage (POST)
        Route::post('manage', 'AddressesController@manage')->name('.manage');
    });

    // Payments
    Route::group(['prefix' => 'payments', 'as' => '.payments'], function() {
        // Store payment source - URL: /shop/payments/create (POST)
        Route::post('/', 'PaymentsController@store')->name('.store');
    });
});

// Users
Route::group(['middleware' => ['auth']], function() {
    // Account - URL: /account
    Route::get('account', function() {
        return view('users.account');
    })->name('account');

    // Update Account - URL: /account (POST)
    Route::put('account', 'UsersController@update')->name('account.update');

    // Orders
    Route::group(['prefix' => 'orders'], function() {
        // Orders - URL: /orders
        Route::get('/', function() {
            return view('users.orders.index');
        })->name('orders');

        // Order - URL: /{orderNumber}
        Route::get('{orderNumber}', 'UsersController@order')->where('orderNumber', '[0-9]+')->name('user_order');
    });

    // Addresses
    Route::group(['prefix' => 'addresses', 'as' => 'addresses'], function() {
        // Addresses - URL: /addresses
        Route::get('/', function() {
            return view('users.addresses.index');
        });

        // Create Address - URL: /addresses/create
        Route::get('create', function() {
            return view('users.addresses.create');
        })->name('.create');

        // Store Address - URL: /addresses (POST)
        Route::post('/', 'AddressesController@store')->name('.store');

        // Edit Address - URL: /addresses/{address}/edit
        Route::get('{address}/edit', function ($address) {
            if (auth()->user()->can('view', $address)) {
                return view('users.addresses.edit', compact('address'));
            } else {
                return redirect(route('addresses'))->with('message', 'danger|You do not have permission to view this address.');
            }
        })->where('address', '[0-9]+')->name('.edit');

        // Update Address - URL: /addresses/{address} (POST)
        Route::put('{address}', 'AddressesController@update')->name('.update');

        // Set Address primary - URL: /addresses/{address}/primary
        Route::get('{address}/primary', 'AddressesController@primary')->name('.primary');

        // Remove Address - URL: /addresses/{address} (DELETE)
        Route::delete('{address}', 'AddressesController@destroy')->name('.destroy');
    });

    // Payments
    Route::group(['prefix' => 'payments', 'as' => 'payments'], function() {
        // Payment Sources - URL: /payments
        Route::get('/', function() {
            return view('users.payments.index');
        });

        // Create Payment Source - URL: /payments/create
        Route::get('create', function() {
            return view('users.payments.create');
        })->name('.create');

        // Store Payment Source - URL: /payments (POST)
        Route::post('/', 'PaymentsController@store')->name('.store');

        // Edit Payment Source - URL: /payments/{paymentSource}/edit
        Route::get('{paymentSource}/edit', function($paymentSource) {
            if (auth()->user()->can('view', $paymentSource)) {
                return view('users.payments.edit', compact('paymentSource'));
            } else {
                return redirect(route('payments'))->with('message', 'danger|You do not have permission to view this payment source.');
            }
        })->where('address', '[0-9]+')->name('.edit');

        // Update Payment Source - URL: /payments/{paymentSource} (POST)
        Route::put('{paymentSource}', 'PaymentsController@update')->name('.update');

        // Remove Payment Source - URL: /payments/{paymentSource} (DELETE)
        Route::delete('{paymentSource}', 'PaymentsController@destroy')->name('.destroy');
    });
});

// Static Pages
Route::group(['as' => 'page.'], function() {
    // About page - URL: /about
    Route::get('about', function() {
        return view('pages.about');
    })->name('about');

    // Services page - URL: /services
    Route::get('services', function() {
        return view('pages.services');
    })->name('services');

    // Contact page - URL: /contact
    Route::get('contact', function() {
        return view('pages.contact');
    })->name('contact');

    // Contact page - Send message - URL: /contact (POST)
    Route::post('contact', 'PagesController@contactSend')->name('send_contact');

    // Terms page - URL: /terms
    Route::get('terms', function() {
        return view('pages.terms');
    })->name('terms');

    // Delivery page - URL: /delivery
    Route::get('delivery', function() {
        return view('pages.delivery');
    })->name('delivery');
});

// Search
Route::get('/search', 'SearchController@index')->name('search');

// Sitemap
Route::get('sitemap.xml', 'SitemapController@index')->name('sitemap');

// Sitemap
Route::group(['prefix' => 'sitemap', 'as' => 'sitemap.'], function() {
    Route::get('pages.xml', 'SitemapController@pages')->name('pages');

    Route::get('c/{uri}.xml', 'SitemapController@category')->name('category');
});

// Admin
Route::group(['namespace' => 'Admin', 'prefix' => 'admin', 'as' => 'admin.', 'middleware' => ['auth', 'role:admin']], function() {
    // Dashboard - URL: /admin
    Route::get('/', 'HomeController@index')->name('home');

    // Settings
    Route::group(['prefix' => 'settings', 'as' => 'settings'], function() {
        // Setting - URL: /admin/settings/{setting}
        Route::get('settings/{setting}', function($setting) {
            return view('admin.settings.show', compact('setting'));
        })->where('setting', '[0-9]+')->name('.show');
    });

    Route::resource('settings', 'SettingsController', ['only' => [
        'index', 'update'
    ]]);

    // Orders
    Route::group(['prefix' => 'orders', 'as' => 'orders'], function() {
        // Order - URL: /admin/orders/{order}
        Route::get('{order}', function($order) {
            return view('admin.orders.show', compact('order'));
        })->where('order', '[0-9]+')->name('.show');

        // Edit Order: URL: /admin/orders/{order}/edit
        Route::get('{order}/edit', function($order) {
            return view('admin.orders.edit', compact('order'));
        })->where('order', '[0-9]+')->name('.edit');

        // Send Order Email - URL: /admin/orders/email/{type}
        Route::get('{order}/email/{type}', 'OrdersController@email')->where(['order' => '[0-9]+'])->name('.send_email');
    });

    Route::resource('orders', 'OrdersController', ['only' => [
        'index', 'update'
    ]]);

    // Categories
    Route::group(['prefix' => 'categories', 'as' => 'categories'], function() {
        // Categories - URL: /admin/categories
        Route::get('/', function() {
            return view('admin.categories.index');
        })->name('.index');

        // Create Category - URL: /admin/categories/create
        Route::get('create', function() {
            return view('admin.categories.create');
        })->name('.create');

        // Category - URL: /admin/categories/{category}
        Route::get('{category}', function($category) {
            return view('admin.categories.show', compact('category'));
        })->where('category', '[0-9]+')->name('.show');
    });

    Route::resource('categories', 'CategoriesController', ['only' => [
        'store', 'update', 'destroy'
    ]]);

    // Attributes
    Route::group(['prefix' => 'attributes', 'as' => 'attributes'], function() {
        // Create Attribute - URL: /admin/attributes/create
        Route::get('create', function() {
            return view('admin.attributes.create');
        })->name('.create');

        // Store Attribute - URL: /admin/attributes (POST)
        Route::post('/', 'AttributesController@store')->name('.store');

        // Attribute - URL: /admin/attributes/{attribute}
        Route::get('{attribute}', function($attribute) {
            return view('admin.attributes.show', compact('attribute'));
        })->where('attribute', '[0-9]+')->name('.show');

        // Update Attribute - URL: /admin/attributes/{attribute} (PUT)
        Route::put('{attribute}', 'AttributesController@update')->where('attribute', '[0-9]+')->name('.update');

        // Attribute
        Route::group(['prefix' => '{attribute}', 'as' => '.attribute.'], function() {
            // Options
            Route::group(['prefix' => 'options', 'as' => 'options.'], function() {
                // Create Option - URL: /admin/attributes/{attribute}/options/create
                Route::get('create', function($attribute) {
                    return view('admin.attributes.options.create', compact('attribute'));
                })->where('attribute', '[0-9]+')->name('create');

                // Store Option - URL: /admin/attributes/{attribute}/options (POST)
                Route::post('/', 'OptionsController@store')->where('attribute', '[0-9]+')->name('store');

                // Option - URL: /admin/attributes/{attribute}/options/{option}
                Route::get('{option}', function($attribute, $option) {
                    return view('admin.attributes.options.show', compact('attribute', 'option'));
                })->where([
                    'attribute' => '[0-9]+',
                    'option' => '[0-9]+'
                ])->name('show');

                // Update Option - URL: /admin/attributes/{attribute}/options/{option} (PUT)
                Route::put('{option}', 'OptionsController@update')
                    ->where([
                        'attribute' => '[0-9]+',
                        'option' => '[0-9]+'
                    ])->name('update');

                // Remove Option - URL: /admin/attributes/{attribute}/options/{option} (DELETE)
                Route::delete('{option}', 'OptionsController@destroy')
                    ->where([
                        'attribute' => '[0-9]+',
                        'option' => '[0-9]+'
                    ])->name('destroy');
            });
        });
    });

    Route::resource('attributes', 'AttributesController', ['only' => [
        'index', 'store', 'update', 'destroy'
    ]]);

    // Products
    Route::group(['prefix' => 'products', 'as' => 'products'], function() {
        // Product - URL: /admin/products/out-of-stock
        Route::get('out-of-stock', 'InventoryController@outOfStock')->name('.out_of_stock');

        // Create Product - URL: /admin/products/create
        Route::get('create', function() {
            return view('admin.products.create');
        })->name('.create');

        // Product - URL: /admin/products/{product}
        Route::get('{product}', function($product) {
            return view('admin.products.show', compact('product'));
        })->where('product', '[0-9]+')->name('.show');

        // Product
        Route::group(['prefix' => '{product}', 'as' => '.product.'], function() {
            // Inventory
            Route::group(['prefix' => 'inventory', 'as' => 'inventory.'], function() {
                // Create Inventory Item - URL: /admin/products/{product}/inventory/create
                Route::get('create', 'InventoryController@create')->name('create');

                // Store Inventory Item - URL: /admin/products/{product}/inventory (POST)
                Route::post('/', 'InventoryController@store')->name('store');

                // Inventory Item - URL: /admin/products/{product}/inventory/{inventoryItem}
                Route::get('{inventoryItem}', 'InventoryController@show')
                    ->where([
                        'product' => '[0-9]+',
                        'inventoryItem' => '[0-9]+'
                    ])
                    ->name('show');

                // Update Inventory Item - URL: /admin/products/{product}/inventory/{inventoryItem} (PUT)
                Route::put('{inventoryItem}', 'InventoryController@update')
                    ->where([
                        'product' => '[0-9]+',
                        'inventoryItem' => '[0-9]+'
                    ])
                    ->name('update');

                // Remove Inventory Item - URL: /admin/products/{product}/inventory/{inventoryItem} (DELETE)
                Route::delete('{inventoryItem}', 'InventoryController@destroy')
                    ->where([
                        'product' => '[0-9]+',
                        'inventoryItem' => '[0-9]+'
                    ])
                    ->name('destroy');
            });
        });
    });

    Route::resource('products', 'ProductsController', ['only' => [
        'index', 'store', 'update', 'destroy'
    ]]);

    // Coupons
    Route::resource('coupons', 'CouponsController', ['except' => [
        'edit'
    ]]);

    Route::group(['prefix' => 'coupons', 'as' => 'coupons'], function() {
        // Coupon - URL: /coupons/{coupon}
        Route::get('{coupon}', 'CouponsController@show')->name('.show');
    });

    // Users
    Route::group(['prefix' => 'users', 'as' => 'users'], function() {
        // User - URL: /users/{user}
        Route::get('{user}', function($user) {
            return view('admin.users.show', compact('user'));
        })->name('.show');
    });

    Route::resource('users', 'UsersController', ['only' => [
        'index', 'update'
    ]]);
});