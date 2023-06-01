import 'package:flutter/material.dart';
import 'package:payment_box/qrdata.dart';
import 'calculator.dart';
import 'qr.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Calculator(),
        '/qr': (context) => QR(data: QrData.getQrData(),),
      }));
}
