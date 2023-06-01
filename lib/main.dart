import 'package:flutter/material.dart';
import 'package:payment_box/qrdata.dart';
import 'calculator.dart';
import 'qr.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Calculator(),
        '/qr': (context) => QR(
              data: QrData.getQrData(),
            ),
      }));
}
