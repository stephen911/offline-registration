import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tucee_registration/model/note.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:tucee_registration/db/notes_database.dart';
// import 'package:tucee_registration/configs/ioc.dart';
import 'package:tucee_registration/model/note.dart';
// import 'package:tucee_registration/models/baseball.model.dart';
// import 'view.dart';
// import 'package:tucee_registration/pages/code_examples/pdf_and_csv/view_csv_data.dart';
// import 'package:tucee_registration/tucee_registrations/sqlite_basebal_team.service.dart';
// import 'package:service/shared/widgets/crud_demo_list_item.widget.dart';
import 'package:csv/csv.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NULL';
    final integerType = 'INTEGER NULL';

    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.isImportant} $boolType,
  ${NoteFields.number} $integerType,
  ${NoteFields.title} $textType,
  ${NoteFields.description} $textType,
  ${NoteFields.contact} $textType,
  ${NoteFields.lincense} $textType,
  ${NoteFields.regnumber} $textType,
  ${NoteFields.region} $textType,
  ${NoteFields.district} $textType,
  ${NoteFields.time} $textType
  )
''');
  }

  Future<Note> create(Note note) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableNotes, note.toJson());
    return note.copy(id: id);
  }

  Future<Note> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNotes,
      columns: NoteFields.values,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Note>> readAllNotesdownload() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    List<Note> data = result.map((json) => Note.fromJson(json)).toList();

    List<List<String>> csvData = [
      // headers
      <String>['Name', 'Coach', 'players'],
      // data
      ...data.map((item) =>
          [item.title, item.description, item.isImportant.toString()]),
    ];

    String csv = const ListToCsvConverter().convert(csvData);

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/baseball_teams.csv';

    // create file
    final File file = File(path);
    // Save csv string using default configuration
    // , as field separator
    // " as text delimiter and
    // \r\n as eol.
    await file.writeAsString(csv);

    throw Exception();
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${NoteFields.time} DESC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableNotes, orderBy: orderBy);

    return result.map((json) => Note.fromJson(json)).toList();
  }

  Future<int> update(Note note) async {
    final db = await instance.database;

    return db.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
