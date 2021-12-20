import 'package:flutter/material.dart';
import 'package:fluttertutorialcoachmark/soccer_player_info.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class MyTutorialCoachMarkScreen extends StatefulWidget {
  @override
  _MyTutorialCoachMarkScreenState createState() => _MyTutorialCoachMarkScreenState();
}

class _MyTutorialCoachMarkScreenState extends State<MyTutorialCoachMarkScreen> {
  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> listTargets = [];

  List<SoccerPlayerInfo> listSoccerPlayersInfo = [
    SoccerPlayerInfo("Cristiano Ronaldo", "Forward", "Manchester United", "Portugal"),
  ];

  GlobalKey globalKey1 = GlobalKey();
  GlobalKey globalKey2 = GlobalKey();
  GlobalKey globalKey3 = GlobalKey();
  GlobalKey globalKey4 = GlobalKey();

  @override
  void initState() {
    initTargets();
    showAppTutorial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Flutter Tutorial Coach Mark Sample"),
        actions: <Widget>[
          IconButton(
            key: globalKey1,
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: ListView.builder(
              itemCount: listSoccerPlayersInfo.length,
              itemBuilder: (context, position) {
                SoccerPlayerInfo getSoccerPlayerInfo =
                    listSoccerPlayersInfo[position];
                var soccerPlayerName = getSoccerPlayerInfo.playerName;
                var soccerPlayingPosition = getSoccerPlayerInfo.playingPosition;
                var soccerPlayerClubName = getSoccerPlayerInfo.clubName;
                var soccerPlayerCountryName = getSoccerPlayerInfo.countryName;
                return Card(
                  key: globalKey2,
                  elevation: 8,
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.all(15),
                    child: Stack(
                      children: <Widget>[
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(soccerPlayerName,
                                style: TextStyle(fontSize: 18))),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(right: 50),
                            child: IconButton(
                                key: globalKey3,
                                icon: Icon(Icons.edit),
                                onPressed: () {}),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              key: globalKey4,
                              icon: Icon(Icons.delete),
                              onPressed: () {}),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                                "$soccerPlayingPosition | $soccerPlayerClubName | $soccerPlayerCountryName",
                                style: TextStyle(fontSize: 17))),
                      ],
                    ),
                  ),
                );
              })),
    );
  }

  void initTargets() {
    listTargets.add(
      TargetFocus(
        color: Colors.orangeAccent,
        identify: "Target 1",
        keyTarget: globalKey1,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Add New Soccer Player",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
        ],
        shape: ShapeLightFocus.Circle,
      ),
    );
    listTargets.add(
      TargetFocus(
        color: Colors.deepOrangeAccent,
        identify: "Target 2",
        keyTarget: globalKey2,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Soccer Player Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 7,
      ),
    );

    listTargets.add(TargetFocus(
      color: Colors.pinkAccent,
      identify: "Target 3",
      keyTarget: globalKey3,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Edit Soccer Player",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      ],
      shape: ShapeLightFocus.Circle,
    ));

    listTargets.add(TargetFocus(
      color: Colors.tealAccent,
      identify: "Target 4",
      keyTarget: globalKey4,
      contents: [
        TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Delete Soccer Player",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )),
      ],
      shape: ShapeLightFocus.Circle,
    ));
  }

  void showAppTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      context,
      targets: listTargets,
      colorShadow: Colors.grey,
      textSkip: "SKIP TUTORIAL",
      textStyleSkip: TextStyle(fontSize: 20),
      paddingFocus: 8,
      opacityShadow: 0.9,
      onFinish: () {

      },
      onClickTarget: (target) {

      },
      onSkip: () {

      },
      onClickOverlay: (target) {

      },
    )..show();
  }
}
