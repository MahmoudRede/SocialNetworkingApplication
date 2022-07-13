import 'package:final_project/constants/componts.dart';
import 'package:final_project/constants/constants.dart';
import 'package:final_project/layoutes/homepage/home_bloc/app_cubit.dart';
import 'package:final_project/models/userModel/user_model.dart';
import 'package:final_project/modules/register/registercubit/bloc.dart';
import 'package:final_project/modules/register/registercubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit()..getUserData(),
      child: BlocConsumer <RegisterCubit , RegisterStates>(
        listener: (context , state){},
        builder: (context , state){
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: mainColorLayout,
              title: const Text(
                'Edit User Data'
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Form(
                  key: cubit.settingFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children:  [
                              CircleAvatar(
                                backgroundImage: cubit.profile,
                                radius: 80.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                child: InkWell(
                                  onTap: (){
                                    cubit.getProfileImage();
                                  },
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20.0,
                                      ),
                                      Container(
                                        width: 35.0,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        child: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0 ,),
                            height: MediaQuery.of(context).size.height * 0.09,
                            width: MediaQuery.of(context).size.width * 1,
                            child: dafaultFormField(
                              label: 'Full Name',
                              icon: const Icon(
                                LineIcons.user,
                                color: Colors.black,
                              ),
                              controller: cubit.updateNameController,
                              textInputType: TextInputType.name,
                              textValidator: 'Please, enter your name',
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.012,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0 ,vertical: 5.0),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 1,
                            child: dafaultFormField(
                              label: 'Bio',
                              icon: const Icon(
                                LineIcons.bookmark,
                                color: Colors.black,
                              ),
                              controller: cubit.updateBioController,
                              textInputType: TextInputType.name,
                              textValidator: 'Please, enter your Bio',
                            ),
                          ),  // Bio form field
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0 ,),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: DropdownButton(
                                dropdownColor: Colors.grey[300],
                                elevation: 0,
                                hint: RegisterCubit.get(context).dropDownValue1.isEmpty
                                    ? const Text('Grade', style: TextStyle(color: Colors.black, fontSize: 16.0 , fontWeight: FontWeight.bold),)
                                    : Text(
                                  RegisterCubit.get(context).dropDownValue1,
                                  style: const TextStyle(color: Colors.black , fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: const TextStyle(color: Colors.black , fontSize: 16.0 , fontWeight: FontWeight.bold),
                                items: ['First', 'Second', 'Third' , 'Fourth'].map(
                                      (value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) {
                                  RegisterCubit.get(context).changeDropDownValue1(value);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          cubit.checkRegister==false?
                          const Center(
                            child: CircularProgressIndicator(),
                          ):
                          Container(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              height: MediaQuery.of(context).size.height * .063,
                              width: MediaQuery.of(context).size.width * .60,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: mainColorButton,
                                child: const Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: (){
                                  UserModel userData = UserModel(
                                    uId: cubit.userModel!.uId,
                                    department: cubit.userModel!.department,
                                    email: cubit.userModel!.email,
                                    isDoctor: cubit.userModel!.isDoctor,
                                    specialist: cubit.userModel!.specialist,
                                    startAt: cubit.userModel!.startAt,
                                    username: cubit.userModel!.username,
                                    fullName: cubit.updateNameController == null ? cubit.userModel!.fullName : cubit.updateNameController.text,
                                    bio: cubit.updateBioController == null ? cubit.userModel!.bio : cubit.updateBioController.text,
                                    grade: cubit.dropDownValue1 == null ? cubit.userModel!.grade : cubit.dropDownValue1,
                                    image: cubit.userModel!.image,
                                  );
                                  cubit.updateUserData(model: userData);
                                },
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
