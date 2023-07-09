import 'dart:io';
import 'dart:math';
// import 'dart:ui';
// import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:tucee_registration/db/notes_database.dart';
// import 'package:tucee_registration/configs/ioc.dart';
import 'package:tucee_registration/model/note.dart';
// import 'package:tucee_registration/models/baseball.model.dart';
// import 'view.dart';
// import 'package:tucee_registration/pages/code_examples/pdf_and_csv/view_csv_data.dart';
// import 'package:tucee_registration/tucee_registrations/sqlite_basebal_team.service.dart';
// import 'package:service/shared/widgets/crud_demo_list_item.widget.dart';
import 'package:csv/csv.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:tucee_registration/csv.dart';
// import 'package:tucee_registration/db/notes_database.dart';
// import 'package:tucee_registration/model/note.dart';
// import 'package:tucee_registration/page/edit_note_page.dart';
// import 'package:tucee_registration/page/note_detail_page.dart';
// import 'package:tucee_registration/widget/note_card_widget.dart';

// ignore: must_be_immutable
class CsvGeneratorDemo extends StatelessWidget {
  CsvGeneratorDemo({super.key});

  // final SqliteBaseballService _databaseService =
  //     Ioc.get<SqliteBaseballService>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Download CSV'),
          actions: const <Widget>[
            // InkWell(
            //   onTap: ()
            //     alignment: Al => refreshNotesdownload(),
            //   child: Align(ignment.center,
            //     child: Text('CSV'),
            //   ),
            // ),
            // SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: size.height * 0.20),
              Row(
                children: [
                  const SizedBox(width: 35),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.download,
                        size: 300,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(height: size.height * 0.40),
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5),
                    shadowColor:  MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(const Size(200, 80))),
                  onPressed: () {
                    refreshNotesdownload();
                    const snackBar = SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        'File Downloaded',
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text('Download CSV', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  ),
                ),
              ),
              // SizedBox(height: 10),
            ],
          ),
        ));
  }

  late List<Note> notes;
  Future refreshNotesdownload() async {
    // setState(() => isLoading = true);
    if (kDebugMode) {
      print("hello");
    }

    notes = await NotesDatabase.instance.readAllNotes();

    List<List<String>> csvData = [
      // headers
      <String>[
        'Name',
        'Email',
        'Contact',
        'Lincense',
        'Registered Number',
        'Region',
        "District",
        // "Date Added"
      ],
      // data
      ...notes.map((item) => [
            item.title,
            item.description,
            item.contact,
            item.lincense,
            item.regnumber,
            item.region,
            item.district,
            // DateFormat.yMMMd().format(item.createdTime)
          ]),
    ];

    if (kDebugMode) {
      print("good");
    }
    // print(notes);
    String csv = const ListToCsvConverter().convert(csvData);

    if (kDebugMode) {
      print(csv);
    }
    // Permission.storage.request(); Directory('/storage/emulated/0/Download')
    Directory? directory = await getExternalStorageDirectory();
    Directory newDir = Directory('/storage/emulated/0/Download');


    final String dir = (await getApplicationDocumentsDirectory()).path;

    print(directory);

    // ignore: prefer_interpolation_to_compose_strings
    // String dire = (await getExternalStorageDirectory())?.absolute.path "/documents";

    Random random = Random();
    // String randomNumber = random.nextInt(100).toString();
    DateTime now = DateTime.now();
    String date =
        DateFormat.Hms().format(now).toString().split(":").toString();
    String today = date.toString();
    // print(today);
    final path = "${newDir.path}/users_data_$today.csv";

    if (kDebugMode) {
      print(path);
    }

    // create file
    final File file = await File(path).create();
    var writer = file.openWrite();
    writer.write(csv);
    writer.close();

    await file.writeAsString(csv);

    if (kDebugMode) {
      print("fine");
    }

    // setState(() => isLoading = false);
  }

  Future<List<Note>> readAllNotes() async {
    if (kDebugMode) {
      print("hello");
    }

    final NotesDatabase instance = NotesDatabase.instance;
    final db = await instance.database;

    final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);
    if (kDebugMode) {
      print("hello");
    }

    return result.map((json) => Note.fromJson(json)).toList();
  }
}
