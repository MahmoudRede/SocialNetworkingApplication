import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Expanded(
                child:ListView.separated(
                  physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>Block_Post(),
                    separatorBuilder: (context,index){
                    return  const SizedBox(height: 5,);
                    },
                    itemCount: 10
                ),
            ),

          ],
        )
    );
  }
}

Widget Block_Post(){
  return  Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.fromLTRB(20,0,0,0),
          child: Row(
            children:  [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage('assets/images/reda.jpeg'),
                ),
              ),
              const SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mahmoud Reda',
                    style: GoogleFonts.lato(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text('2 weeks ago',
                    style: GoogleFonts.lato(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),)
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,0, 10, 0),
          child: Text('By discovering nature, you discover yourself',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Image(
            image: NetworkImage(
                'https://image.freepik.com/free-photo/landscape-morning-fog-mountains-with-hot-air-balloons-sunrise_335224-794.jpg'
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            const SizedBox(width: 12,),
            const Image(
                height: 20,
                width: 20,
                image:
                AssetImage(
                  'assets/images/heart.png',
                )),
            const SizedBox(width: 5,),
            Text('23',
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
            const Spacer(),
            const Image(
                height: 20,
                width: 20,
                image:
                AssetImage(
                  'assets/images/comment.png',
                )),
            const SizedBox(width: 5,),
            Text('6',
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
            const SizedBox(width: 10,),
          ],

        ),
        const SizedBox(height: 10,),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          height: 1,
          color: Colors.grey[300],
        ),
        const SizedBox(height: 8,),
        Row(
          children:  [
            const SizedBox(width: 7,),
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/mine.png'),
              ),
            ),
            const SizedBox(width: 15,),
            Text('Write a comment...',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 15,
              ),),
            const Spacer(),
            const Image(
                height: 22,
                width: 22,
                image:
                AssetImage(
                  'assets/images/heart.png',
                )),
            const SizedBox(width: 5,),
            Text('Like',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 16,
              ),),
            const SizedBox(width: 10,),

          ],
        ),
        const SizedBox(height: 10,),

      ],

    ),
  );


}
