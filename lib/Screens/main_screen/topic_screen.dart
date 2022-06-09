import 'package:flutter/material.dart';


class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {

    return Container(
        width: 360,
        height: 480,

        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        Container(

                          decoration: BoxDecoration(
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,

                            children: <Widget>[
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(

                                  ),
                                  child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color : Color.fromRGBO(103, 80, 164, 1),
                                                  borderRadius : BorderRadius.all(Radius.elliptical(40, 40)),
                                                )
                                            )
                                        ),Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Text('A', textAlign: TextAlign.center, style: TextStyle(
                                                color: Color.fromRGBO(255, 251, 254, 1),
                                                fontFamily: 'Roboto',
                                                fontSize: 16,
                                                letterSpacing: 0.10000000149011612,
                                                fontWeight: FontWeight.normal,
                                                height: 1.5
                                            ),)
                                        ),
                                      ]
                                  )
                              ), SizedBox(width : 16),
                              Container(
                                decoration: BoxDecoration(

                                ),
                                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,

                                  children: <Widget>[Text('Header', textAlign: TextAlign.left, style: TextStyle(
                                      color: Color.fromRGBO(28, 27, 31, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      letterSpacing: 0.10000000149011612,
                                      height: 1.5
                                  ),), SizedBox(height : 4),
                                    Text('Subhead', textAlign: TextAlign.center, style: TextStyle(
                                        color: Color.fromRGBO(28, 27, 31, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 14,
                                        letterSpacing: 0.25,
                                        fontWeight: FontWeight.normal,
                                        height: 1.4285714285714286
                                    ),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ), SizedBox(width : 0),

                      ],
                    ),
                  )
              ),Positioned(
                  top: 72,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 188,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(240, 240, 240, 1),
                      ),
                      child: Stack(
                          children: <Widget>[

                          ]
                      )
                  )
              ),Positioned(
                  top: 260,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color : Color.fromRGBO(255, 255, 255, 1),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[Text('Title', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(28, 27, 31, 1),
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          letterSpacing: 0.5,
                          height: 1.5
                      ),), SizedBox(height : 0),
                        Text('Subhead', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(73, 69, 79, 1),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            letterSpacing: 0.25,
                            fontWeight: FontWeight.normal,
                            height: 1.4285714285714286
                        ),),
                      ],
                    ),
                  )
              ),Positioned(
                  top: 336,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color : Color.fromRGBO(255, 255, 255, 1),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(73, 69, 79, 1),
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          letterSpacing: 0.25,
                          fontWeight: FontWeight.normal,
                          height: 1.4285714285714286
                      ),),
                      ],
                    ),
                  )
              ),Positioned(
                  top: 408,
                  left: 0,
                  child: Container(
                    decoration: BoxDecoration(

                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                            color : Color.fromRGBO(255, 251, 254, 1),
                            border : Border.all(
                              color: Color.fromRGBO(121, 116, 126, 1),
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            children: <Widget>[Text('Enabled', textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(103, 80, 164, 1),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                letterSpacing: 0.10000000149011612,
                                fontWeight: FontWeight.normal,
                                height: 1.4285714285714286
                            ),),
                            ],
                          ),
                        ), SizedBox(width : 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius : BorderRadius.only(
                              topLeft: Radius.circular(100),
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                            color : Color.fromRGBO(103, 80, 164, 1),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            children: <Widget>[Text('Enabled', textAlign: TextAlign.center, style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                letterSpacing: 0.10000000149011612,
                                fontWeight: FontWeight.normal,
                                height: 1.4285714285714286
                            ),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
              ),
            ]
        )
    );
  }
}
        