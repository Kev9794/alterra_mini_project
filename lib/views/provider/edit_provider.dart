import 'package:flutter/material.dart';

class EditProvider with ChangeNotifier {
  String? validasiId(String? value) {
    if (value == null || value.isEmpty) {
      return 'ID tidak boleh kosong';
    }

    if (!value.contains(RegExp(r'^[0-9]*$'))) {
      return 'ID telefon harus berupa angka';
    }

    return null;
  }

  String? validasiNama(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nama Barang tidak boleh kosong';
    }

    final nameParts = value.split(' ');

    for (final namePart in nameParts) {
      if (namePart.contains(RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]'))) {
        return 'Nama Barang tidak boleh mengandung angka atau karakter khusus';
      }
    }

    return null;
  }

  String? validasiDeskripsi(String? value) {
    if (value == null || value.isEmpty) {
      return 'Deskripsi tidak boleh kosong';
    }

    final nameParts = value.split(' ');

    for (final namePart in nameParts) {
      if (namePart.contains(RegExp(r'[0-9!@#\$%^&*(),.?":{}|<>]'))) {
        return 'Deskripsi tidak boleh mengandung angka atau karakter khusus';
      }
    }

    return null;
  }

  String? validasiTempat(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tempat tidak boleh kosong';
    }

    if (value == 'Malang' ||
        value == 'Bali' ||
        value == 'Jakarta' ||
        value == 'Surabaya') {
      return null;
    }

    return 'Tempat harus Malang/Bali/Jakarta/Surabaya';
  }

  String? validasiHarga(String? value) {
    if (value == null || value.isEmpty) {
      return 'Harga tidak boleh kosong';
    }

    if (!value.contains(RegExp(r'^[0-9]*$'))) {
      return 'Stok harus berupa angka';
    }

    return null;
  }

  String? validasiStok(String? value) {
    if (value == null || value.isEmpty) {
      return 'Stok tidak boleh kosong';
    }

    if (!value.contains(RegExp(r'^[0-9]*$'))) {
      return 'Nomor telefon harus berupa angka';
    }

    return null;
  }
}
