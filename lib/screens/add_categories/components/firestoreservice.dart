import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'category.dart';

final CollectionReference myCollection =
    FirebaseFirestore.instance.collection('categories');

class FirestoreService {
  Future<Category> createTODOCategory(
    String categoryname,
    String categorydetails,
    String categorydate,
    String categorytime,
    // String categorytype
  ) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.doc());

      final Category category = new Category(
        categoryname, categorydetails,
        categorydate, categorytime,
        // categorytype
      );
      final Map<String, dynamic> data = category.toMap();
      await tx.set(ds.reference, data);
      return data;
    };

    return FirebaseFirestore.instance
        .runTransaction(createTransaction)
        .then((mapData) {
      return Category.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getCategoryList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }
}
