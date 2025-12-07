import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PdfViewer.asset('assets/hello.pdf'));
  }
}
