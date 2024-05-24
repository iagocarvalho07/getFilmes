import 'package:app_filmes/models/genres_model.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final GenresModel model;
  // ignore: unused_field
  final bool _selected;
  final VoidCallback onPressed;
  const FilterTag({
    Key? key,
    required this.model,
    bool selected = false,
    required this.onPressed,
  })  : _selected = selected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
          color: _selected ? Colors.red : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            model.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
