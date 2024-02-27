import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class BrandService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createBrand(String name) {
    var id = const Uuid();
    String brand = id.v1();
    firestore.collection('brands').doc(brand).set({'brandName': name});
  }

  Future<List<DocumentSnapshot>> getBrands() {
    return firestore.collection('brands').get().then((snaps) {
      return snaps.docs;
    });
  }
}
