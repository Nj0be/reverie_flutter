import 'package:flutter/material.dart';

class AllDiariesScreen extends StatefulWidget {
  const AllDiariesScreen({super.key});

  @override
  State<AllDiariesScreen> createState() => _AllDiariesScreenState();
}

class _AllDiariesScreenState extends State<AllDiariesScreen> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Sei in AllDiariesScreen')
    );
  }
}