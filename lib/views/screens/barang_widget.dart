// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'list_barang_page.dart' as lists;

class CardBarang extends StatefulWidget {
  final String nama;
  final int stok;
  final int id;
  final String tempat;
  final int harga;
  final String deskripsi;
  //// Pointer to Update Function
  final Function? onUpdate;
  // //// Pointer to Delete Function
  final Function? onDelete;

  const CardBarang(
      this.nama, this.stok, this.id, this.tempat, this.harga, this.deskripsi,
      {this.onUpdate, this.onDelete, super.key});

  @override
  State<CardBarang> createState() => _CardBarangState();
}

TextEditingController editNama = TextEditingController();
TextEditingController editTempat = TextEditingController();
TextEditingController editHarga = TextEditingController();
TextEditingController editDeskripsi = TextEditingController();
TextEditingController editStok = TextEditingController();

class _CardBarangState extends State<CardBarang> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
        color: const Color(0xFFF7F1E5),
        elevation: 3,
        child: ListTile(
          title: Text(
            widget.nama,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            'Jumlah Stok : ${widget.stok}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: SizedBox(
            width: 97,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    editNama.value = editNama.value.copyWith(
                      text: widget.nama,
                      selection:
                          TextSelection.collapsed(offset: widget.nama.length),
                    );
                    editTempat.value = editTempat.value.copyWith(
                      text: widget.tempat,
                      selection:
                          TextSelection.collapsed(offset: widget.tempat.length),
                    );
                    editHarga.value = editHarga.value.copyWith(
                      text: widget.harga.toString(),
                      selection: TextSelection.collapsed(
                          offset: widget.harga.toString().length),
                    );
                    editDeskripsi.value = editDeskripsi.value.copyWith(
                      text: widget.deskripsi,
                      selection: TextSelection.collapsed(
                          offset: widget.deskripsi.length),
                    );
                    editStok.value = editStok.value.copyWith(
                      text: widget.stok.toString(),
                      selection: TextSelection.collapsed(
                          offset: widget.stok.toString().length),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text('Update Data'),
                          content: SizedBox(
                            height: 500,
                            width: 200,
                            child: ListView(
                              children: [
                                Text('ID : ${widget.id}'),
                                TextFormField(
                                  controller: editNama,
                                  decoration:
                                      const InputDecoration(hintText: 'Nama'),
                                ),
                                TextFormField(
                                  controller: editTempat,
                                  decoration:
                                      const InputDecoration(hintText: 'Tempat'),
                                ),
                                TextFormField(
                                  controller: editHarga,
                                  decoration:
                                      const InputDecoration(hintText: 'Harga'),
                                ),
                                TextFormField(
                                  maxLines: 3,
                                  controller: editDeskripsi,
                                  decoration: const InputDecoration(
                                      hintText: 'Deskripsi'),
                                ),
                                TextFormField(
                                  controller: editStok,
                                  decoration:
                                      const InputDecoration(hintText: 'Stok'),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                widget.onUpdate!();
                                Navigator.pop(context);
                                editNama.clear();
                                editTempat.clear();
                                editHarga.clear();
                                editDeskripsi.clear();
                                editStok.clear();
                              },
                              child: const Text('Send'),
                            ),
                          ],
                        );
                      },
                    );
                    // if (onUpdate != null) {
                    //   onUpdate();
                    // }
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (widget.onDelete != null) {
                      widget.onDelete!();
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
