import 'package:flutter/material.dart';

Widget pageBody (String imgUrl, String titulo, String descricao) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imgUrl),
        Text(titulo,
          style: TextStyle(
            color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        Text(descricao,
          style: TextStyle(
            color: Colors.black45,
              fontSize: 24,
              ),
          textAlign: TextAlign.justify,
        ),
      ],
    ),
  );
}