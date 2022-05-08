import 'package:bookshop/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = StreamProvider((ref) => ProductProvider().getUser());

class ProductProvider {
  CollectionReference dbUser = FirebaseFirestore.instance.collection('books');

  Stream<List<User>> getUser() {
    final data = dbUser.snapshots().map((event) => _getFromSnap(event));
    return data;
  }

  List<User> _getFromSnap(QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map((e) => User.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }
}
