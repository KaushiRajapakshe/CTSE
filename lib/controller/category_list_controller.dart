import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insightquiz/models/category.dart';
import 'package:insightquiz/models/category_list.dart';
import 'package:insightquiz/ui/pages/home.dart';

import 'delete_category_list.dart';

class CategoryList extends StatefulWidget {
  final List<Category_List> categoryList = category_list;

  @override
  _CategoryListState createState() {
    return new _CategoryListState();
  }
}

class _CategoryListState extends State<CategoryList> {
  static List<Category_Names> categoryName = [];
  final List<Category_Names> categoryNameList = category_names;
  final List<Category_Names> nameList = categoryName;
  static String collectionName = "Categories";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("Category"),
            actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CategoryListDelete()),
              );
            },
          )
        ]),
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
                  addCategory();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
                child: new Text('Save'),
              )
            ],
          ),
        ));
  }

  //add category data
  static addCategory() {
    try {
      for (Category_Names c in categoryName) {
        Firestore.instance.runTransaction(
          (Transaction transaction) async {
            await Firestore.instance
                .collection(collectionName)
                .document(c.name)
                .setData(c.toJson());
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

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
