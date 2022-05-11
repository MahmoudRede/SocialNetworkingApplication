import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:final_project/models/analysisModel/analysis_model.dart';
import 'package:final_project/modules/groupsScreen/doctorGroup/group_doctor_screen.dart';
import 'package:final_project/shared/local/dio_helper_analysis.dart';
import 'package:final_project/shared/local/dio_helper_chat_bot.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/layout_screen.dart';
import 'package:final_project/models/groupModel/group_model.dart';
import 'package:final_project/models/homeModel/home_model.dart';
import 'package:final_project/models/materialModel.dart';
import 'package:final_project/modules/BotScreen/BotScreen.dart';
import 'package:final_project/modules/addPost/add_post.dart';
import 'package:final_project/modules/groupsScreen/group_screen.dart';
import 'package:final_project/modules/homeScreen/home_screen.dart';
import 'package:final_project/modules/materialsScreen/doctor_material_screen.dart';
import 'package:final_project/modules/materialsScreen/student_material_screen.dart';
import 'package:final_project/modules/settings/setting_screen.dart';
import 'package:final_project/shared/local/cash_helper.dart';
import 'package:final_project/shared/local/diohelper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../models/CommentModel.dart';
import '../../../models/PostModel.dart';
import '../../../models/userModel/user_model.dart';
import '../../../shared/Componant/Constants.dart';

class AppCubit extends Cubit<AppState> {

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  double xOffcet = 0;
  double yOffcet = 0;
  double scale = 1;
  bool factor = false;

  void doSmallScreen() {
    if (factor == false) {
      xOffcet = 220;
      yOffcet = 120;
      scale = .7;
      factor = true;
      emit(SmallScreenState());
    }
    else{
        xOffcet=0;
        yOffcet=0;
        scale=1;
        factor=false;
        emit(NormalScreenState());
    }
  }

  int  currentIndex=0;

  void changeBottomNavigate(index){
    currentIndex=index;
    if(index==2){
    getMaterialTitles();
    getMaterial();

    }
    emit(ChangeBottomNavigateState());
  }

  List <Widget> studentScreens =[
    const HomeScreen(),
    const GroupScreen(),
    StudentMaterialScreen(),
    const SettingScreen(),
  ];

  List <Widget> doctorScreens =[
    const HomeScreen(),
    GroupDoctorScreen(),
    DoctorMaterialScreen(),
    const SettingScreen(),
  ];



  List <String> Titles =[
    'HomeScreen',
    'GroupScreen',
    'MaterialScreen',
    'SettingScreen',
  ];


  bool ?doctorCheck;

  UserModel? userModel;

