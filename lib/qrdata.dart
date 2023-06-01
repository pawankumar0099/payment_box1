

class QrData{
  static String amount="";
  static String qrData="";
  static String getQrData(){
    qrData="upi://pay?pa=9871109343@ybl&pn=pawan&am=$amount&cu=INR";
    return qrData;
  }
}