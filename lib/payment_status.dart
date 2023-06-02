import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentStatus extends StatefulWidget {
  const PaymentStatus({Key? key}) : super(key: key);

  @override
  State<PaymentStatus> createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Status"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: Center(
        child: Container(
            child: Lottie.network(
                "https://assets9.lottiefiles.com/packages/lf20_s3tatv3q.json")),
      ),
    );
  }
}
