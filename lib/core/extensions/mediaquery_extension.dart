import 'package:flutter/widgets.dart';

extension MyContext on BuildContext{
MediaQueryData get mq => MediaQuery.of(this);
double get heig => mq.size.height;
double get wid => mq.size.width;
}