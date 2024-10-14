import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Database {
  List toDoList = [];
  final _mybox = Hive.box('todo');

  // get the data from the database
  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

  // update the database
  void updateDatabase() {
    _mybox.put('TODOLIST', toDoList);
  }
}
