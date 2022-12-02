
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final total;
  // ignore: use_key_in_widget_constructors
  const MyGooglePay({required this.total});
  @override
  _MyGooglePayState createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
// In your Widget build() method

// In your Stateless Widget class or State
  void onGooglePayResult(paymentResult) {
    // ignore: avoid_print
    print(paymentResult);
    // Send the resulting Google Pay token to your server or PSP
  }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: [
        PaymentItem(
          label: 'Total',
          amount: '${widget.total}',
          status: PaymentItemStatus.final_price,
        )
      ],
      // style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}
