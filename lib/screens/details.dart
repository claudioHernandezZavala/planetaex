import 'dart:ui';

import 'package:flutter/material.dart';

class PlanetDetailScreen extends StatefulWidget {
  final String imagen;
  final String nombre;
  final String descripcion;
  final LinearGradient gradiente;
  const PlanetDetailScreen(
      {Key? key,
      required this.imagen,
      required this.nombre,
      required this.gradiente,
      required this.descripcion})
      : super(key: key);

  @override
  State<PlanetDetailScreen> createState() => _PlanetDetailScreenState();
}

class _PlanetDetailScreenState extends State<PlanetDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("assets/stars_background.jpeg"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Hero(
                          tag: widget.nombre,
                          child: Image.network(
                            widget.imagen,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.45,
                    left: MediaQuery.of(context).size.width * 0.15,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 200,
                        width: 300,
                        child: Text(
                          widget.descripcion,
                          style: TextStyle(color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                            gradient: widget.gradiente,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  margin: EdgeInsets.all(15),
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
                        "assets/planetita.png",
                        width: 80,
                        height: 80,
                      ),
                      const Expanded(
                          child: const Text(
                              "Space system are vehicles and infraestructures working together to perform a task in the space",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16)))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
