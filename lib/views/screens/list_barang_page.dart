import 'package:alterra_mini_project/views/screens/barang_widget.dart';
import 'package:alterra_mini_project/views/screens/input_barang_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'barang_widget.dart' as brg;

class ListBarang extends StatefulWidget {
  const ListBarang({super.key});

  @override
  State<ListBarang> createState() => _ListBarangState();
}

const List<String> list = <String>['Malang', 'Bali', 'Jakarta', 'Surabaya'];

class _ListBarangState extends State<ListBarang> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barangs = firestore.collection('barangs');
    return Scaffold(
        backgroundColor: const Color(0xFFFFEEB3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
                    child: Container(
                      width: 600,
                      height: 68,
                      margin: const EdgeInsets.all(16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: const Color.fromARGB(255, 152, 63, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                  child: Row(
                                children: const [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    'List',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 150,
                                  ),
                                  Text(
                                    'Barang',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: const Color.fromARGB(255, 255, 245, 226),
                      image: const DecorationImage(
                        fit: BoxFit.scaleDown,
                        image: AssetImage('assets/logo/logo.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(130, 0, 30, 0),
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEFAE0),
                        border: Border.all(
                          color: const Color(0xFFF4B183),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.indigo),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/input');
                      },
                      style: ButtonStyle(
                        alignment: Alignment.centerRight,
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      child: const Text('add barang'),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 230,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFF4B183),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      // FutureBuilder(
                      //   future: barangs.get(),
                      //   builder: (_, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return Column(
                      //           children: snapshot.data!.docs
                      //               .map((e) => CardBarang(
                      //                   e.data()!['nama'], e.data()!['stok']))
                      //               .toList());
                      //     } else {
                      //       return Text('Loading');
                      //     }
                      //   },
                      // )
                      StreamBuilder<QuerySnapshot>(
                        stream: barangs
                            .where('tempat', isEqualTo: dropdownValue)
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: (snapshot.data?.docs ?? [])
                                  .map(
                                    (e) => CardBarang(
                                      e['nama'],
                                      e['stok'],
                                      e['id'],
                                      e['tempat'],
                                      e['harga'],
                                      e['deskripsi'],
                                      onDelete: () {
                                        barangs.doc(e.id).delete();
                                      },
                                      onUpdate: () {
                                        barangs.doc(e.id).update({
                                          'nama': brg.editNama.text,
                                          'tempat': brg.editTempat.text,
                                          'harga': int.tryParse(
                                                  brg.editHarga.text) ??
                                              0,
                                          'deskripsi': brg.editDeskripsi.text,
                                          'stok':
                                              int.tryParse(brg.editStok.text) ??
                                                  0,
                                        });
                                      },
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return const Text('Loading');
                          }
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
