import 'package:flutter/material.dart';

class FrontEndScreen extends StatelessWidget {
  const FrontEndScreen({Key? key}) : super(key: key);

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
              'Front-end Road Map ',
              style: TextStyle(
                color: Color.fromRGBO(11, 24, 82, .9),
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: frontEndRoadMap(),
    );
  }

  Widget frontEndRoadMap () {
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
                  'Basics Language',
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
                      'HTML',
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
                      'CSS',
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
                      'Java Script',
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
                      'Type Scrip',
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
                  'CSS & JavaScript Frameworks',
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
                      'CSS Frameworks :',
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
                      'Bootstrap',
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
                      'Ulkit',
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
                      'Semantic UI',
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
                      'Foundation',
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
                      'Bulma',
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
                      'Tailwind CSS',
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
                      'Spectre',
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
                      'JavaScript Frameworks :',
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
                      'Angular',
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
                      'React',
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
                      'Vue.js',
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
                      'Ember.js',
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
                      'Meteor',
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
                      'Node.js',
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
                      'jQuery',
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
                      'AWS CodeCommit',
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
                      'Apache Subversion',
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
                      'Micro-Frontend ',
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
                      'Testing & Code Analysis Tools',
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
                      'Web Security & Communication Protocol',
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
                      'Static Site Generator (SSG)',
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
                      'Progressive Web Apps',
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
                      'Responsive Web Design',
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
                      'Package Manager ',
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
            )
          ],
        ),
      ),
    );
  }

}