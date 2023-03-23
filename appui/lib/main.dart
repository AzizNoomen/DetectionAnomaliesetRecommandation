import 'package:appui/plantlist.dart';
import 'package:flutter/material.dart';

import 'cameragallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plants',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      const SizedBox(height: 15.0),
      Padding(
          padding: EdgeInsets.only(left: 170.0, right: 170.0),
          child: Container(
              height: 52.0,
              width: 20.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CameraGallery()));
                },
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  child: Icon(Icons.add,
                      color: Color.fromARGB(255, 255, 255, 255), size: 30.0),
                ),
              ))),
    ]));
  }
}*/

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  void initState() {
    tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        const SizedBox(height: 15.0),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Commun Plants',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300),
            )),
        Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.8),
                isScrollable: true,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'All',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Outdoors',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Indoors',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'All',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ])),
        Container(
          height: MediaQuery.of(context).size.height - 200.0,
          child: TabBarView(
            controller: tabController,
            children: const <Widget>[
              PlantList(),
              PlantList(),
              PlantList(),
              PlantList(),
            ],
          ),
        ),
        Row(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                  height: 52.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraGallery()));
                    },
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      child: Icon(Icons.add,
                          color: Color.fromARGB(255, 255, 255, 255),
                          size: 30.0),
                    ),
                  ))),
        ]),
      ]),
    );
  }
}
