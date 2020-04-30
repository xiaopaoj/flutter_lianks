import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/application.dart';
import 'package:flutterapp/model/teacher.dart';
import 'package:flutterapp/routes/routes.dart';

class TeacherPage extends StatefulWidget {

  final Teacher teacher;

  TeacherPage(this.teacher);

  @override
  State<TeacherPage> createState() => _TeacherPage();
}

class _TeacherPage extends State<TeacherPage> {


  @override
  Widget build(BuildContext context) {
    if(widget.teacher == null) {
      return new Container();
    }
    if(widget.teacher.teacherType == 1) {
      return new GestureDetector(
        onTap: (){
          Application.router.navigateTo(context,
            '${Routes.webDetail}?url=${Uri.encodeComponent(widget.teacher.detailUrl)}&title=${Uri.encodeComponent(widget.teacher.teacherName)}',
            transition: TransitionType.nativeModal,
          );
        },
        child: new Container(
          width: 351,
          height: 270,
          child: new Image.network(widget.teacher.listImage,
            width: 351,
            height: 270,
            fit: BoxFit.fill,
          ),
          padding: EdgeInsets.all(12),
        ),
      );
    } else {
      return new GestureDetector(
        onTap: (){
          Application.router.navigateTo(context,
            '${Routes.webDetail}?url=${Uri.encodeComponent(widget.teacher.detailUrl)}&title=${Uri.encodeComponent(widget.teacher.teacherName)}',
            transition: TransitionType.nativeModal,
          );
        },
        child: new Container(
          height: 75,
          margin: EdgeInsets.only(top: 33, bottom: 33, left: 12, right: 12),
          color: Theme.of(context).backgroundColor,
          width: MediaQuery.of(context).size.width,
          child: new Row(
            children: <Widget>[
              new Expanded(
                  flex: 24,
                  child: new Stack(
                    alignment:Alignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundImage: NetworkImage(widget.teacher.teacherPicture,
                        ),
                        maxRadius: 70,
                      ),
                    ],
                  )
              ),
              new Expanded(
                  flex: 76,
                  child: new Container(
                    height: 75,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          height: 20,
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 4, left: 20),
                          child: new Text(widget.teacher.teacherName,
                            style: new TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        new Container(
                          width: double.infinity,
                          height: 47,
                          margin: EdgeInsets.only(left: 20, top: 4, right: 13),
                          child: new Text(widget.teacher.slogan,
                            style: new TextStyle(
                              fontSize: 11,
                              color: Color.fromRGBO(155, 155, 155, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      );
    }
  }
}