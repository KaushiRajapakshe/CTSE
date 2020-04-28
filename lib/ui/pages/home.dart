import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:insightquiz/controller/category_list_controller.dart';
import 'package:insightquiz/database/crud.dart';
import 'package:insightquiz/models/category.dart';
import 'package:insightquiz/ui/widgets/quiz_options.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];
  String collectionName = "Categories";
  int length = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Insight Quiz'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CategoryList()),
                );
              },
            )
          ],
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 86,
              ),
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "Select a category to start the quiz",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 120.0, bottom: 20.0),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.9,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0),
                      delegate: SliverChildBuilderDelegate(
                        _buildCategoryItem,
                        childCount: categories.length,
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () => _categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color(0xFF5E35B1),
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          AutoSizeText(
            category.name,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }

  int getCategoryLength() {
    int lengthn = 0;
    crud n = new crud();
    n.getLength().then((dist) {
      lengthn = dist;
    });
    if(lengthn == 0){
      length = categories.length;
    }
    else{
      length = lengthn;
    }
    return length;
  }
}
