import 'package:fluro/fluro.dart';
import 'package:flutterapp/routes/routes_handler.dart';


class Routes {
  static String webDetail = "/webDetail";
  static String login = "/login";
  static String myProduct = "/myProduct";
  static String myCollectionProduct = "/myCollectionProduct";

  static void configureRoutes(Router router) {
    router.define(webDetail, handler: webDetailHandler);
    router.define(login, handler: loginHandler);
    router.define(myProduct, handler: myProductHandler);
    router.define(myCollectionProduct, handler: myCollectionProductHandler);
  }
}