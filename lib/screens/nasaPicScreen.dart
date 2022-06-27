import 'package:flutter/material.dart';
import 'package:planetaex/classes/nasapicday.dart';
import 'package:planetaex/constants.dart';

class PicDayNasa extends StatefulWidget {
  final nasapicinfo info;
  const PicDayNasa({Key? key, required this.info}) : super(key: key);

  @override
  State<PicDayNasa> createState() => _PicDayNasaState();
}

class _PicDayNasaState extends State<PicDayNasa> {
  bool error = false;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color1,
        appBar: AppBar(
          backgroundColor: color2,
          foregroundColor: Colors.white,
          actions: [Image.asset("assets/nasa_icon.png")],
        ),
        body: AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          duration: Duration(milliseconds: 800),
          margin: EdgeInsets.zero,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/stars_background.jpeg"),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: isExpanded
                ? Center(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.ease,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (mounted) {
                                  if (isExpanded) {
                                    setState(() {
                                      isExpanded = false;
                                    });
                                  } else {
                                    setState(() {
                                      isExpanded = true;
                                    });
                                  }
                                }
                              },
                              icon: const Icon(Icons.expand),
                              color: Colors.green,
                              iconSize: 45,
                            ),
                            Image.network(
                              widget.info.imageurl,
                              fit: BoxFit.fill,
                            ),
                            IconButton(
                              onPressed: () {
                                if (mounted) {
                                  if (isExpanded) {
                                    setState(() {
                                      isExpanded = false;
                                    });
                                  } else {
                                    setState(() {
                                      isExpanded = true;
                                    });
                                  }
                                }
                              },
                              icon: const Icon(Icons.expand),
                              color: Colors.white,
                              iconSize: 45,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: AnimatedContainer(
                              height: 350,
                              duration: Duration(milliseconds: 900),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                    onError: (v, s) {
                                      if (mounted) {
                                        setState(() {
                                          error = true;
                                        });
                                      }
                                    },
                                    image: NetworkImage(
                                      widget.info.imageurl,
                                    ),
                                    fit: BoxFit.fill),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(35),
                                    bottomRight: Radius.circular(35)),
                              ),
                              child: error
                                  ? const Center(
                                      child: Text("An error ocurred"))
                                  : null,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (mounted) {
                                if (isExpanded) {
                                  setState(() {
                                    isExpanded = false;
                                  });
                                } else {
                                  setState(() {
                                    isExpanded = true;
                                  });
                                }
                              }
                            },
                            icon: const Icon(
                              Icons.expand,
                            ),
                            color: Colors.green,
                            iconSize: 45,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Text(widget.info.title),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(onPressed: () {}, child: const Text("")),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: 250,
                            height: 250,
                            decoration: const BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                            child: Scrollbar(
                              thickness: 8,
                              interactive: true,
                              trackVisibility: true,
                              isAlwaysShown: true,
                              radius: const Radius.circular(25),
                              child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    widget.info.description,
                                    textAlign: TextAlign.justify,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              widget.info.copyrigth,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          ),
        ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height - 120);
    var firststart = Offset(size.width / 5, size.height - 70);
    //first point of wquadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 70);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firststart.dx, firststart.dy, firstEnd.dx, firstEnd.dy);
    var secondstart =
        Offset(size.width - (size.width / 4.24), size.height - 70);
    var secondend = Offset(size.width, size.height - 120);
    path.quadraticBezierTo(
        secondstart.dx, secondstart.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
