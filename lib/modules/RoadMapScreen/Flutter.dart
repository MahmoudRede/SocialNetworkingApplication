import 'package:flutter/material.dart';

class FlutterScreen extends StatelessWidget {
  const FlutterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(11, 24, 82, .9),
          ),
        ),
        title: Row(
          children: const [
            Icon(
              Icons.flutter_dash,
              color: Color.fromRGBO(11, 24, 82, .9),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Flutter Road Map ',
              style: TextStyle(
                color: Color.fromRGBO(11, 24, 82, .9),
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: flutterRoadMap(),
    );
  }

  Widget flutterRoadMap () {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:  [
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Programming Language',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Dart basics',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Dart OOP',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'User Interface',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Widgets :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'StateFull widget',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'StateLess widget',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Accessibility',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Inherited Widget',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Theming',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Localization',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Style :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Material',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Cupertion',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Assets :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Fonts',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Images',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Static User Interface',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'View :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                      'Text, Image, button raised, button, etc',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'ViewGroup :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                      'Container, Row, Column, Stack, Expanded, ConstrainedBox',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Dynamic User Interface',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'ListView',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'GridView',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'ExpansionTitle',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Animation :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'AnimatedWidget',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'AnimatedBuilder',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'AnimationController',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'CurvedAnimation',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Hero',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Transform',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Opacity',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Storage :',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Shared Preference',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'file storage',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'sqlite',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'State management',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'setState',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Provider',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'BLoC',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'GetX',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Firebase',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Firebase Auth',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Firebase database',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Firebase Storage',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Firebase Messaging',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'APIs',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Http',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Dio',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              children: const[
                Icon(
                    Icons.lightbulb_outline
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Version Control',
                  style: TextStyle(
                    color: Color.fromRGBO(11, 24, 82, .9),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Git',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Icon(
                      Icons.done,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Github',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Image(
              image: AssetImage('assets/images/Logo .jpg'),
              height: 150,
              width: 150,
            )
          ],
        ),
      ),
    );
  }

}