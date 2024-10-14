import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoList extends StatelessWidget {
  final String task;
  final bool completed;
  Function(bool?)? onChanged;
  Function()? deleteFunction;
  ToDoList(
      {super.key,
      required this.task,
      required this.completed,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: Color.fromRGBO(21, 16, 28, 100),
          borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task,
            style: TextStyle(
                color: Color.fromRGBO(189, 139, 255, 0.612),
                decoration: completed ? TextDecoration.lineThrough : null,
                fontSize: 20),
          ),
          Row(
            children: [
              Checkbox(
                value: completed,
                onChanged: onChanged,
              ),
              GestureDetector(
                  onTap: deleteFunction,
                  child: Icon(
                    Icons.delete,
                    color: Color.fromRGBO(158, 120, 207, 100),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
