import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final controller;
  VoidCallback onPressed;
  InputBox({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              style: const TextStyle(color: Colors.white),
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "Add a new task",
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.purple,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
