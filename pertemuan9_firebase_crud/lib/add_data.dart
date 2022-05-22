import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  //Menyiapkan collection mahasiswa
  final CollectionReference mahasiswa =
      FirebaseFirestore.instance.collection('mahasiswa');
  //Menyiapkan TextEditingController agar data dari textformfield dapat digunakan.
  final TextEditingController _npmController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  //Menyiapkan Key untuk form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 00.06,
              vertical: MediaQuery.of(context).size.height * 00.03),
          //Membuat sebuah form agar dapat melakukan validasi untuk TextFormField
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 00.02),
                    child: TextFormField(
                      controller: _npmController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'NPM'),
                      //Validasi TextFormField
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[0-9]').hasMatch(value)) {
                          return 'NPM Hanya Boleh Angka';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 00.02),
                    child: TextFormField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Nama'),
                      //Validasi TextFormField
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 00.02),
                    child: TextFormField(
                      controller: _kelasController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Kelas'),
                      //Validasi TextFormField
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Kelas Tidak Boleh Kosong';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                        onPressed: () {
                          //Melakukan validasi form sebelumnya ketika tombol ditekan, bila telah sesuai maka setState addMahasiswa
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              //Menyimpan data ke database
                              addMahasiswa(context);
                            });
                          }
                        },
                        child: const Text('Tambah Data')),
                  )
                ],
              ))),
    );
  }

  Future addMahasiswa(BuildContext context) async {
    //Menyiapkan referensi dokumen yang akan disimpan nanti
    DocumentReference docReference = mahasiswa.doc();

    //Menyimpan data ke dalam database
    docReference.set({
      'npm': _npmController.text.trim(),
      'nama': _namaController.text.trim(),
      'kelas': _kelasController.text.trim(),
      //Menyimpan ID berdasarkan docReference agar mudah saat pencarian data.
      'id': docReference.id
    //Jika set berhasil maka tampilkan sebuah Snack Bar setelah itu kembali ke halaman sebelumnya.
    }).then((value) => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data Mahasiswa Berhasil Ditambahkan'))));
        Navigator.pop(context);
  }
}
