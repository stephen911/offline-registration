import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tucee_registration/csv.dart';
import 'package:tucee_registration/db/notes_database.dart';
import 'package:tucee_registration/model/note.dart';
import 'package:tucee_registration/page/edit_note_page.dart';
import 'package:tucee_registration/page/note_detail_page.dart';
import 'package:tucee_registration/widget/note_card_widget.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();

    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  bool editshow = false;

  void editshowfunc(bool value) {
    if (editshow == true) {

      setState(() {
        editshow = false;
      });
      
    } else {

      setState(() {
        editshow = true;
      });
      
    }
  }

  bool show = false;

  void download(bool value) {
    if (show == true) {

      setState(() {
        show = false;
      });
      
    } else {

      setState(() {
        show = true;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
            child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: Image.asset("assets/images/tucee.png").image,
                          fit: BoxFit.cover)),
                  child: const Opacity(
                    opacity: 0.0,
                    child: Text(
                      "TUCEE Registration",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        //color: Colors.blue,
                      ),
                    ),
                  )),
              ListTile(
                title: const Text(
                  "Download",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                leading: const Icon(Icons.download, color: Colors.blueAccent),
                trailing: Switch(
                  value: show,
                  onChanged: download,
                ),
                onTap: () {
                  // print("home");
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  "Edit",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                leading: const Icon(Icons.edit, color: Colors.blueAccent),
                trailing: Switch(
                  value: editshow,
                  onChanged: editshowfunc,
                ),
                onTap: () {
                  // print("home");
                  Navigator.pop(context);
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              )
            ])),
        appBar: AppBar(
          title: const Text(
            'TUCEE Registration',
            style: TextStyle(fontSize: 24),
          ),
          actions: [
            // Icon(Icons.search),
            const SizedBox(width: 12),
            show ?
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CsvGeneratorDemo()),
                  );
                },
                icon: const Icon(Icons.download)) : const Text("")
          ],
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : notes.isEmpty
                  ? const Text(
                      'No Users Available',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )
                  : buildNotes(),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          child: const Icon(Icons.person_add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddEditNotePage()),
            );

            refreshNotes();
          },
        ),
      );

  Widget buildNotes() => StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8),
        itemCount: notes.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final note = notes[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteDetailPage(noteId: note.id!, edit: editshow,),
              ));

              refreshNotes();
            },
            child: NoteCardWidget(note: note, index: index),
          );
        },
      );
}