   Future<void> getUserData() async{
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.formJson(value.data()!);
      doctorCheck=userModel!.isDoctor;
      CashHelper.saveData(key: 'gradeUser',value: userModel!.grade);
      CashHelper.saveData(key: 'departmentUser',value: userModel!.department);
      CashHelper.saveData(key: 'specialUser',value: userModel!.specialist);

      print('user Data : ${value.data()}');
      getUserFriends();
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      print('error when get userData : ${error.toString()}');
      emit(GetUserDataErrorState());
    });
  }


  File? uploadedPostImage ;
  var picker = ImagePicker();

  Future <void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedPostImage = File(pickedFile.path);
      emit(UploadPostImageSuccessState());
    } else {
      print('No Image selected.');
      emit(UploadPostImageErrorState());
    }
  }

  void removePostImage() {
    uploadedPostImage = null;
    emit(RemovePostImageState());
  }


  void createPostWithImage ({
    required String postDate,
    required String postText,
  })
  {
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(uploadedPostImage!.path)
        .pathSegments.last}').putFile(uploadedPostImage!)
        .then((value){
      value.ref.getDownloadURL().then((value) {
        createPost(
          postDate: postDate,
          postText: postText,
          postImage: value,
        );

        print('image url ${value.toString()}');
        emit(CreatePostSuccessState());

      }).catchError((error){
        print('Error When Create post with image : ${error.toString()}');
        emit(CreatePostErrorState());
      });
    }).catchError((error){
      print('Error When Upload image in Firesorage : ${error.toString()}');
      emit(CreatePostErrorState());
    });
  }
  
  void createPost ({
    required String postDate,
    required String postText,
    String? postImage,
  })
  {
    emit(CreatePostLoadingState());
    PostModel model = PostModel(
      username: userModel?.fullName,
      userImage: userModel?.image,
      userId: userModel?.uId,
      postDate: postDate,
      postText: postText,
      postImage: postImage ?? '',
    );

    FirebaseFirestore.instance.collection('homePost')
        .add(model.toMap())
        .then((value) {
      print('Post Uploaded Successful : ${value.toString()}');
      // value.snapshots().listen((event) {
      //
      // });
      emit(CreatePostSuccessState());
    }).catchError((error){
      print('Error When Create New Post : ${error.toString()}');
      emit(CreatePostErrorState());
    });

  }
  

  List <PostModel> homePost = [];
  List<String> homePostsId = [];
  List<String> groupPostsId = [];
  List<int> homeLikes = [];
  List<int> groupLikes = [];
  List<int> homeCommentsNumber = [];
  List<int> groupCommentsNumber = [];
  List<CommentModel> homeComments = [];
  List<CommentModel> groupComments = [];

  void getHomePost ()
  {
    homePost = [];
    FirebaseFirestore.instance
        .collection('homePost').orderBy('postDate')
        .snapshots().listen((event) {
      event.docs.forEach((element) {
            element.reference.collection('comments').get().then((value) {
              homeCommentsNumber.add(value.docs.length);
              homePostsId.add(element.id);
              homePost.add(PostModel.fromFire(element.data()));
            });
            element.reference.collection('likes').snapshots().listen((event) {
              homeLikes.add(event.docs.length);
            });
          });
          print(homePost[0].username);
          emit(GetHomePostSuccessState());
    });
  }


  List <GroupModel> groupPosts=[];

  String ?gradeGroup=CashHelper.getData(key: 'gradeUser');
  String ?departmentGroup=CashHelper.getData(key: 'departmentUser');
  String ?userSpecial=CashHelper.getData(key: 'specialUser');

  void prin(){
    print(gradeGroup);
    print(departmentGroup);
  }


  void getGroupPosts(){
    groupPosts=[];

    emit(GetPostGroupLoadingState());
    if(gradeGroup == 'First'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade1')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
        event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            groupPosts.add(GroupModel.fromFire(element.data()));
          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetPostGroupSuccessState());
      });
    }
    else if(gradeGroup =='Second'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade2')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
        event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            groupPosts.add(GroupModel.fromFire(element.data()));
          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetPostGroupSuccessState());
      });

    }
    else if(gradeGroup =='Third'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade3')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
        event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            groupPosts.add(GroupModel.fromFire(element.data()));
          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetPostGroupSuccessState());
      });
    }
    else if(gradeGroup =='Fourth'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade4')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
        event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            groupPosts.add(GroupModel.fromFire(element.data()));
          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetPostGroupSuccessState());
      });
    }
    }


  String ?selectedGrade;
  String ?selectedDepartment;

  List<GroupModel> DoctorPosts=[];

   void getGroupPostsDoctor(){
    DoctorPosts=[];

    if(selectedGrade == 'First'){
      FirebaseFirestore.instance.collection(selectedDepartment!)
          .doc('grade1')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
            event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            DoctorPosts.add(GroupModel.fromFire(element.data()));
            emit(GetGroupDoctorSuccessState());
          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetGroupDoctorSuccessState());
      });
    }
    else if(selectedGrade =='Second'){
      FirebaseFirestore.instance.collection(selectedDepartment!)
          .doc('grade2')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
            event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            DoctorPosts.add(GroupModel.fromFire(element.data()));
            emit(GetGroupDoctorSuccessState());

          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetGroupDoctorSuccessState());
      });

    }
    else if(selectedGrade =='Third'){
      FirebaseFirestore.instance.collection(selectedDepartment!)
          .doc('grade3')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
        event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            DoctorPosts.add(GroupModel.fromFire(element.data()));
            emit(GetGroupDoctorSuccessState());

          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetGroupDoctorSuccessState());
      });

    }
    else if(selectedGrade =='Fourth'){
      FirebaseFirestore.instance.collection(selectedDepartment!)
          .doc('grade4')
          .collection('posts').orderBy('postDate')
          .snapshots().listen((event) {
        event.docs.forEach((element) {
          element.reference.collection('comments').get().then((value) {
            groupCommentsNumber.add(value.docs.length);
            groupPostsId.add(element.id);
            DoctorPosts.add(GroupModel.fromFire(element.data()));
            emit(GetGroupDoctorSuccessState());
          });
          element.reference.collection('likes').get().then((value) {
            groupLikes.add(value.docs.length);
          });
        });
        emit(GetGroupDoctorSuccessState());
      });

    }
    emit(GetGroupDoctorSuccessState());
   }

  void selectedDoctorValue(int indexGrade,int indexDepartment) {
  if(indexDepartment==0 ){
    if(indexGrade==0){
      selectedDepartment='General';
      selectedGrade='First';
    }
    else if(indexGrade==1){
      selectedDepartment='General';
      selectedGrade='Second';
    }
    else if(indexGrade==2){
      selectedDepartment='General';
      selectedGrade='Third';
    }
    else{
      selectedDepartment='General';
      selectedGrade='Fourth';
    }
  }
  else if(indexDepartment==1 ){
    if(indexGrade==0){
      selectedDepartment='Medical';
      selectedGrade='First';
    }
    else if(indexGrade==0){
      selectedDepartment='Medical';
      selectedGrade='Second';
    }
    else if(indexGrade==0){
      selectedDepartment='Medical';
      selectedGrade='Third';
    }
    else{
      selectedDepartment='Medical';
      selectedGrade='Fourth';
    }
  }
  else if(indexDepartment==2 ){
    if(indexGrade==0){
      selectedDepartment='Security';
      selectedGrade='First';
    }
    else if(indexGrade==1){
      selectedDepartment='Security';
      selectedGrade='Second';
    }
    else if(indexGrade==2){
      selectedDepartment='Security';
      selectedGrade='Third';
    }
    else{
      selectedDepartment='Security';
      selectedGrade='Fourth';
    }
  }
  else {
    if(indexGrade==0){
      selectedDepartment='Network';
      selectedGrade='First';
    }
    else if(indexGrade==1){
      selectedDepartment='Network';
      selectedGrade='Second';
    }
    else if(indexGrade==2){
      selectedDepartment='Network';
      selectedGrade='Third';
    }
    else{
      selectedDepartment='Network';
      selectedGrade='Fourth';
    }
  }
  getGroupPostsDoctor();
  emit(SelectedValueSuccessState());

  }


  File? uploadedPostGroupImage ;

  Future <void> getPostGroupImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedPostGroupImage = File(pickedFile.path);
      emit(UploadPostGroupImageSuccessState());
    } else {
      print('No Image selected.');
      emit(UploadPostGroupImageErrorState());
    }
  }

  void removePostGroupImage() {
    uploadedPostGroupImage = null;
    emit(RemovePostImageState());
  }


  void createPostGroupWithImage ({
    required String postDate,
    required String postText,
    required BuildContext context ,
  })
  {
    emit(CreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('groupposts/${Uri.file(uploadedPostGroupImage!.path)
        .pathSegments.last}').putFile(uploadedPostGroupImage!)
        .then((value){
      value.ref.getDownloadURL().then((value) {
        createGroupPost(
          postDate: postDate,
          postText: postText,
          postImage: value,
          context: context,
        );

        print('image url ${value.toString()}');
        emit(CreatePostGroupSuccessState());

      }).catchError((error){
        print('Error When Create post with image : ${error.toString()}');
        emit(CreatePostGroupErrorState());
      });
    }).catchError((error){
      print('Error When Upload image in Firesorage : ${error.toString()}');
      emit(CreatePostGroupSuccessState());
    });
  }

  void createGroupPost ({
    required String postDate,
    required String postText,
    String? postImage,
    required BuildContext context,
  })
  {
    emit(CreatePostLoadingState());
    GroupModel model = GroupModel(
      username: userModel?.fullName,
      userImage: userModel?.image,
      userId: userModel?.uId,
      postDate: postDate,
      postText: postText,
      postImage: postImage ?? '',
    );

      if(gradeGroup=='First'){
        FirebaseFirestore.instance.collection(departmentGroup!).doc('grade1').
        collection('posts')
            .add(model.toMap())
            .then((value) {
          print('Post Uploaded Successful : ${value.toString()}');
          emit(CreatePostGroupSuccessState());
        }).catchError((error){
          print('Error When Create New Post : ${error.toString()}');
          emit(CreatePostGroupErrorState());
        });
      }
      else if(gradeGroup=='Second'){
        FirebaseFirestore.instance.collection(departmentGroup!).doc('grade2').
        collection('posts')
            .add(model.toMap())
            .then((value) {
          print('Post Uploaded Successful : ${value.toString()}');
          emit(CreatePostGroupSuccessState());
        }).catchError((error){
          print('Error When Create New Post : ${error.toString()}');
          emit(CreatePostGroupErrorState());
        });
      }
      else if(gradeGroup=='Third'){
        FirebaseFirestore.instance.collection(departmentGroup!).doc('grade3').
        collection('posts')
            .add(model.toMap())
            .then((value) {
          print('Post Uploaded Successful : ${value.toString()}');
          emit(CreatePostGroupSuccessState());
        }).catchError((error){
          print('Error When Create New Post : ${error.toString()}');
          emit(CreatePostGroupErrorState());
        });
      }
      else{
        FirebaseFirestore.instance.collection(departmentGroup!).doc('grade4').
        collection('posts')
            .add(model.toMap())
            .then((value) {
          print('Post Uploaded Successful : ${value.toString()}');
          navigateAndFinish(context, const LayoutScreen());
          emit(CreatePostGroupSuccessState());
        }).catchError((error){
          print('Error When Create New Post : ${error.toString()}');
          emit(CreatePostGroupErrorState());
        });
      }

  }

  Future refreshApp() async {
    await Future.delayed(const Duration(seconds: 3));
    getUserData();
    getHomePost();
    getGroupPosts();
    emit(RefreashApp());
  }


  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 3));
    getGroupPosts();
    emit(RefreashApp());
  }

  List <UserModel> userFriends = [] ;
  void getUserFriends() {
    userFriends = [];
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').get().then((value){
      value.docs.forEach((element) {
        if(element.data()['grade'] == userModel!.grade.toString() && element.data()['uId'] != userModel!.uId){
          userFriends.add(UserModel.formJson(element.data()));
        }
      });
      print(userFriends.length);
      emit(GetUserFriendsSuccessState());
    }).catchError((error) {
      print('error when get user Friends : ${error.toString()}');
      emit(GetUserFriendsErrorState());
    });
  }

  List <PostModel> userPosts = [];
  List <String> coursesTitle = [];
  List <String> coursesDoctorTitle = [];


  void getUserPosts ()
  {
    emit(GetUserPostLoadingState());
    switch (userModel!.grade)
    {
       case 'First' : {
         FirebaseFirestore.instance.collection('General')
             .doc('grade1')
             .collection('posts').snapshots().listen((event) {
               event.docs.forEach((element) {
                 if(element.data()['userId'] == userModel!.uId){
                   userPosts.add(PostModel.fromFire(element.data()));
                 }
               });
               emit(GetUserPostSuccessState());
         });
         break;
       }

      case 'Second' : {
        FirebaseFirestore.instance.collection('General')
            .doc('grade2')
            .collection('posts')
            .snapshots().listen((event) {
          event.docs.forEach((element) {
            if(element.data()['userId'] == userModel!.uId){
              userPosts.add(PostModel.fromFire(element.data()));
            }
          });
          print(userPosts.length);
          emit(GetUserPostSuccessState());
        });
        break;
      }
      case 'Third' : {
        FirebaseFirestore.instance.collection('General')
            .doc('grade3')
            .collection('posts')
            .snapshots().listen((event) {
          event.docs.forEach((element) {
            if(element.data()['userId'] == userModel!.uId){
              userPosts.add(PostModel.fromFire(element.data()));
            }
          });
          emit(GetUserPostSuccessState());
        });
        break;
      }

      case 'Fourth' : {
        FirebaseFirestore.instance.collection('General')
            .doc('grade4')
            .collection('posts')
            .snapshots().listen((event) {
              event.docs.forEach((element) {
            if(element.data()['userId'] == userModel!.uId){
              userPosts.add(PostModel.fromFire(element.data()));
            }
          });
          emit(GetUserPostSuccessState());
        });
        break;
      }
    }
  }


  void getMaterialTitles ()
  {
    coursesTitle = [];

    if(gradeGroup=='First')  {
        FirebaseFirestore.instance.collection(departmentGroup!)
            .doc('grade1')
            .collection('Material')
            .get().then((value) {
          value.docs.forEach((element) {
            coursesTitle.add(element.id.toString());
          });
          emit(GetUserPostSuccessState());
        }).catchError((error){
          print('Error When get user Posts : ${error.toString()}');
          emit(GetUserPostErrorState());
        });

      }
    else if(gradeGroup=='Second') {
        FirebaseFirestore.instance.collection(departmentGroup!)
            .doc('grade2')
            .collection('Material')
            .get().then((value) {
          value.docs.forEach((element) {
            coursesTitle.add(element.id.toString());
          });
          print(coursesTitle.length);
          emit(GetUserPostSuccessState());
        }).catchError((error){
          print('Error When get user Posts : ${error.toString()}');
          emit(GetUserPostErrorState());
        });
      }
   else if(gradeGroup=='Third' && departmentGroup !='General') {
        FirebaseFirestore.instance.collection(departmentGroup!)
            .doc('grade3')
            .collection('Material')
            .get().then((value) {
          value.docs.forEach((element) {
            coursesTitle.add(element.id.toString());
          });
          print(coursesTitle.length);
          emit(GetUserPostSuccessState());
        }).catchError((error){
          print('Error When get user Posts : ${error.toString()}');
          emit(GetUserPostErrorState());
        });
      }
    else if(gradeGroup=='Third' && departmentGroup =='General') {
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade3')
          .collection(userSpecial!)
          .get().then((value) {
        value.docs.forEach((element) {
          coursesTitle.add(element.id.toString());
        });
        print(coursesTitle.length);
        emit(GetUserPostSuccessState());
      }).catchError((error){
        print('Error When get user Posts : ${error.toString()}');
        emit(GetUserPostErrorState());
      });
    }

    else if(gradeGroup=='Fourth' && departmentGroup !='General') {
        FirebaseFirestore.instance.collection(departmentGroup!)
            .doc('grade4')
            .collection('Material')
            .get().then((value) {
          value.docs.forEach((element) {
            coursesTitle.add(element.id.toString());
          });
          print(coursesTitle.length);
          emit(GetUserPostSuccessState());
        }).catchError((error){
          print('Error When get user Posts : ${error.toString()}');
          emit(GetUserPostErrorState());
        });

    }
    else  {
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade4')
          .collection(userSpecial!)
          .get().then((value) {
        value.docs.forEach((element) {
          coursesTitle.add(element.id.toString());
        });
        print(coursesTitle.length);
        emit(GetUserPostSuccessState());
      }).catchError((error){
        print('Error When get user Posts : ${error.toString()}');
        emit(GetUserPostErrorState());
      });

    }
  }

  String ? valueSpeical='';

  Future getDoctorMaterialTitles () async
  {
    coursesDoctorTitle=[];
    if(CashHelper.getData(key: 'gradeDrop')=='First'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade1')
          .collection('Material')
          .get().then((value) {
        value.docs.forEach((element) {
          coursesDoctorTitle.add(element.id.toString());
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });

    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Second'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade2')
          .collection('Material')
          .get().then((value) {
        value.docs.forEach((element) {
          coursesDoctorTitle.add(element.id.toString());
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Third' && CashHelper.getData(key: 'departmentDrop') !='General'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade3')
          .collection('Material')
          .get().then((value) {
        value.docs.forEach((element) {
          coursesDoctorTitle.add(element.id.toString());
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Third' && CashHelper.getData(key: 'departmentDrop') =='General'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade3')
          .collection(valueSpeical!)
          .get().then((value) {
        value.docs.forEach((element) {
          coursesDoctorTitle.add(element.id.toString());
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Fourth' && CashHelper.getData(key: 'departmentDrop') =='General'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade4')
          .collection(valueSpeical!)
          .get().then((value) {
        value.docs.forEach((element) {
          coursesDoctorTitle.add(element.id.toString());
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else {
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade4')
          .collection('Material')
          .get().then((value) {
        value.docs.forEach((element) {
          coursesDoctorTitle.add(element.id.toString());
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }

  }

  List <MaterialModel> lecture = [];
  List <MaterialModel> section = [];


  UserModel? selectedUserModel;

  void getSelectedUserData({
    required String selectedUserId,
  })
  {
    emit(GetSelectedUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(selectedUserId).get().then((value) {
      selectedUserModel = UserModel.formJson(value.data()!);
      emit(GetSelectedUserSuccessState());
    }).catchError((error) {
      print('error when get selected User Model : ${error.toString()}');
      emit(GetSelectedUserErrorState());
    });
  }


  List <PostModel> selectedUserPosts = [];
  void getSelectedUserPosts()
  {
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        element.reference.collection('comments').get().then((value) {
          homeCommentsNumber.add(value.docs.length);
          homePostsId.add(element.id);
          if(PostModel.fromFire(element.data()).userId == selectedUserModel!.uId) {
            selectedUserPosts.add(PostModel.fromFire(element.data()));
          }
        }).catchError((error){});
        element.reference.collection('likes').get().then((value) {
          homeLikes.add(value.docs.length);
        }).catchError((error){});
      });

      emit(GetSelectedUserPostSuccessState());
    }).catchError((error){
      print('error when get posts ${error.toString()}');
      emit(GetSelectedUserPostErrorState());
    });

  }


  void likeHomePost(String postId) {
    FirebaseFirestore.instance
        .collection('homePost')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({
      'like': true,
      'userName' : userModel!.fullName,
    }).then((value) {
      FirebaseFirestore.instance
          .collection('homePost')
          .doc(postId)
          .collection('likes').snapshots().listen((event) {
        homeLikes.add(event.docs.length);
        emit(LikeRunTimeState());
      });
      emit(LikePostsSuccessState());
    }).catchError((error) {
      print('Error When set likes : ${error.toString()}');
      emit(LikePostsErrorState());
    });
  }

  void dislikeHomePost (String postId) {
    FirebaseFirestore.instance
        .collection('homePost')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .delete().then((value) {
      FirebaseFirestore.instance
          .collection('homePost')
          .doc(postId)
          .collection('likes').snapshots().listen((event) {
        homeLikes.add(event.docs.length);
        emit(DisLikePostsSuccessState());
      });
    }).catchError((error) {
      print('Error When set likes : ${error.toString()}');
      emit(DisLikePostsErrorState());
    });
  }

  bool isLike = false;
  void likeClick (String postId){
    FirebaseFirestore.instance
        .collection('homePost')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .get().then((value) {
      if (value.get('like') == true)
      {
        dislikeHomePost(postId);
        FirebaseFirestore.instance
            .collection('homePost')
            .doc(postId)
            .collection('likes').snapshots().listen((event) {
          homeLikes.add(event.docs.length);
          emit(LikeRunTimeState());
        });
        print('disliked post');
      }
      emit(LikePostsSuccessState());
    }).catchError((error) {
      print('Error When set likes : ${error.toString()}');
      if (error.toString() == 'Bad state: cannot get a field on a DocumentSnapshotPlatform which does not exist')
      {
        likeHomePost(postId);
        FirebaseFirestore.instance
            .collection('homePost')
            .doc(postId)
            .collection('likes').snapshots().listen((event) {
          homeLikes.add(event.docs.length);
          emit(LikePostsSuccessState());
        });
        print('liked post');
      }
      emit(LikePostsErrorState());
    });
  }

  void likeGroupPost(String postId) {
    switch(userModel!.department)
    {
      case 'General' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('General')
                  .doc('grade1')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Second' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('General')
                  .doc('grade2')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Third' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('General')
                  .doc('grade3')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Fourth' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('General')
                  .doc('grade4')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }

        }
        break;
      }

      case 'Medical' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Medical')
                  .doc('grade1')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Second' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Medical')
                  .doc('grade2')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Third' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Medical')
                  .doc('grade3')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Fourth' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Medical')
                  .doc('grade4')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
        }
        break;
      }

      case 'Security' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Security')
                  .doc('grade1')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Second' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Security')
                  .doc('grade2')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Third' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Security')
                  .doc('grade3')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Fourth' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Security')
                  .doc('grade4')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
        }
        break;
      }

      case 'Network' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Network')
                  .doc('grade1')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Second' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Network')
                  .doc('grade2')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Third' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Network')
                  .doc('grade3')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
          case 'Fourth' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('likes')
                .doc(userModel!.uId)
                .set({
              'like': true,
              'userName' : userModel!.fullName,
            }).then((value) {
              FirebaseFirestore.instance.collection('Network')
                  .doc('grade3')
                  .collection('posts')
                  .doc(postId)
                  .collection('likes').snapshots().listen((event) {
                groupLikes.add(event.docs.length);
                emit(LikePostsSuccessState());
              });
              emit(LikePostsSuccessState());
            }).catchError((error) {
              print('Error When set likes : ${error.toString()}');
              emit(LikePostsErrorState());
            });
            break;
          }
        }
        break;
      }
    }
  }

  void commentHomePost(String postId, String comment) {
    CommentModel model = CommentModel(
      username: userModel!.fullName!,
      userImage: userModel!.image!,
      userId: userModel!.uId,
      comment: comment,
    );
    FirebaseFirestore.instance
        .collection('homePost')
        .doc(postId)
        .collection('comments')
        .add(model.toMap())
        .then((value) {
      value.snapshots().listen((event) {
        homeComments = [] ;
        getHomeComments(postId);
      });
      emit(CommentPostsSuccessState());
    }).catchError((error) {
      print('Error When set comment in home : ${error.toString()}');
      emit(CommentPostsErrorState());
    });
  }

  void commentGroupPost(String postId, String comment) {
    CommentModel model = CommentModel(
      username: userModel!.fullName!,
      userImage: userModel!.image!,
      userId: userModel!.uId,
      comment: comment,
    );

    switch (userModel!.department)
    {
      case 'General' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Second' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Third' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Fourth' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }
        }
        break;
      }

      case 'Medical' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Second' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Third' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Fourth' : {
            FirebaseFirestore.instance.collection('Medical')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }
        }
        break;
      }

      case 'Security' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Second' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Third' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Fourth' : {
            FirebaseFirestore.instance.collection('Security')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }
        }
        break;
      }

      case 'Network' : {
        switch (userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Second' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Third' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }

          case 'Fourth' : {
            FirebaseFirestore.instance.collection('Network')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .collection('comments')
                .add(model.toMap())
                .then((value) {
              value.snapshots().listen((event) {
                groupComments = [];
                getGroupComments(postId: postId);
              });
              emit(CommentPostsSuccessState());
            }).catchError((error) {
              print('Error When set comment in home : ${error.toString()}');
              emit(CommentPostsErrorState());
            });
            break;
          }
        }
        break;
      }

    }

  }

  void getHomeComments(String postId) {
    homeComments = [];
    FirebaseFirestore.instance
        .collection('homePost')
        .doc(postId)
        .get()
        .then((value) {
      value.reference.collection('comments').get().then((value) {
        for (var element in value.docs) {
          homeComments.add(CommentModel.fromFire(element.data()));
          homeCommentsNumber.add(value.docs.length);
        }
        print(homeComments.toString());
        emit(GetCommentsSuccessState());
      }).catchError((error) {
        print('Error When get Comments : ${error.toString()}');
      });
    }).catchError((error) {
      emit(GetCommentsErrorState());
    });
  }

  void getGroupComments ({required String postId})
  {
    groupComments = [];

    switch (userModel!.department)
    {

      case 'General' : {

        switch(userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Second' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Third' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Fourth' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

        }
        break;
      }

      case 'Medical' : {

        switch(userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Second' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Third' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Fourth' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

        }
        break;
      }


      case 'Security' : {

        switch(userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Second' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }
          case 'Third' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

          case 'Fourth' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }

        }
        break;
      }

      case 'Network' : {

        switch(userModel!.grade)
        {
          case 'First' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade1')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }
          case 'Second' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade2')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }
          case 'Third' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade3')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }
          case 'Fourth' : {
            FirebaseFirestore.instance.collection('General')
                .doc('grade4')
                .collection('posts')
                .doc(postId)
                .get()
                .then((value) {
              value.reference.collection('comments').get().then((value) {
                for (var element in value.docs) {
                  groupComments.add(CommentModel.fromFire(element.data()));
                  groupCommentsNumber.add(value.docs.length);
                }
                emit(GetCommentsSuccessState());
              }).catchError((error) {
                print('Error When get Comments : ${error.toString()}');
              });
            }).catchError((error) {
              emit(GetCommentsErrorState());
            });
            break;
          }
        }
        break;
      }
    }
  }


  String ?courseName;

  void getSection ()
  {
      section=[];
    if(gradeGroup=='First'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade1')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .get().then((value) {
        value.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetSectionsErrorState());
      });

    }
    else if(gradeGroup=='Second'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade2')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .get().then((value) {
        value.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetSectionsErrorState());
      });
    }
    else if(gradeGroup=='Third' && departmentGroup !='General'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade3')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .get().then((value) {
        value.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetSectionsErrorState());
      });
    }
    else if(gradeGroup=='Third' && departmentGroup =='General'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade3')
          .collection(userSpecial!)
          .doc(courseName)
          .collection('section')
          .get().then((value) {
        value.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetSectionsErrorState());
      });
    }
    else if(gradeGroup=='Fourth' && departmentGroup !='General'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade4')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .get().then((value) {
        value.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetSectionsErrorState());
      });
    }
    else {
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade4')
          .collection(userSpecial!)
          .doc(courseName)
          .collection('section')
          .get().then((value) {
        value.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetSectionsErrorState());
      });
    }

  }

  void getMaterial ()
  {
    lecture=[];
    print(courseName);
    if(gradeGroup=='First'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade1')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .get().then((value) {
        value.docs.forEach((element) {
          lecture.add(MaterialModel.fromFire(element.data()));
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });

    }
    else if(gradeGroup=='Second'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade2')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .get().then((value) {
        value.docs.forEach((element) {
          lecture.add(MaterialModel.fromFire(element.data()));
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else if(gradeGroup=='Third'&& departmentGroup !='General'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade3')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .get().then((value) {
        value.docs.forEach((element) {
          lecture.add(MaterialModel.fromFire(element.data()));
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else if(gradeGroup=='Third'&& departmentGroup =='General'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade3')
          .collection(userSpecial!)
          .doc(courseName)
          .collection('lecture')
          .get().then((value) {
        value.docs.forEach((element) {
          lecture.add(MaterialModel.fromFire(element.data()));
        });
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else if(gradeGroup=='Fourth' && departmentGroup !='General'){
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade4')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .get().then((value) {
        for (var element in value.docs) {
          lecture.add(MaterialModel.fromFire(element.data()));
        }
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }
    else {
      FirebaseFirestore.instance.collection(departmentGroup!)
          .doc('grade4')
          .collection(userSpecial!)
          .doc(courseName)
          .collection('lecture')
          .get().then((value) {
        for (var element in value.docs) {
          lecture.add(MaterialModel.fromFire(element.data()));
        }
        print('lecture size : ${lecture.length}');
        emit(GetMaterialSuccessState());
      }).catchError((error){
        print('Error when get Material : ${error.toString()}');
        emit(GetMaterialErrorState());
      });
    }

  }

  void getDoctorSection ()
  {
   section=[];
    if(CashHelper.getData(key: 'gradeDrop')=='First'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade1')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .snapshots().listen((event) {
        section=[];
        event.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      });

    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Second'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade2')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .snapshots().listen((event) {
        section=[];
        event.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      });
    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Third'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade3')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .snapshots().listen((event) {
        section=[];
        event.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      });
    }
    else {
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade4')
          .collection('Material')
          .doc(courseName)
          .collection('section')
          .snapshots().listen((event) {
        section=[];
        event.docs.forEach((element) {
          section.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetSectionsSuccessState());
      });
    }

  }

  void getDoctorMaterial ()
  {
     lecture=[];
    print(courseName);
    if(CashHelper.getData(key: 'gradeDrop')=='First'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade1')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .snapshots().listen((event) {
          lecture=[];

        event.docs.forEach((element) {
            lecture.add(MaterialModel.fromFire(element.data()));
          });
          emit(GetMaterialSuccessState());
        });

    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Second'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade2')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .snapshots().listen((event) {
        lecture=[];

        event.docs.forEach((element) {
          lecture.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetMaterialSuccessState());
      });
    }
    else if(CashHelper.getData(key: 'gradeDrop')=='Third'){
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade3')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .snapshots().listen((event) {
        lecture=[];

        event.docs.forEach((element) {
          lecture.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetMaterialSuccessState());
      });
    }
    else {
      FirebaseFirestore.instance.collection('${CashHelper.getData(key: 'departmentDrop')}')
          .doc('grade4')
          .collection('Material')
          .doc(courseName)
          .collection('lecture')
          .snapshots().listen((event) {
        lecture=[];

        event.docs.forEach((element) {
          lecture.add(MaterialModel.fromFire(element.data()));
        });
        emit(GetMaterialSuccessState());
      });
    }

  }


  List <Color> colorsContainer =[
    const Color(0xffF27069),
    const Color(0xffF6B68D),
    const Color(0xffD6D6D7),
    const Color(0xffFFADFE),
    const Color(0xffBEEECA),
    const Color(0xff9DB9D2),
    const Color(0xffFBA09D),
    const Color(0xffFBDA9D),
    const Color(0xffECD4DC),
    const Color(0xffE9D3C3),
    const Color(0xffA8E9F0),
    const Color(0xffDABECB),

  ];

  List <Color> colorsItem =[
    const Color(0xff5E0C08),
    const Color(0xff97410C),
    const Color(0xff3D3D3E),
    const Color(0xff7A0078),
    const Color(0xff19612B),
    const Color(0xff1A2A38),
    const Color(0xff760905),
    const Color(0xff764E05),
    const Color(0xff552534),
    const Color(0xff593921),
    const Color(0xff126069),
    const Color(0xff412532),

  ];

  String url= "";

  bool isUpload=true;
  Future getPdf({
    required String title,
    int index=0,
  })async{
    isUpload=true;
    emit(UploadPDFSuccessState());
    print('start upload');
    FilePickerResult? result=await FilePicker.platform.pickFiles();
    File pick= File(result!.files.single.path.toString());
    var file =pick.readAsBytesSync();
    isUpload=false;
    emit(UploadPDFSuccessState());
    String name =DateTime.now().millisecondsSinceEpoch.toString();
    // upload to firebase


    print('${CashHelper.getData(key: 'type')}');
    var pdfFile =  FirebaseStorage.instance.ref().child(CashHelper.getData(key: 'departmentDrop'))
        .child(CashHelper.getData(key: 'gradeDrop'))
        .child(CashHelper.getData(key: 'type'))
        .child(title)
         .child('${index+1}');

    UploadTask task= pdfFile.putData(file);
    TaskSnapshot snapshot=await task;
    url = await snapshot.ref.getDownloadURL();

    MaterialModel materialModel=MaterialModel(
      title: title,
      url: url,
    );

    if(CashHelper.getData(key: 'type')=='Lectures'){

      if(departmentDropMenu=='General'){
        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('General')
              .doc('grade1').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });

        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('General')
              .doc('grade2').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('General')
              .doc('grade3').collection(userSpecial!).doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('General')
              .doc('grade4').collection(userSpecial!).doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
      }
      else if(departmentDropMenu=='Medical'){
        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade1').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade2').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade3').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade4').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
      }
      else if(departmentDropMenu=='Security'){
        emit(UploadPDFLoadingState());
        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade1').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade2').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade3').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade4').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
      }
      else{
        emit(UploadPDFLoadingState());

        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade1').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade2').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade3').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade4').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
      }

    }
    else{
      if(departmentDropMenu=='General'){
        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('General')
              .doc('grade1').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });

        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('General')
              .doc('grade2').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('General')
              .doc('grade3').collection(userSpecial!).doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('General')
              .doc('grade4').collection(userSpecial!).doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
      }
      else if(departmentDropMenu=='Medical'){
        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade1').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade2').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade3').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('Medical')
              .doc('grade4').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
      }
      else if(departmentDropMenu=='Security'){
        emit(UploadPDFLoadingState());
        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade1').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade2').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade3').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('Security')
              .doc('grade4').collection('Material').doc(title).collection('section').doc('${section.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
      }
      else{
        emit(UploadPDFLoadingState());

        if(gradeDropMenu=='First'){
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade1').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            isUpload=true;
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Second'){
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade2').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else if (gradeDropMenu=='Third'){
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade3').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
        else{
          await FirebaseFirestore.instance.collection('Network')
              .doc('grade4').collection('Material').doc(title).collection('lecture').doc('${lecture.length+1}')
              .set(materialModel.toMap()).then((value) {
            print('Upload Success');
            emit(UploadPDFSuccessState());
          });
        }
      }

    }

    emit(GetPDFState());
  }


  String gradeDropMenu='';
  String departmentDropMenu='';

  void setGradeDrop(value){
    gradeDropMenu=value;
    CashHelper.saveData(key: 'gradeDrop',value: gradeDropMenu);
    emit(SetGradeDropState());
  }


  void setDepartmentDrop(value){
    departmentDropMenu=value;
    CashHelper.saveData(key: 'departmentDrop',value: departmentDropMenu);
    emit(SetDepartmentDropState());
  }



 AnalysisModel ?analysisModel;
  double ?GPA=3.9;
  String? Subject1='B', Subject2='A-', Subject3='C',
          Subject4='B',Subject5='D',Subject6='A-';

  String? subject1Titles='Image', subject2Titles='Compiler', subject3Titles='Network',
      subject4Titles='Automata',subject5Titles='Distributed',subject6Titles='Cloud';

  void postAnalyis(
      {
        required int studentid,
        required int year,
        required String dep,
      }){

    DioHelperAnalysis.postDate(
        url: '',
        data: {
          'studentid':studentid,
          'year':year,
          'dep':dep,
        }
    ).then((value) {

      print(value.data);
      // analysisModel=AnalysisModel.fromJson(value.data);
      // print(analysisModel?.GRADES[0]);
        GPA= double.parse(value.data['GPA']);
        Subject1=value.data['GRADES'][0];
        Subject2=value.data['GRADES'][1];
        Subject3=value.data['GRADES'][2];
        Subject4=value.data['GRADES'][3];
        Subject5=value.data['GRADES'][4];
        Subject6=value.data['GRADES'][5];
        print(value.data['GRADES'][5]);
        subject1Titles=value.data['LABELS'][0];
        subject2Titles=value.data['LABELS'][1];
        subject3Titles=value.data['LABELS'][2];
        subject4Titles=value.data['LABELS'][3];
        subject5Titles=value.data['LABELS'][4];
        subject6Titles=value.data['LABELS'][5];
      emit(PostAnalysisSuccessState());
    }).catchError((error){
      print('Error in postAnalysis is ${error.toString()}');
      emit(PostAnalysisErrorState());
    });

  }

  Map Grades={
    'GPA':3.4,
    'Grade':[
      'A',
      'B+',
      'C-',
      'A+',
      'A+',
    ],
    'Label':[
      'CS',
      'IS',
      'SC',
      'AI',
      'BU',
    ]
  };

  void printAnalysis(){

    print(Grades['Grade'][0]);
  }

  List ?messagesBot=[];

  List ?messagesBotRespond=[];
  var messageController = TextEditingController();

  String ?messageValue;
  void chatBotMessages(String? message){


    messagesBot?.add(message);
    messageValue=message;
    messageController.text='';
    print(messagesBot![0]);
    emit(AddChatBotMessageSuccessState());
  }


  bool ?checkRespond=false;
  List <String> chatBotCourses=[];

  String ?chatBotCourse1,chatBotCourse2,chatBotCourse3;
  String ?typeRespond;

  String ?totalCourses;

  void postChatBot(String question,String courseField){

    checkRespond=false;
    emit(PostChatBotLoadingState());
    DioHelperChatBot.postDate(
        url:'',
        data: {
          "question":question,
          "course_field":courseField
        }
    ).then((value) {


      print(value.data.runtimeType);
      typeRespond='${value.data.runtimeType}';
      if(typeRespond=='String'){
        messagesBotRespond?.add(value.data);
      }
      else{
        chatBotCourse1=value.data[0];
        chatBotCourse2=value.data[1];
        chatBotCourse3=value.data[2];
        totalCourses='1-${value.data[0] } \n \n 2-${value.data[1]}  \n  \n 3-${value.data[2]} ' ;
        messagesBotRespond?.add(totalCourses);
      }
      checkRespond=true;

      emit(PostChatBotSuccessState());
    }).catchError((error){
      print('Error in post ChatBot is ${error.toString()}');
      emit(PostChatBotErrorState());
    });
  }

  String programmingField = '';


  void selectProgrammingField (value)
  {
    programmingField = value ;
    print(value);
    emit(SelectProgrammingFiled());
  }

}