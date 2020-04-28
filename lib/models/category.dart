import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});
}

final List<Category> categories = [
  Category(9,"General Knowledge", icon: FontAwesomeIcons.globeAsia),
  Category(10,"Books", icon: FontAwesomeIcons.bookOpen),
  Category(11,"Film", icon: FontAwesomeIcons.video),
  Category(12,"Music", icon: FontAwesomeIcons.music),
  Category(13,"Musicals & Theatres", icon: FontAwesomeIcons.theaterMasks),
  Category(14,"Television", icon: FontAwesomeIcons.tv)
];

class Category_Names{
  String name;
  DocumentReference reference;
  List<Category_Names> cNnames;

  Category_Names(this.name);
  String uName;

  Category_Names.fromMap(Map<String, dynamic> map, {this.reference}) {
    name = map["name"];
  }

  Category_Names.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {'user_name': uName, 'name': name};
  }
  toJson1() {
    return {'name': name};
  }
}

List<Category_Names> category_names = [
  Category_Names("General Knowledge"),
  Category_Names("Science & Nature"),
  Category_Names("Computer"),
  Category_Names("Maths"),
  Category_Names("History"),
  Category_Names("Animals")
];