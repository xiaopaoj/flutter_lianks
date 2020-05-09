import 'package:event_bus/event_bus.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'model/user_info.dart';

class Application {

  static Router router;

  static EventBus eventBus;

  static UserInfo userInfo;
}