import 'package:flutter/material.dart';
import 'package:tucee_registration/db/notes_database.dart';
import 'package:tucee_registration/model/note.dart';
import 'package:tucee_registration/widget/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  late String contact;
  late String lincense;
  late String regnumber;
  late String region;
  late String district;

  @override
  void initState() {
    super.initState();

    isImportant = widget.note?.isImportant ?? false;
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
    contact = widget.note?.contact ?? '';
    lincense = widget.note?.lincense ?? '';
    regnumber = widget.note?.regnumber ?? '';
    region = widget.note?.region ?? '';
    district = widget.note?.district ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            contact: contact,
            lincense: lincense,
            regnumber: regnumber,
            region: region,
            district: district,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onChangedContact: (contact) =>
                setState(() => this.contact = contact),
            onChangedLincense: (lincense) =>
                setState(() => this.lincense = lincense),
            onChangedRegnumber: (regnumber) =>
                setState(() => this.regnumber = regnumber),
            onChangedRegion: (region) => setState(() => this.region = region),
            onChangedDistrict: (district) =>
                setState(() => this.district = district),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty &&
        description.isNotEmpty &&
        contact.isNotEmpty &&
        regnumber.isNotEmpty &&
        region.isNotEmpty &&
        district.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isFormValid ? Colors.green: Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: const Text('Save Info'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
        const snackBar = SnackBar(
           backgroundColor: Colors.white,
                    content: Text('Updated Successfully', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),),
                  );

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        await addNote();
        const snackBar = SnackBar(
          backgroundColor: Colors.white,
                    content: Text('Info Added Successfully', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),),
                  );

                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
      contact: contact,
      lincense: lincense,
      regnumber: regnumber,
      region: region,
      district: district,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      contact: contact,
      lincense: lincense,
      regnumber: regnumber,
      region: region,
      district: district,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }
}
