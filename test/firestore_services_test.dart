import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:test/test.dart';

void main() {
  test('firestore testing', () async {
    final instance = FakeFirebaseFirestore();
    await instance.collection('barangs').add({
      'nama': 'Barang Test',
      'tempat': 'Malang',
      'harga': int.tryParse('20') ?? 0,
      'deskripsi': 'deskripsi test',
      'stok': int.tryParse('5') ?? 0,
    });
    final snapshot = await instance.collection('barangs').get();
    if (kDebugMode) {
      print(snapshot.docs.length);
    }
    if (kDebugMode) {
      print(snapshot.docs.first.get('nama'));
    }
    if (kDebugMode) {
      print(instance.dump());
    }
  });
}
