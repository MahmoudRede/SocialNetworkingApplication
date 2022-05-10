import 'package:flutter/material.dart';

class AndroidScreen extends StatelessWidget {
  const AndroidScreen({Key? key}) : super(key: key);

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
              Icons.android,
              color: Color.fromRGBO(11, 24, 82, .9),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Android Road Map ',
              style: TextStyle(
                color: Color.fromRGBO(11, 24, 82, .9),
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: androidRoadMap(),
    );
  }

  Widget androidRoadMap () {
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
                      'java basics',
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
                      'Java OOP',
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
            Row(
              children: const[
                Icon(
                  Icons.arrow_forward_outlined,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  'OR',
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
                      'Kotlin basics',
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
                      'Kotlin oop',
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
                  'Android Studio',
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
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'It’s better to know your tools before you are going to use it.'
                          'Android Studio is the official Integrated Development Environment for Google’s'
                          ' Android operating system,built on JetBrains’ IntelliJ IDEA software and '
                          'designed specifically for Android development.',
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                      maxLines: 6,
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
                      'Android Studio Overview :',
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
                      'Create a new project',
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
                      'Reopen, close, save the project',
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
                      'Create a new activity, classes, drawable resource files',
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
                      'Run the app on AVD of Emulator or in a real device etc',
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
                  'Android Components',
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
                      'Activity :',
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
                      'Activity life cycle',
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
                      'Handle Activity State Changes',
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
                      'Understand Tasks and Back Stack',
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
                      'Processes and Application Lifecycle',
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
                      'Services :',
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
                      'Types of Android Services',
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
                      'The Life Cycle of Android Services',
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
                  'Simple UI Design',
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
                      'Layouts :',
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
                      'Frame Layout',
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
                      'Linear Layout',
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
                      'Relative Layout',
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
                      'Constraint Layout',
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
                      'View Elements :',
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
                      'TextView',
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
                      'EditText',
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
                      'Buttons',
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
                      'ImageView',
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
                      'Intent :',
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
                      'Implicit Intent',
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
                      'Explicit Intent',
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
                      'Intent Filter',
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
                  'Complex UI Design',
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
                      'RecycleVIew',
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
                      'Fragments',
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
                      'Dialogs',
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
                      'Toast',
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
                      'Bottom Sheets',
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
                      'Navigation Drawer',
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
                      'Tabs',
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
                      'Material Design',
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
                      'Some inserting Animations',
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
                  'Storage',
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
                      'Shared Preferences',
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
                      'File System',
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
                      'Database',
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
                      'RoomDB',
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
                  'Build',
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
                      'Gradle',
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
                      'Debug/ Release Configuration',
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
              height: 30.0,
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
