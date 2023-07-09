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
  // ignore: library_private_types_in_public_api
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

    note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions:  [ widget.edit ? editButton() : const Text(""), widget.edit ? deleteButton(): const Text("")] ,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
              children: [
                widget.edit ? const Text("") :
                Container(
                  margin: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.white12,
                              blurRadius: 5),
                        ],
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(12),
                  child: const Text("Inform the Admin If any of your info is Incorrect", style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),),

                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.white12,
                              blurRadius: 5),
                        ],
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(12),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      children: [
                        Text(
                          note.title,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          note.description,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          note.contact,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          note.lincense,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          note.regnumber,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          note.region,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          note.district,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          DateFormat.yMMMd().format(note.createdTime),
                          style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
              ],
            ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);

          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        },
      );
}
