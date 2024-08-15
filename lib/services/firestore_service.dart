import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/models/product_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch all products from Firestore
  Stream<List<Product>> getProducts() {
    return _db.collection('products').snapshots().map((snapshot) => snapshot
        .docs
        .map((doc) => Product.fromMap(doc.data(), doc.id))
        .toList());
  }

  // Add a new product to Firestore
  Future<void> addProduct(Product product) {
    return _db.collection('products').add(product.toMap());
  }

  // Update an existing product in Firestore
  Future<void> updateProduct(Product product) {
    return _db.collection('products').doc(product.id).update(product.toMap());
  }

  // Delete a product from Firestore
  Future<void> deleteProduct(String id) {
    return _db.collection('products').doc(id).delete();
  }
}
