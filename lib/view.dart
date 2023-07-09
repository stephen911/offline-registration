import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
// import 'package:service/models/baseball.model.dart';

class LoadAndViewCsvPage extends StatelessWidget {
  final String path;
  const LoadAndViewCsvPage(this.path, {super.key}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load and View Csv data'),
      ),
      body: const SingleChildScrollView()
    );
  }

  // load csv as string and transform to List<List<dynamic>>
  /*
  [
    ['Name', 'Coach', 'Players'],
    ['Name1', 'Coach1', '5'],
    etc
  ]
  */
  // Future<List<List<dynamic>>> _loadCsvData() async {
  //   final file = new File(path).openRead();
  //   return await file
  //       .transform(utf8.decoder)
  //       .transform(new CsvToListConverter())
  //       .toList();
  // }
}
