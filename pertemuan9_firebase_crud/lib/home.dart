import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/add_data.dart';
import 'package:crud/data_mahasiswa.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference mahasiswa =
      FirebaseFirestore.instance.collection('mahasiswa');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan CRUD'),
        centerTitle: true,
      ),
      //StreamBuilder digunakan untuk menerima data yang akan ikut diperbarui bila terjadi perubahan pada data.
      body: StreamBuilder<QuerySnapshot>(
        //Mengambil data dari collection mahasiswa dengan urutan kelas menurun disimpan dalam sebuah snapshot.
          stream: mahasiswa.orderBy('kelas', descending: true).snapshots(),
          builder: (context, snapshot) {
            //Mengecek apakah koneksi snapshot sedang aktif atau tidak
            if (snapshot.connectionState == ConnectionState.active) {
              //Mengecek apakah snapshot memiliki data atau kosong
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                //Jika data kosong tampilkan tulisan data kosong
                return Center(
                  child: const Text('Data Kosong'),
                );
                //Jika snapshot memiliki data maka ubah bentuk map dari snapshot ke dalam sebuah widget list
              } else {
                return ListView(
                    children: snapshot.data!.docs
                        .map((e) => dataMahasiswa(
                            npm: e['npm'],
                            nama: e['nama'],
                            kelas: e['kelas'],
                            id: e['id']))
                        .toList());
              }
              //Selain koneksi aktif maka tampilkan sebuah tampilan loading
            } else {
              return const CircularProgressIndicator();
            }
          }),
      //Button untuk menambahkan data baru
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddData()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  //Widget list yang digunakan untuk menampilkan data dari snapshot streambuilder
  Widget dataMahasiswa({String? npm, String? nama, String? kelas, String? id}) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(kelas!),
      ),
      title: Text(nama!),
      subtitle: Text(npm!),
      //Ketika ListTile ditekan pindah ke halaman lain untuk update / hapus data mahasiswa tersebut
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DataMahasiswa(id!)),
        );
      },
    );
  }
}
