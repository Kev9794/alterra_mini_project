import 'package:alterra_mini_project/views/screens/list_barang_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class InputBarang extends StatefulWidget {
  const InputBarang({super.key});

  @override
  State<InputBarang> createState() => _InputBarangState();
}

class _InputBarangState extends State<InputBarang> {
  String idcode = "";
  String getcode = "";
  TextEditingController id = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController stok = TextEditingController();

  Future scanbarcode() async {
    getcode = await FlutterBarcodeScanner.scanBarcode(
        "#009922", "Batalkan", true, ScanMode.DEFAULT);
    setState(() {
      id.text = getcode;
    });
  }

  void plusStok() {
    int stoklama = int.parse(stok.text.isNotEmpty ? stok.text : '0');
    int stokBaru = stoklama + 1;
    setState(() {
      stok.text = stokBaru.toString();
      stok.selection =
          TextSelection.fromPosition(TextPosition(offset: stok.text.length));
    });
  }

  void minusStok() {
    int stoklama = int.parse(stok.text.isNotEmpty ? stok.text : '0');
    int stokBaru = stoklama - 1;
    setState(() {
      stok.text = stokBaru.toString();

      stok.selection =
          TextSelection.fromPosition(TextPosition(offset: stok.text.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF77E21),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                children: const [
                  Icon(
                    Icons.store,
                    size: 50.0,
                    color: Color(0xFFFEF9A7),
                  ),
                  Text(
                    "Input Barang Supermarket",
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
                      Text(idcode),
                      TextFormField(
                        controller: id,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.blue,
                          ),
                          hintText: "Masukkan ID Barang",
                          labelText: 'ID Barang',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          scanbarcode();
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
                        controller: nama,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 196, 72, 0),
                          ),
                          hintText: "Masukkan Nama Barang",
                          labelText: 'Nama Barang',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: harga,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Colors.green,
                          ),
                          hintText: "Masukkan Harga Barang",
                          labelText: 'Harga Barang',
                          border: OutlineInputBorder(),
                        ),
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
                        controller: deskripsi,
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
                              controller: stok,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.green,
                                ),
                                hintText: "Masukkan Stok Barang",
                                labelText: 'Stok Barang',
                                border: OutlineInputBorder(),
                              ),
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
                              plusStok();
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              size: 45,
                            ),
                            color: Colors.grey,
                            onPressed: () {
                              minusStok();
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
                                // await assignBarang();
                                Navigator.pop(context);
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
                                Navigator.pop(context);
                              },
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(Colors.red),
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
          ],
        ),
      ),
    );
  }
}
