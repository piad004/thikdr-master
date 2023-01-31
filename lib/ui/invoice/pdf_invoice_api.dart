import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'file_handle_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

 import 'main.dart';

class PdfInvoiceApi {
  static Future<File> generate() async {
    final pdf = pw.Document();

    final iconImage =
        (await rootBundle.load('assets/images/icon.png')).buffer.asUint8List();
    final logoImage =
        (await rootBundle.load('assets/images/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      'Quantity',
      'Unit Price',
      'VAT',
      'Total',
    ];

    final tableData = [
      [
        "Coffee",
        "7",
        "\$ 5",
        "1 %",
        "'\$ 35"
      ],
      [
        'Blue Berries',
        '5',
        '\$ 10',
        '2 %',
        '\$ 50',
      ],
      [
        'Water',
        '1',
        '\$ 3',
        '1.5 %',
        '\$ 3',
      ],
      [
        'Apple',
        '6',
        '\$ 8',
        '2 %',
        '\$ 48',
      ],
      [
        'Lunch',
        '3',
        '\$ 90',
        '12 %',
        '\$ 270',
      ],
      [
        'Drinks',
        '2',
        '\$ 15',
        '0.5 %',
        '\$ 30',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
      [
        'Lemon',
        '4',
        '\$ 7',
        '0.5 %',
        '\$ 28',
      ],
    ];

    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return
            [
            pw.Row(
              children: [
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      height: 75,
                      child: pw.Row(
                        children: [
                          pw.Container(
                            child: pw.Image(
                              pw.MemoryImage(iconImage),
                              height: 72,
                              width: 72,
                            ),
                          ),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 7),
                    pw.Text('Vadim Carazan LTC',
                        style: pw.TextStyle(
                            fontSize: 15, font: pw.Font.timesBold())),
                  ],
                ),
                pw.SizedBox(height: 75),
                // pw.Spacer(),
                pw.Row(
                  children: [],
                ),
              ],
            ),
            // pw.SizedBox(height: 2 * PdfPageFormat.mm),
            // pw.Divider(),
            // pw.SizedBox(height: 5 * PdfPageFormat.mm),

            pw.Row(
              children: [
                pw.Align(
                    alignment: pw.Alignment.centerRight,
                    child: pw.Container(
                        child: pw.Column(children: [
                      pw.Container(
                        height: 25,
                        width: 75,
                        child: pw.Row(children: [
                          pw.Text('Country'),
                          pw.SizedBox(width: 12),
                          pw.Text('Country'),
                        ]),
                      ),
                      pw.Container(
                        height: 25,
                        width: 75,
                        child: pw.Row(children: [
                          pw.Text('Country'),
                          pw.SizedBox(width: 12),
                          pw.Text('Country'),
                        ]),
                      ),
                      pw.SizedBox(width: 12),
                      // pw.Container(height: 25,width: 75,
                      //   child: pw.Text('Country'),
                      // ),
                      pw.SizedBox(width: 12),
                      pw.Container(
                        child: pw.Text(''),
                      ),
                      pw.SizedBox(width: 12),
                    ]))),
                pw.SizedBox(width: 50),
                pw.Row(children: []),
                pw.Spacer(),
                pw.Text('INVOICE',
                    style:
                        pw.TextStyle(color: PdfColors.red200,fontSize: 35, font: pw.Font.timesBold())),
              ],
            ),
            pw.SizedBox(height: 2 * PdfPageFormat.mm),
            pw.Container(height: 1, color: PdfColors.grey400),
            pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
            pw.Container(height: 1, color: PdfColors.grey400),
            pw.Column(
              children: [pw.Padding(padding: pw.EdgeInsets.only(top: 15)),
                pw.Text('BILL TO:',
                    style:
                    pw.TextStyle(fontSize: 15, font: pw.Font.timesBold())),
              ]
            ),
            pw.Row(
              children: [
                pw.Column(children: [
                  pw.Row(children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text('Paul'),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text(''),
                    ),
                  ]),
                  pw.SizedBox(height: 1),
                  pw.Row(children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text('Invoice '),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text(''),
                    ),
                  ]),
                  pw.SizedBox(height: 1),
                  pw.SizedBox(height: 1),
                  pw.Row(children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text('Gledra'),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text(''),
                    ),

                  ]),
                  pw.SizedBox(height: 1),
                  pw.Row(children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text('137 w Sen'),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 75),
                      height: 25,
                      width: 75,
                      child: pw.Text(''),
                    ),

                  ]),
                ]),

                pw.Spacer(),
                pw.SizedBox(width: 50),
                pw.Column(children: [
                  pw.Row(children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 25),
                      height: 25,
                      width: 75,
                      child: pw.Text('Invoice '),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 25),
                      height: 25,
                      width: 75,
                      child: pw.Text('5002'),
                    ),
                  ]),
                  pw.SizedBox(height: 1),
                  pw.Row(children: [
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 25),
                      height: 25,
                      width: 75,
                      child: pw.Text('Invoice NO: '),
                    ),
                    pw.SizedBox(width: 5),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 25),
                      height: 25,
                      width: 75,
                      child: pw.Text('5002'),
                    ),
                  ]),
                  pw.SizedBox(height: 1),

                ]),
              ],
            ),
            pw.SizedBox(height: 5 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: dataList,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration:
                 pw.BoxDecoration(color: PdfColors.red200),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                children: [
                  pw.Spacer(flex: 6),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Net total',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              '\$ 464',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Vat 19.5 %',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              '\$ 90.48',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.Divider(),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child:pw.Container(color: PdfColors.red200,
                                child:  pw.Text(
                                  'Total amount due',
                                  style: pw.TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              )
                            ),
                            pw.Container(
                              color: PdfColors.red200,
                              child: pw.Text(
                                '\$ 554.48',
                                style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),

                          ],
                        ),
                        // pw.Spacer(),
                        // pw.Column(children: [
                        //   pw.Text('qwwgssrgghc'),
                        //   pw.Text('Description'),
                        //   pw.Text('Description'),
                        // ]),
                        pw.SizedBox(height: 2 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                        pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        // footer: (context) {
        //   return pw.Column(
        //     mainAxisSize: pw.MainAxisSize.min,
        //     children: [
        //       pw.Divider(),
        //       pw.SizedBox(height: 2 * PdfPageFormat.mm),
        //       pw.Text(
        //         'Flutter Approach',
        //         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       pw.Row(
        //         mainAxisAlignment: pw.MainAxisAlignment.center,
        //         children: [
        //           pw.Text(
        //             'Address: ',
        //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //           ),
        //           pw.Text(
        //             'Vyapar, vidhannagar, kolkata 1212',
        //           ),
        //         ],
        //       ),
        //       pw.SizedBox(height: 1 * PdfPageFormat.mm),
        //       pw.Row(
        //         mainAxisAlignment: pw.MainAxisAlignment.center,
        //         children: [
        //           pw.Text(
        //             'Email: ',
        //             style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        //           ),
        //           pw.Text(
        //             'flutterapproach@gmail.com',
        //           ),
        //         ],
        //       ),
        //       // pw.Column(children: [
        //       //   PdfDocumentLoader(
        //       //
        //       //   )
        //       // ])
        //     ],
        //   );
        // },
      ),
    );

    var fileName =" ${DateTime.now()}.pdf";

    return FileHandleApi.saveDocument(name:  fileName, pdf: pdf);
  }
}
