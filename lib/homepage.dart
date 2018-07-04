import 'package:flutter/material.dart';
import 'final.dart';
import 'discount.dart';
import 'original.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  TextEditingController finalt1 = new TextEditingController();
  TextEditingController finalt2 = new TextEditingController();
  TextEditingController discountt1 = new TextEditingController();
  TextEditingController discountt2 = new TextEditingController();
  TextEditingController originalt1 = new TextEditingController();
  TextEditingController originalt2 = new TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    finalt1.dispose();
    finalt2.dispose();
    discountt1.dispose();
    discountt2.dispose();
    originalt1.dispose();
    originalt2.dispose();
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    final clearButton = RaisedButton(
      onPressed: () {
        switch (tabController.index) {
          case 0:
            finalt1.clear();
            finalt2.clear();
            break;
          case 1:
            discountt1.clear();
            discountt2.clear();
            break;
          case 2:
            originalt1.clear();
            originalt2.clear();
        }
      },
      child: Text(
        "CLEAR",
        style: TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold),
      ),
      //color: Colors.black87,
      //textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
              title: Text(
                "dimple",
                style: TextStyle(fontSize: 34.0)
              ),
              centerTitle: true,
            ),
        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Flexible(
              fit: FlexFit.loose,
              child: new TabBarView(
                controller: tabController,
                children: <Widget>[
                  new Final(finalt1, finalt2),
                  new Discount(discountt1, discountt2),
                  new Original(originalt1, originalt2)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35.0,
                right: 35.0
              ),
              child: clearButton,
            ),
            new SizedBox(height: 10.0)
          ],
        ),
        bottomNavigationBar: Material(
            child: TabBar(
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              controller: tabController,
              tabs: <Widget>[
                new Tab(text: "Final price", icon: Icon(Icons.attach_money)),
                new Tab(text: "Discount", icon: Icon(Icons.trending_down)),
                new Tab(text: "Original price", icon: Icon(Icons.attach_money))
              ],
            ),
          ),
        );
  }
}
