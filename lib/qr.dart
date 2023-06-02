import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'qrdata.dart';
class QR extends StatefulWidget {
  String data;
  QR({required this.data});

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {

  String TTS="Recieved Payment of ${QrData.amount} rupees";
  final FlutterTts flutterTts = FlutterTts();
  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US'); // Set the language
    await flutterTts.setPitch(1.0); // Set the pitch (1.0 is the default)
    await flutterTts.setVolume(1.0); // Set the volume (1.0 is the default)
    await flutterTts.setSpeechRate(0.5); // Set the speech rate (1.0 is the default)

    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Payment Box"),
        backgroundColor: theme.colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: widget.data,
              version: QrVersions.auto,
              size: 300,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: const BorderSide(
                          color: Colors.white, width: 1, style: BorderStyle.solid)),
                ),
              onPressed: ()=> {
                  speak(TTS),
                  Navigator.pushNamed(context, "/payemntstatus"),
              }
            ,
              child: Text("click",style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
