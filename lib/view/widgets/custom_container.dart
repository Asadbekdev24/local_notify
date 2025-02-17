import 'package:flutter/material.dart';

class CustomContainer  extends StatelessWidget{
  final String matn;
  final String batafsil;
  const CustomContainer({super.key, required this.matn, required this.batafsil});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[200],
        borderRadius: BorderRadius.circular(15)),
      child:
      ListTile(
        title: Text(matn.isEmpty ? "ok": matn),
        subtitle: Text(batafsil.isEmpty ? "2025": batafsil),
        trailing: Icon(Icons.favorite),
        leading: Icon(Icons.visibility),
      ),
    );
  }
}