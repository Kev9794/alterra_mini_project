import 'package:alterra_mini_project/views/provider/input_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InputBarang extends StatefulWidget {
  const InputBarang({super.key});

  @override
  State<InputBarang> createState() => _InputBarangState();
}

class _InputBarangState extends State<InputBarang> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InputProvider>(context);
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barangs = firestore.collection('barangs');
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 244, 106, 0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo/logo2.png', width: 100),
                  const Text(
                    "Input Barang",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    color: Color(0xFFFFFDE3),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                margin: const EdgeInsets.only(top: 10),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Masukkan Detail Barang :",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(provider.idcode),
                        TextFormField(
                          controller: provider.id,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.blue,
                            ),
                            hintText: "Masukkan ID Barang",
                            labelText: 'ID Barang',
                            border: OutlineInputBorder(),
                          ),
                          validator: provider.validasiId,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            provider.scanbarcode();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.qr_code_scanner),
                              Text(
                                'Scan QR Code',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: provider.nama,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 196, 72, 0),
                            ),
                            hintText: "Masukkan Nama Barang",
                            labelText: 'Nama Barang',
                            border: OutlineInputBorder(),
                          ),
                          validator: provider.validasiNama,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: provider.tempat,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_pin,
                              color: Color.fromARGB(255, 209, 171, 0),
                            ),
                            hintText: "Malang/Bali/Jakarta/Surabaya",
                            labelText: 'Tempat Barang',
                            border: OutlineInputBorder(),
                          ),
                          validator: provider.validasiTempat,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: provider.harga,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.attach_money,
                              color: Colors.green,
                            ),
                            hintText: "Masukkan Harga Barang",
                            labelText: 'Harga Barang',
                            border: OutlineInputBorder(),
                          ),
                          validator: provider.validasiHarga,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          maxLines: 3,
                          controller: provider.deskripsi,
                          keyboardType: TextInputType.multiline,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.article,
                              color: Colors.blue,
                            ),
                            hintText: "Masukkan Deskripsi Barang",
                            labelText: 'Deskripsi Barang',
                            border: OutlineInputBorder(),
                          ),
                          validator: provider.validasiDeskripsi,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 190,
                              child: TextFormField(
                                controller: provider.stok,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.green,
                                  ),
                                  hintText: "Masukkan Stok Barang",
                                  labelText: 'Stok Barang',
                                  border: OutlineInputBorder(),
                                ),
                                validator: provider.validasiStok,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle_outline,
                                size: 45,
                              ),
                              color: Colors.blue,
                              onPressed: () {
                                provider.plusStok();
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                size: 45,
                              ),
                              color: Colors.grey,
                              onPressed: () {
                                provider.minusStok();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 180,
                              child: ElevatedButton(
                                onPressed: () async {
                                  //// ADD DATA FIREBASE
                                  if (formKey.currentState!.validate()) {
                                    barangs.add({
                                      'id': int.tryParse(provider.id.text) ?? 0,
                                      'nama': provider.nama.text,
                                      'tempat': provider.tempat.text,
                                      'harga':
                                          int.tryParse(provider.harga.text) ??
                                              0,
                                      'deskripsi': provider.deskripsi.text,
                                      'stok':
                                          int.tryParse(provider.stok.text) ?? 0,
                                    });
                                    provider.id.clear();
                                    provider.nama.clear();
                                    provider.tempat.clear();
                                    provider.harga.clear();
                                    provider.deskripsi.clear();
                                    provider.stok.clear();
                                    Navigator.pop(context);
                                  }
                                },
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.green),
                                ),
                                child: const Text('Save'),
                              ),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            SizedBox(
                              width: 180,
                              child: ElevatedButton(
                                onPressed: () async {
                                  // deleteBarang();
                                  provider.id.clear();
                                  provider.nama.clear();
                                  provider.tempat.clear();
                                  provider.harga.clear();
                                  provider.deskripsi.clear();
                                  provider.stok.clear();
                                  Navigator.pop(context);
                                },
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.red),
                                ),
                                child: const Text('Cancel'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
