import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tucee_registration/db/notes_database.dart';
import 'package:tucee_registration/model/note.dart';
import 'package:tucee_registration/page/edit_note_page.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;
  final bool edit;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
    required this.edit
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    this.note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions:  [ widget.edit ? editButton() : Text(""), widget.edit ? deleteButton(): Text("")] ,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
              children: [
                widget.edit ? Text("") :
                Container(
                  child: Text("Inform the Admin If any of your info is Incorrect", style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),),
                   margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.white12,
                              blurRadius: 5),
                        ],
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(12),

                ),
                Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.white12,
                              blurRadius: 5),
                        ],
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(12),
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      children: [
                        Text(
                          note.title,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          note.description,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          note.contact,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          note.lincense,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          note.regnumber,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          note.region,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          note.district,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          DateFormat.yMMMd().format(note.createdTime),
                          style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
              ],
            ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);

          Navigator.of(context).pop();
        },
      );
}
