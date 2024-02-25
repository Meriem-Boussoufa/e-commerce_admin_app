import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class CategoryService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createCategory(String name) {
    var id = const Uuid();
    String category = id.v1();
    firestore
        .collection('categories')
        .doc(category)
        .set({'categoryName': name});
  }
}
