import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(11, 24, 82, .9),
          ),
        ),
        title: const Text(
          'About BFCAI Community',
          style: TextStyle(
            color: Color.fromRGBO(11, 24, 82, .9),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                    'Project Overview',
                    style: TextStyle(
                      color: Color.fromRGBO(11, 24, 82, .9),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'BFCAI Community is an application to help students in their university life'
                    ' as it benefits them in more than one way, such as obtaining the materials they study and'
                    ' communicating with professors in an easy way and other advantages .',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                children: const[
                  Icon(
                      Icons.school_outlined
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Features',
                    style: TextStyle(
                      color: Color.fromRGBO(11, 24, 82, .9),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
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
                        'Creating a platform to collect all the student needs of communication, student Groups ,study materials, and university news.',
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
                        'Ease of communication with the professor and assistants when you need them.',
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
                        'Easily find the subjects to study.',
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
                        'You can Know your grades during the study period.',
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
                        'Chat system between students and professors.',
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
                        'Chatbot you can ask it any questions about university or any problem'
                            ' that faces you and it can present all solution to fix your problem.',
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
                        'Create chat group for each material',
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
                        'Provide a section for complaints, making Reports about any professor,'
                            ' and notes without your name or your student ID to save your Privacy.',
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
                height: 40.0,
              ),
              Row(
                children: const[
                  Icon(
                      Icons.gavel,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Usage Policy',
                    style: TextStyle(
                      color: Color.fromRGBO(11, 24, 82, .9),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22.0,
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
                        'Registration with your academic account only.',
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
                        Icons.done,
                        size: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        'Your account must have a real photo for you.',
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
                        Icons.done,
                        size: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        'You can add posts in your Group only.',
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
                        Icons.done,
                        size: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: Text(
                        'Your account will be blocked if you write an illegal or profanity comment or post.',
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
      ),
    );
  }
}
