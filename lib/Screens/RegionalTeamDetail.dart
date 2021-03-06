import 'package:avatar_glow/avatar_glow.dart';
import 'package:awake_app/Common/Constants.dart';
import 'package:flutter/material.dart';
import 'package:awake_app/Common/Constants.dart' as cnst;

class RegionalTeamDetail extends StatefulWidget {
  var regionalTeamData;
  RegionalTeamDetail(this.regionalTeamData);
  @override
  _RegionalTeamDetailState createState() => _RegionalTeamDetailState();
}

class _RegionalTeamDetailState extends State<RegionalTeamDetail> {
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              ClipPath(
                child: Container(
                  padding: EdgeInsets.only(bottom: 5),
                  color: cnst.appPrimaryMaterialColor,
                  height: screen > 550.0 ? screen / 4 : screen / 4.3,
                  width: MediaQuery.of(context).size.width,
                ),
                clipper: displayDateClipper(),
              ),
              Positioned(
                top: 5,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                    top: screen > 550.0
                        ? MediaQuery.of(context).size.height / 5.7
                        : MediaQuery.of(context).size.height / 6,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                              ),
                            ]),
                        child: GestureDetector(
                          onTap: () {},
                          child: AvatarGlow(
                            glowColor: cnst.appPrimaryMaterialColor,
                            endRadius: 80.0,
                            duration: Duration(milliseconds: 2000),
                            repeat: true,
                            showTwoGlows: true,
                            repeatPauseDuration: Duration(milliseconds: 100),
                            child: Material(
                              elevation: 8.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                child: ClipOval(
                                    child: widget.regionalTeamData["Image"] ==
                                                null ||
                                            widget.regionalTeamData["Image"] ==
                                                ""
                                        ? Image.asset(
                                            "images/icon_profile_new.png",
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.fill,
                                          )
                                        : FadeInImage.assetNetwork(
                                            placeholder:
                                                'images/icon_profile_new.png',
                                            image:
                                                '${IMG_URL}${widget.regionalTeamData["Image"]}',
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.fill,
                                          )),
                                radius: 50.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "${widget.regionalTeamData["MemberName"]}",
                          style: TextStyle(
                              color: cnst.appPrimaryMaterialColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 15, left: 20, right: 20),
                        child: Text(
                          "${widget.regionalTeamData["Position"]}",
                          style: TextStyle(
                              color: cnst.appPrimaryMaterialColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      widget.regionalTeamData["Email"] != null &&
                              widget.regionalTeamData["Email"] != ""
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.mail_outline,
                                      color: cnst.appPrimaryMaterialColor),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${widget.regionalTeamData["Email"]}",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      widget.regionalTeamData["MobileNo"] != null &&
                              widget.regionalTeamData["MobileNo"] != ""
                          ? Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(25, 10, 25, 15),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.phone,
                                      color: cnst.appPrimaryMaterialColor),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "${widget.regionalTeamData["MobileNo"]}",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      /*Padding(
                        padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                        child: Text(
                          "${widget.regionalTeamData["RegionalTeamType"]}",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),*/
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class displayDateClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0.0, size.height - 50);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
