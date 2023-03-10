import 'package:flutter/material.dart';
import 'file_handle_api.dart';
import 'pdf_invoice_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Invoice PDF Generate',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePageInvoice(),
    );
  }
}

class HomePageInvoice extends StatelessWidget {
  const HomePageInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Invoice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.picture_as_pdf,
              size: 72.0,
              color: Colors.white,
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Generate Invoice',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
                child: Text(
                  'Invoice PDF',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () async {
                // generate pdf file
                final pdfFile = await PdfInvoiceApi.generate();

                // opening the pdf file
                FileHandleApi.openFile(pdfFile);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Details {
  String dis = 'dis';
  String qlty = 'dis';
  String tax = 'dis';
  String vat = 'dis';

  Details(this.dis, this.qlty, this.tax, this.vat);
}



List<List<dynamic>> dataList = [
  [
    "a",
    "1",
    ".2",
    "3",
  ],
  [
    "a",
    "1",
    ".2",
    "3",
  ],
  [
    "b",
    "2",
    ".3",
    "",
  ]
];

