import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: camel_case_types
class Category_List{
  final int id;
  final String name;
  bool isCheck;
  final dynamic icon;
  Category_List(this.id, this.name, this.isCheck, {this.icon});

}

// ignore: non_constant_identifier_names
final List<Category_List> category_list = [
  Category_List(9,"General Knowledge", false, icon: FontAwesomeIcons.globeAsia),
  Category_List(10,"Books", false, icon: FontAwesomeIcons.bookOpen),
  Category_List(11,"Film", false, icon: FontAwesomeIcons.video),
  Category_List(12,"Music", false, icon: FontAwesomeIcons.music),
  Category_List(13,"Musicals & Theatres", false, icon: FontAwesomeIcons.theaterMasks),
  Category_List(14,"Television", false, icon: FontAwesomeIcons.tv),
  Category_List(15,"Video Games", false, icon: FontAwesomeIcons.gamepad),
  Category_List(16,"Board Games", false, icon: FontAwesomeIcons.chessBoard),
  Category_List(17,"Science & Nature", false, icon: FontAwesomeIcons.microscope),
  Category_List(18,"Computer", false, icon: FontAwesomeIcons.laptopCode),
  Category_List(19,"Maths", false, icon: FontAwesomeIcons.sortNumericDown),
  Category_List(20,"Mythology", false),
  Category_List(21,"Sports", false, icon: FontAwesomeIcons.footballBall),
  Category_List(22,"Geography", false, icon: FontAwesomeIcons.mountain),
  Category_List(23,"History", false, icon: FontAwesomeIcons.monument),
  Category_List(24,"Politics", false),
  Category_List(25,"Art", false, icon: FontAwesomeIcons.paintBrush),
  Category_List(26,"Celebrities", false),
  Category_List(27,"Animals", false, icon: FontAwesomeIcons.dog),
  Category_List(28,"Vehicles", false, icon: FontAwesomeIcons.carAlt),
  Category_List(29,"Comics", false),
  Category_List(30,"Gadgets", false, icon: FontAwesomeIcons.mobileAlt),
  Category_List(31,"Japanese Anime & Manga", false),
  Category_List(32,"Cartoon & Animation", false),
];