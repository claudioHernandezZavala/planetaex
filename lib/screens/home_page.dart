import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:planetaex/classes/backend/nasaApi.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _seres = [
    "Earth",
    "IcePlanet",
    "Saturn",
    "Jupiter",
    "Uranus",
  ];
  List<String> imagenes = [
    "assets/earth.png",
    "assets/planet1.png",
    "assets/planet2.png",
    "assets/planet3.png",
    "assets/planet4.png"
  ];
  int indexSer = 0;
  List<LinearGradient> gradients = [
    const LinearGradient(colors: [Colors.yellow, Colors.green]),
    const LinearGradient(colors: [Colors.pink, Colors.purple]),
    const LinearGradient(colors: [Colors.blue, Colors.white]),
    const LinearGradient(colors: [Colors.orange, Colors.red]),
    const LinearGradient(colors: [Colors.green, Colors.blue]),
  ];
  final contoller = ItemScrollController();
  ItemPositionsListener listener = ItemPositionsListener.create();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    listener.itemPositions.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    listener.itemPositions.addListener(() {
      if (mounted) {
        if (indexSer == _seres.length - 1) {
          setState(() {
            indexSer = listener.itemPositions.value.last.index;
          });
        } else {
          setState(() {
            indexSer = listener.itemPositions.value.first.index;
          });
        }
      }
    });
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Search",
              suffixIcon: Icon(
                Icons.category,
                shadows: [Shadow(color: Colors.blue)],
                color: Colors.red,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const ShapeDecoration(
                      shape: CircleBorder(), color: Colors.black),
                  child: const Icon(
                    Icons.social_distance,
                    color: Colors.green,
                  )),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mars/Earth",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.blueGrey.shade300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("289.33 million km")
                  ],
                ),
              ),
              Container(
                width: 100,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: const Color(0xFFFF4057),
                    borderRadius: BorderRadius.circular(25)),
                child: const Text(
                  "Distance",
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: _seres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    focusColor: Colors.green,
                    splashColor: Colors.orange,
                    radius: 15,
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.red)),
                    onTap: () {
                      setState(() {
                        indexSer = index;
                      });
                      contoller.scrollTo(
                          index: index,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 25, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            curve: Curves.bounceIn,
                            child: Text(
                              _seres[index],
                              style: TextStyle(
                                  fontSize: index == indexSer ? 20 : 15),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              color: index == indexSer
                                  ? Colors.orange
                                  : Colors.transparent,
                              height: 5,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 25,
          ),
          FutureBuilder<Object>(
            future: getPlanets(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Column(
                  children: [Text("Sorry there is no information!")],
                );
              }
              if (snapshot.hasError) {
                return Column(
                  children: [Text("Sorry an error ocurred")],
                );
              }
              if (snapshot.hasData) {
                print(snapshot.data);
              }
              return Container(
                width: 50,
                height: 50,
                color: Colors.red,
              );
            },
          ),
          SizedBox(
            height: 300,
            child: ScrollablePositionedList.builder(
              scrollDirection: Axis.horizontal,
              itemPositionsListener: listener,
              itemScrollController: contoller,
              itemCount: imagenes.length,
              itemBuilder: (ctx, index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap: () async {},
                      child: Container(
                        width: 220,
                        height: 220,
                        margin:
                            const EdgeInsets.only(left: 15, right: 15, top: 35),
                        decoration: BoxDecoration(
                            gradient: gradients[index],
                            borderRadius: BorderRadius.circular(50)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              height: 90,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(45),
                                      bottomLeft: Radius.circular(45))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      _seres[index],
                                      style: const TextStyle(
                                          fontSize: 25, color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "  Pysical\n  characteristics",
                                          softWrap: true,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                        Container(
                                          decoration: const ShapeDecoration(
                                              shape: CircleBorder(),
                                              color: Colors.grey),
                                          child: const Icon(
                                            Icons.add,
                                            size: 35,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -5,
                      left: -5,
                      child: Container(
                        padding: EdgeInsets.zero,
                        decoration: ShapeDecoration(
                            //color: Colors.orange,
                            shape: const CircleBorder(),
                            shadows: [
                              BoxShadow(
                                blurRadius: 100,
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(20, 40),
                                spreadRadius: 4,
                                blurStyle: BlurStyle.normal,
                              )
                            ]),
                        child: Hero(
                          tag: _seres[index],
                          child: Image.asset(
                            imagenes[index],
                            width: 150,
                            height: 150,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: GestureDetector(
                onTap: () async {
                  var infoready = await getinfoNasaPic();
                  await http
                      .get(Uri.parse(
                          "https://api.le-systeme-solaire.net/rest/bodies/"))
                      .then((value) {
                    print(value.body);
                  });

                  //  Navigator.of(context).push(CustomPageRoute(PicDayNasa(
                  //   info: infoready,
                  // )));
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.8),
                        Colors.white.withOpacity(0.6),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      width: 1.5,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/nasa_icon.png",
                        width: 100,
                        height: 100,
                      ),
                      const Expanded(
                        child: Text(
                            "Tap and discover a random picture from NASA's APOD",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<String> getPlanets() async {
  var v = await http
      .get(Uri.parse("https://api.le-systeme-solaire.net/rest/bodies/"));
  return v.body;
}
