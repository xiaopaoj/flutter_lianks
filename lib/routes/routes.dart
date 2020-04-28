import 'package:fluro/fluro.dart';
import 'package:flutterapp/routes/routes_handler.dart';


class Routes {
  static String webDetail = "/webDetail";

  static void configureRoutes(Router router) {
    router.define(webDetail, handler: webDetailHandler);
  }
}
