@component('layouts.master')

    @slot('title')
        Manage Payment Methods - {{ config('app.name') }}
    @endslot

    <div class="row content">

        <div class="col-md-12">
            <!-- Nav tabs -->
            @include('users.tabs')

            <h1>My Payment Methods</h1>

            <div class="alert alert-info"><i class="fa fa-info-circle"></i> Your credit card info is securely stored with
                <a href="https://www.stripe.com" target="_blank">Stripe</a>, the world leading payments solution, for your
                convenience for the next purchases. This is optional and you can remove your saved credit cards any time.
                We do not store your credit card info in our servers to meet PCI-Compliant standard. The credit card info
                is safely sent directly from you to Stripe using the secured industry-standard 256-bit encryption technology.</div>

            @include('snippets.errors')
            @include('snippets.flash')

            @if (auth()->user()->cards()->count() > 0)
                <table class="table table-striped table-bordered table-hover" id="payment-current-cards">
                    <thead>
                    <tr>
                        <th>
                            Credit Cards
                            <a href="{{ route('payments.create', ['type' => 'card']) }}" class="pull-right"><i class="fa fa-plus"></i> Add new</a>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach (auth()->user()->cards as $card)
                        <tr>
                            <td>
                                <span class="pull-left">
                                    {!! CustomHelper::formatCard($card) !!}

                                    @if ($card['default'])
                                        <small>(Primary Card)</small>
                                    @endif
                                </span>

                                <span class="pull-right text-right">
                                    <a href="{{ route('payments.edit', $card['id']) }}">Edit</a>
                                </span>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            @else
                <div class="alert alert-warning">
                    You have no saved credit cards at the present. Click <a href="{{ route('payments.create', ['type' => 'card']) }}">here</a> to add a new credit card.
                </div>
            @endif

        </div>

    </div>

@endcomponent