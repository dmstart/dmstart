import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

// class MainPage extends StatelessWidget {
//   var _pageIndex = 0; //페이지 정보
//   MainPage({this.email});
//
//   final String email;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//           title: new Text("MyApp"), backgroundColor: Colors.greenAccent),
//       body: new Container(child: new Center(child: new Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           new IconButton(
//             icon: new Icon(Icons.account_balance, color: Colors.lime),
//             iconSize: 100.0,
//             onPressed: () {
//               Navigator.pushNamed(context, "/Page1");
//             },),
//           new Text(
//             "MY App", style: new TextStyle(fontSize: 50.0, color: Colors.red,),)
//         ],),)
//
//     )
//
//
//     );
//
//
//     // body: Container(
//     //   child: Center(child: FlatButton(onPressed: (){
//     //     FirebaseAuth.instance.signOut();
//     //
//     //   },child: Text("Logout"),),
//     // )
//     // ),
//     // bottomNavigationBar: BottomNavigationBar(
//     //   onTap: (value){
//     //     _pageIndex = value;
//     //   },
//     // currentIndex: _pageIndex,
//     //   selectedItemColor: Colors.blue,
//     //   unselectedItemColor: Colors.lightBlueAccent,
//     //   items: <BottomNavigationBarItem>[
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.home),
//     //       title: Text('Home'),
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.whatshot),
//     //       title: Text('Player'),
//     //     ),
//     //     BottomNavigationBarItem(
//     //       icon: Icon(Icons.account_circle_rounded),
//     //       title: Text('Status'),
//     //     ),
//     //
//     //   ],
//     // ),
//   }
// }

// class MainPage extends StatelessWidget {
//   MainPage({this.email});
//
//   final String email;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       /**
//        * Tab 사용법
//        * 스크린을 TabController 위젯으로 구성함
//        * TabBar: 사용할 탭을 구성. appBar의 bottom으로 구현
//        * TabBarView: 탭이 선택될 시 디스플레이할 컨텐트 구성. body로 구현
//        */
//       home: DefaultTabController(
//         // 탭의 수 설정
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Tabs Demo'),
//             // TabBar 구현. 각 컨텐트를 호출할 탭들을 등록
//           ),
//           // TabVarView 구현. 각 탭에 해당하는 컨텐트 구성
//           body: TabBarView(
//             children: [
//               Icon(Icons.directions_car),
//               Icon(Icons.directions_transit),
//               Icon(Icons.directions_bike),
//             ],
//           ),
//           bottomNavigationBar: Material(
//             child: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.directions_car)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_bike)),
//               ],
//             ),
//
//
//           ),
//
//         ),
//       ),
//     );
//   }
// }
//

class MainPage extends StatelessWidget {
  @override
  MainPage({this.email});

  final String email;

  Widget build(BuildContext context) {
    return MaterialApp(
      title: email,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage_Home(),
    );
  }
}

// ignore: camel_case_types
class MainPage_Home extends StatefulWidget {
  @override
  _MainPage_HomeState createState() => _MainPage_HomeState();
}

class _MainPage_HomeState extends State<MainPage_Home> {
  var _pageIndex = 0;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ST_ART'),
        centerTitle: true,
        elevation: 6,
        leading: IconButton(
          // email
          icon: Icon(Icons.email),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            // map
            icon: Icon(Icons.pin_drop_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_pageIndex),

      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        currentIndex: _pageIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot), title: Text('Player')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), title: Text('Status'))
        ],
      ),
    );
  }
  List _widgetOptions = [
    Home_page(),
    Player_page(),
    Status_page()
  ];
}

class Home_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("homepage")
      ],

    );
  }
}
class Player_page extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FlatButton(

        ),
        FlatButton(
          color: Colors.blue,
          child: Text("read button", style: TextStyle(color : Colors.white)),
          onPressed: (){
            //클릭시 데이터를 읽어준다
          },
        ),
        FlatButton(
          color: Colors.blue,
          child: Text("update button", style: TextStyle(color : Colors.white)),
          onPressed: (){
            //클릭시 데이터를 갱신해준다.
          },
        ),
        FlatButton(
          color: Colors.blue,
          child: Text("delete button", style: TextStyle(color : Colors.white)),
          onPressed: (){
            //클릭시 데이터를 삭제해 준다.
          },
        ),
      ],

    );
  }
}

class Status_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _pageOfTop(),
        //_pageOfMiddle(),
        _pageOfBottom()
      ],

    );
  }
}

Widget _pageOfTop(){
  return Text('pageOfTop');
}

Widget _pageOfMiddle(){
  // return CarouselSlider(
  //   options: CarouselOptions(
  //     aspectRatio: 1.0,
  //     enlargeCenterPage: true,
  //     scrollDirection: Axis.vertical,
  //     autoPlay: false,
  //   ),
  //   items: [1,2,3,4,5].map((i){
  //     return Builder(
  //         builder: (BuildContext context){
  //           return Container(
  //             width: MediaQuery.of(context).size.width,
  //             margin: EdgeInsets.symmetric(horizontal: 50.0),
  //             decoration: BoxDecoration(
  //               color: Colors.blue
  //             ),
  //             child: Text('text $i', style: TextStyle(fontSize: 16.0),),
  //           );
  //         });
  //   }).toList(),
  // );
}

Widget _pageOfBottom(){
  return Container(
    width: 200,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.pink,
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album, size: 70),
            title: Text('Heart Shaker', style: TextStyle(color: Colors.white)),
            subtitle: Text('TWICE', style: TextStyle(color: Colors.white)),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('Edit', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
                FlatButton(
                  child: const Text('Delete', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}