import 'package:flutter/material.dart';

class BackEndScreen extends StatelessWidget {
  const BackEndScreen({Key? key}) : super(key: key);

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
              Icons.public,
              color: Color.fromRGBO(11, 24, 82, .9),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Back-End Road Map ',
              style: TextStyle(
                color: Color.fromRGBO(11, 24, 82, .9),
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: backEndRoadMap(),
    );
  }

  Widget backEndRoadMap () {
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
                      'JavaScript',
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
                      'Java',
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
                      'C#',
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
                      'Python',
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
                      'Ruby',
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
                      'PHP',
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
                  'Database',
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
                      'Relational Databases :',
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
                      'PostgreSQL',
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
                      'MySQL',
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
                      'MS SQL',
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
                      'Oracle',
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
                      'MariaDB',
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
                      'NoSQL Databases :',
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
                      'MongoDB',
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
                      'RethinkDB',
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
                      'DynamoDB',
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
                      'CouchDB',
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
                      'GraphQL',
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
                  'Version Control System :',
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
                      'Some of the top-rated version control systems that you can learn are :',
                      style: TextStyle(
                        fontSize: 17.0,
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
                      'GitHub',
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
                      'GitLab',
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
                      'BitBucket',
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
                      'Beanstalk',
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
                      'REST',
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
                      'JSON',
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
                      'SOAP',
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
                      'GSON',
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
                      'XML-RPC',
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
                      'AES',
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
                  'Caching',
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
                      'CDN',
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
                      'Server Side',
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
                      'Client-Side',
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
                      'Redis',
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
                  'Advanced',
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
                      'Testing',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Code Analysis Tools',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Architectural Patterns',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Message Broker',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Containerization',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Design Patterns',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'Authentication Method',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'WebHook',
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
                      Icons.star,
                      size: 18.0,
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Text(
                      'WebSocket',
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
              height: 25.0,
            ),
            const Image(
              image: AssetImage('assets/images/Logo .jpg'),
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }

}