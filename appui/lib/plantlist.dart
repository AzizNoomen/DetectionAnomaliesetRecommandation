import 'package:appui/cameragallery.dart';
import 'package:appui/plantdetail.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class PlantList extends StatefulWidget {
  const PlantList({super.key});

  @override
  State<PlantList> createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  late ScrollController _scrollController;
  List descriptions = [
    "Aloe vera is native to arid regions of the world and is widely cultivated for its medicinal and cosmetic properties. The gel found inside the leaves of the aloe vera plant is known to have anti-inflammatory, antimicrobial, and antioxidant properties, making it a popular ingredient in skincare products.",
    "Water",
    "Snow",
  ];

  late String description;

  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeDescription);
    setState(() {
      description = descriptions[0];
    });
  }

  changeDescription() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 200).round();
    print(value);
    setState(() {
      description = descriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard(
                  'assets/aloevera.png', 'Rust', 'Outdoor', 'Aloe Vera'),
              SizedBox(width: 30.0),
              getPlantCard(
                  'assets/aloevera.png', 'Rust', 'Indoor', 'Aloe Vera'),
              SizedBox(width: 30.0),
              getPlantCard(
                  'assets/aloevera.png', 'Rust', 'Outdoor', 'Aloe Vera'),
              SizedBox(width: 30.0),
            ],
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 10.0),
            child: Text(
              'Description',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500),
            )),
        Padding(
            padding: EdgeInsets.only(left: 25.0, top: 10.0),
            child: Text(
              description,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300),
            )),
        SizedBox(height: 10.0),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CameraGallery()));
                  },
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    child: Icon(Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255), size: 30.0),
                  ),
                ))),
      ],
    );
  }

  getPlantCard(
      String imagePath, String anomalie, String plantType, String plantName) {
    return Stack(children: <Widget>[
      SizedBox(width: 30.0),
      Container(
          height: 325.0,
          width: 225.0,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFF399D63)),
              height: 250.0,
              width: 225.0,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(children: <Widget>[
                        SizedBox(height: 10.0),
                        const Text(
                          'FROM',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8AC7A4)), // TextStyle
                        ), // Text
                        Text(
                          anomalie,
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8AC7A4)), // TextStyle
                        ),
                      ]),
                      const SizedBox(width: 10.0)
                    ],
                  ),
                  const SizedBox(height: 15),
                  Image(
                    image: AssetImage(imagePath),
                    height: 150.0,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 25.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              plantType,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8AC7A4)), 
                            ),
                            Text(
                              plantName,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),                            
                                ),
                          ])
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 25.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Colors.white.withOpacity(0.8), // TextStyle,
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.wb_sunny,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.sentiment_dissatisfied,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.wb_sunny,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(color: Color(0xFF399D63)),
                          child: Icon(Icons.help_outline,
                              color: Colors.white.withOpacity(0.4), size: 30.0),
                        ),
                      )
                    ],
                  )
                ],
              ))),
      Padding(
          padding: EdgeInsets.only(left: 90.0, top: 300.0),
          child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.black,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PlantDetail()));
                },
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  child: const Icon(Icons.info_outline_rounded,
                      color: Colors.white, size: 30.0),
                ),
              ))),
      const SizedBox(width: 20.0),
    ]);
  }
}

/*Center(
                  child: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ))*/