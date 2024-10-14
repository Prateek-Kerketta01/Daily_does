import 'package:daily_does/model/database.dart';
import 'package:daily_does/util/input_box.dart';
import 'package:daily_does/util/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('todo');
  Database db = Database();
  int length = 0;
  @override

  // load the data from the database to display
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      return null;
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  // save the new task on clicking the add button
  void onShave() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.toDoList.add([_controller.text, false]);
        length = db.toDoList.length;
      }
    });
    db.updateDatabase();
    _controller.clear();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void deleteFunction(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      length = db.toDoList.length;
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(13, 7, 20, 100),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add the InputBox widget here
            InputBox(
              controller: _controller,
              onPressed: onShave,
            ),

            const SizedBox(height: 20),
            // No. of to task to display
            Text(
              'Tasks to do- ' + length.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: db.toDoList.length,
                  itemBuilder: (context, index) {
                    return ToDoList(
                      task: db.toDoList[index][0],
                      completed: db.toDoList[index][1],
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleteFunction: () => deleteFunction(index),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
