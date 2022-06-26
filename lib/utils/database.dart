import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');
var uuid = Uuid();
String userId = uuid.v1();

class Database {
  static Future<void> addItem({
    required String nomePeca,
    required String descricao,
    required String preco,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userId).collection('pecas').doc();
   
    Map<String, dynamic> data = <String, dynamic>{
      "nomePeca": nomePeca,
      "descricao": descricao,
      "preco": preco,
    };
     print(data);

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  // static Future<void> updateItem({
  //   required String nome,
  //   required String descricao,
  //   required String preco,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(userUid).collection('pecas').doc(docId);

  //   Map<String, dynamic> data = <String, dynamic>{
  //     "title": title,
  //     "description": description,
  //   };

  //   await documentReferencer
  //       .update(data)
  //       .whenComplete(() => print("Note item updated in the database"))
  //       .catchError((e) => print(e));
  // }

  // static Stream<QuerySnapshot> readpecas() {
  //   CollectionReference notesItemCollection =
  //       _mainCollection.doc(userUid).collection('pecas');

  //   return notesItemCollection.snapshots();
  // }

  // static Future<void> deleteItem({
  //   required String docId,
  // }) async {
  //   DocumentReference documentReferencer =
  //       _mainCollection.doc(userUid).collection('pecas').doc(docId);

  //   await documentReferencer
  //       .delete()
  //       .whenComplete(() => print('Note item deleted from the database'))
  //       .catchError((e) => print(e));
  // }
}
