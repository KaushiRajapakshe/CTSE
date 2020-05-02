// IT16178700
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insightquiz/models/category.dart';
import 'package:insightquiz/models/category_list.dart';
import 'package:insightquiz/ui/pages/home.dart';

// CategoryListDelete Stateful Widget implementation
class CategoryListDelete extends StatefulWidget {
  final List<Category_List> categoryList = category_list;

  @override
  _CategoryListDeleteState createState() {
    return new _CategoryListDeleteState();
  }
}

// _CategoryListDeleteState implementation
class _CategoryListDeleteState extends State<CategoryListDelete> {
  static List<Category_Names> categoryName = [];
  final List<Category_Names> categoryNameList = category_names;
  final List<Category_Names> nameList = categoryName;
  static String collectionName = "Categories";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Category"),
        ),
        body: new Container(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              new Expanded(
                  child: new ListView(
                    padding: new EdgeInsets.symmetric(vertical: 8.0),
                    children:
                    widget.categoryList.map((Category_List category_list) {
                      return new CategoryItemList(category_list);
                    }).toList(),
                  )),
              new RaisedButton(
                onPressed: () {
                  for (Category_List p in widget.categoryList) {
                    if (p.isCheck) {
                      Category_Names searchItem = new Category_Names(p.name);
                      categoryName.add(searchItem);
                    }
                  }
                  delete();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
                child: new Text('Delete'),
              )
            ],
          ),
        ));
  }

  //delete category data
  delete() {
    for (Category_Names c in categoryName) {
      Firestore.instance.runTransaction(
              (Transaction transaction) async {
            await transaction.delete(c.reference);
          }
      );
    }
  }
}

// CategoryListDelete Stateful Widget implementation
class CategoryItemList extends StatefulWidget {
  final Category_List category_list;

  CategoryItemList(Category_List category_list)
      : category_list = category_list,
        super(key: new ObjectKey(category_list));

  @override
  CategoryItemState createState() {
    return new CategoryItemState(category_list);
  }
}

// CategoryItemState implementation
class CategoryItemState extends State<CategoryItemList> {
  final Category_List category_list;

  CategoryItemState(this.category_list);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Row(
          children: <Widget>[
            new Expanded(child: new Text(category_list.name)),
            new Checkbox(
                value: category_list.isCheck,
                onChanged: (bool value) {
                  setState(() {
                    category_list.isCheck = value;
                  });
                })
          ],
        ));
  }
}
