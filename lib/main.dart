// @dart=2.9
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/container_screen.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:final_project/modules/AboutScreen/AboutScreen.dart';
import 'package:final_project/modules/BotScreen/BotScreen.dart';
import 'package:final_project/modules/BotScreen/botContainer.dart';
import 'package:final_project/modules/BotScreen/botDesign.dart';
import 'package:final_project/modules/CommentScreen/CommentScreen.dart';
import 'package:final_project/modules/NewPost/NewPost.dart';
import 'package:final_project/modules/RoadMapScreen/RoadMapScreen.dart';
import 'package:final_project/modules/SettingScreen/setting_screen.dart';
import 'package:final_project/modules/addPost/add_post.dart';
import 'package:final_project/modules/analysisScreen/analysis_screen.dart';
import 'package:final_project/modules/chatScreen/chat_screen.dart';
import 'package:final_project/modules/complaintScreen/complaint_screen.dart';
import 'package:final_project/modules/login/ForgetPassword.dart';
import 'package:final_project/modules/login/login_screen.dart';
import 'package:final_project/modules/login/logincubit/bloc.dart';
import 'package:final_project/modules/materialsScreen/doctor_material_screen.dart';
import 'package:final_project/modules/materialsScreen/special_screen.dart';
import 'package:final_project/modules/messageScreen/message_screen.dart';
import 'package:final_project/modules/onboardingScreen/onboarding_screen.dart';
import 'package:final_project/modules/profile/profile.dart';
import 'package:final_project/modules/register/doctor_register_screen.dart';
import 'package:final_project/modules/register/email_verified.dart';
import 'package:final_project/modules/register/register_screen.dart';
import 'package:final_project/modules/register/registercubit/bloc.dart';
import 'package:final_project/modules/register/set_profile_register_screen.dart';
import 'package:final_project/modules/register/student_register_screen.dart';
import 'package:final_project/modules/welcomeScreen/welcome_screen.dart';
import 'package:final_project/shared/Componant/Constants.dart';
import 'package:final_project/shared/local/cash_helper.dart';
import 'package:final_project/shared/local/dio_helper_analysis.dart';
import 'package:final_project/shared/local/dio_helper_chat_bot.dart';
import 'package:final_project/shared/local/diohelper.dart';
import 'package:final_project/splashScreen/splash_screen.dart';
import 'package:final_project/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:record_mp3/record_mp3.dart';
import 'firebase_options.dart';
import 'modules/test_record.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FlutterDownloader.initialize(
      debug: true,
      ignoreSsl: true,
  );
  await CashHelper.init();
  await DioHelper.init();
  await DioHelperChatBot.init();
  await DioHelperAnalysis.init();
  uId = CashHelper.getData(key: 'uId');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
        create: (BuildContext context) => AppCubit()..getUserData()..getHomePost()..getGroupPosts()..printAnalysis(),
        ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
        ],
        child: BlocConsumer<AppCubit,AppState>(
          listener: (context,state){},
          builder: (context,state){
            AppCubit.get(context).homePost;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: mainColorLayout,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: mainColorLayout,
                      statusBarIconBrightness: Brightness.light
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
                textTheme: GoogleFonts.nunitoSansTextTheme(
                  Theme.of(context).textTheme,
                ),
              ),
              home: const SettingScreen(),
            );
          },
        ),
    );

  }
}
