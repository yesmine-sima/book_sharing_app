import 'package:flutter/material.dart';
import 'package:newproject/posts.dart';
import 'package:newproject/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_post.dart';

// ignore: camel_case_types
class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

// ignore: camel_case_types
class _welcomeState extends State<welcome> {
String name ="";
  Future getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('name');
    });
  }

Future logOut(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('name');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninPage()));
  }



  @override
  void initState(){
    super.initState();
    getName();
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("Dashboard")),
  //     body: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children:[
  //         Center(
  //           child: Text(name),
  //           ),
  //           SizedBox(height: 20.0),
  //           MaterialButton(
  //             color: Colors.blue,
  //             onPressed: (){
  //               logOut(context);
  //             },child: Text("Log Out", style: TextStyle(color: Colors.white)),
  //             )
  //       ]
  //     )
      
  //   );
  // }

   Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text("Hello User"),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Sign Out'),
                  onTap: () {
                    logOut(context);
                  },
                ),
              ],
            ),
          )
,
      appBar: AppBar(
        title: Text("DASHBOARD"),
        elevation: .1,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem(name, Icons.person_outline_rounded),
            makeDashboardItem("Add Post", Icons.add),
            makeDashboardItem("Active Post", Icons.notifications_active_outlined),
            makeDashboardItem4("View All", Icons.notifications_active_outlined),
            
          ],
        ),
      ),
      
    );
  }

  Card makeDashboardItem1(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImageDemo()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }


  Card makeDashboardItem(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImageDemo()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }



  

  Card makeDashboardItem4(String title, IconData icon) {
    return Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdsPost()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }



}