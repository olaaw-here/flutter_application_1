import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const new({super.key});

  @override
  State<AddNotePage> createState() => _MyNotesState();
}

class _MyNotesState extends State<AddNotePage> {
  final judulController = TextEditingController();
  final deskripsiController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Notes"),
      ),
      body: Form(
        key : formKey,
        child: Padding(padding: const EdgeInsets.all(12.0),
        child: Column(
        children: [
          TextFormField(
            controller: judulController,
            decoration: const InputDecoration(
              label: Text("Judul"),
              hintText: "Masukkan judul catatan"
            ),
            validator: (value) {
              if(value == null || value.trim().isEmpty){
                return 'Judul Wajib diisi';
              }
              return null;
            },
          ),
          TextFormField(
            controller: deskripsiController,
            decoration: const InputDecoration(
              label: Text("Deskripsi"),
              hintText: "Masukkan Deskripsi Catatan",
          ),
          validator: (value) {
              if(value == null || value.trim().isEmpty){
                return 'Deskripsi Wajib diisi';
              }
              return null;
          },
          ),
          SizedBox(height: 80),
          ElevatedButton(onPressed: (){
            if (!formKey.currentState!.validate()){
              return;
            }

            final note = {
              'judul' : judulController.text,
              'deskripsi' : deskripsiController.text,
            };

            Navigator.pop(context, note);
          },
          child: Text("Simpan Data"),)
        ],
        ),
      ),
      ),
    );
  }
}