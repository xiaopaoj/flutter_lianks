import 'package:fluro/fluro.dart';
import 'package:flutter_lianks/routes/routes_handler.dart';


class AppRoutes {
  static String webDetail = "/webDetail";
  static String login = "/login";
  static String myProduct = "/myProduct";
  static String myCollectionProduct = "/myCollectionProduct";
  static String myCollectionTeacher = "/myCollectionTeacher";
  static String myOrder = "/myOrderHandler";
  static String liveVideo = "/LiveVideoHandler";

  static void configureRoutes(Router router) {
    router.define(webDetail, handler: webDetailHandler);
    router.define(login, handler: loginHandler);
    router.define(myProduct, handler: myProductHandler);
    router.define(myCollectionProduct, handler: myCollectionProductHandler);
    router.define(myCollectionTeacher, handler: myCollectionTeacherHandler);
    router.define(myOrder, handler: myOrderHandler);
    router.define(liveVideo, handler: LiveVideoHandler);
  }
}