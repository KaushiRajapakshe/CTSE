// IT16178700
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insightquiz/models/category.dart';

// crud class implementation
class crud {
  String collectionName = "Categories";
  String collectionList = "Categories_List";
  List<Category_Names> category_names = [];

  // update category data
  Firestore databaseReference = Firestore.instance;

  // getCategory function implementation as async for get await
  // until getting database data
  getCategory(String userName) async {
    Stream<QuerySnapshot> stream = await databaseReference
        .collection(collectionName)
        .where("user_name", isEqualTo: userName)
        .snapshots();
    stream.listen((snapshot) {
      snapshot.documents.forEach((doc) {
        // ignore: unnecessary_statements
        doc.data['name'];
        Category_Names item = new Category_Names(doc.data['name']);
        category_names.add(item);
      });

      // get category name list
      try {
        for (Category_Names c in category_names) {
          Firestore.instance.runTransaction(
                (Transaction transaction) async {
              await Firestore.instance
                  .collection(collectionList)
                  .document(c.name)
                  .setData(c.toJson1());
            },
          );
        }
      } catch (e) {
        print(e.toString());
      }
    });
  }

  // retrieve data
  getCategoryList() async {
    await databaseReference
        .collection(collectionList)
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        Category_Names item = new Category_Names(f.data['name']);
        category_names.add(item);
      });
    });
    return category_names;
  }

  // get category length of data to display categories
  Future<int> getLength() async {
    await databaseReference
        .collection(collectionList)
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      if (snapshot.documents != null) {
        return snapshot.documents.length;
      } else {
        return categories.length;
      }
    });
  }
}