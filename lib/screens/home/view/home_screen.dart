import 'dart:math';

import 'package:animator_galaxy_planets/screens/home/provider/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? rotation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    rotation = Tween<double>(begin: 0, end: pi).animate(animationController!);

    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  homeProvider? ht, hf;

  @override
  Widget build(BuildContext context) {
    ht = Provider.of<homeProvider>(context, listen: true);
    hf = Provider.of<homeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3a6b35),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Planets",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'second',arguments: index);
                            },
                            child: Container(
                              height: 250,
                              // width: MediaQuery.of(context).size.width*0.9,
                              width: 300,
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(top: 55, bottom: 55),
                              decoration: BoxDecoration(
                                color: Color(0xffe3b448),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade500),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: 2,
                                      blurRadius: 3,
                                      offset: Offset(0, 3)),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Text(
                                    "${hf!.planets[index]}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Milkyway Galaxy",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/ic_distance.png",
                                          height: 20,
                                          width: 20,
                                          color: Colors.black),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        "${hf!.distance[index]} km",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Spacer(),
                                      Image.asset("assets/images/ic_gravity.png",
                                          height: 20,
                                          width: 20,
                                          color: Colors.black),
                                      SizedBox(width: 7,),
                                      Text(
                                        "${hf!.distance[index]} km",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  // SizedBox(width: 15,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 106,
                          bottom: 230,
                          child: RotationTransition(
                            turns: Tween<double>(begin: 0, end: 1)
                                .animate(animationController!),
                            child: Container(
                              height: 130,
                              width: 130,
                              child: Image.asset("${hf!.images[index]}",
                                  height: 70, width: 70),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: hf!.images.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
