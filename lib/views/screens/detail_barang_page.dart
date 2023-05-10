import 'package:alterra_mini_project/models/form_model.dart';
import 'package:flutter/material.dart';

class DetailBarang extends StatelessWidget {
  const DetailBarang(this.form, {super.key});
  final FormModel form;
  @override
  Widget build(BuildContext context) {
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
                    "Detail Barang",
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
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFFDE3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Detail Barang :",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          const Text('ID', style: TextStyle(fontSize: 19)),
                          const SizedBox(
                            width: 105,
                          ),
                          Text(':${form.id!}',
                              style: const TextStyle(fontSize: 19)),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          const Text('Nama', style: TextStyle(fontSize: 19)),
                          const SizedBox(
                            width: 69,
                          ),
                          Text(':${form.nama!}',
                              style: const TextStyle(fontSize: 19)),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          const Text('Tempat', style: TextStyle(fontSize: 19)),
                          const SizedBox(
                            width: 54,
                          ),
                          Text(':${form.tempat!}',
                              style: const TextStyle(fontSize: 19)),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          const Text('Harga', style: TextStyle(fontSize: 19)),
                          const SizedBox(
                            width: 68,
                          ),
                          Text(':Rp.${form.harga!}',
                              style: const TextStyle(fontSize: 19)),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          const Text('Deskripsi',
                              style: TextStyle(fontSize: 19)),
                          const SizedBox(
                            width: 39,
                          ),
                          Text(':${form.deskripsi!}',
                              style: const TextStyle(fontSize: 19)),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          const Text('Jumlah Stok',
                              style: TextStyle(fontSize: 19)),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(':${form.stok!}',
                              style: const TextStyle(fontSize: 19)),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side:
                                          const BorderSide(color: Colors.red))),
                          alignment: Alignment.centerRight,
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFFF6000)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_back),
                            Text('Kembali ke List'),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
