import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matgar/layout/home_layout.dart';
import 'package:matgar/shared/cubit/states.dart';

import '../../models/change_password_model.dart';
import '../../models/home_model.dart';
import '../../models/login_model.dart';
import '../../modules/home_screen/home_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../components/constants.dart';
import '../network/end_points.dart';
import '../network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState(error.toString()));
      print(error.toString());
    });
  }

  LoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingGetUserDataState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = LoginModel.fromJson(value.data);
      emit(ShopSuccessGetUserDataState());
    }).catchError((error) {
      emit(ShopErrorGetUserDataState(error.toString()));
      print(error.toString());
    });
  }

  void updateUserFullName(
      {required String name, required email, required phone, required image}) {
    emit(ShopLoadingUpdateUserState());
    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'image': image
    }).then((value) {
      userModel = LoginModel.fromJson(value.data);
      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      emit(ShopErrorUpdateUserState(error.toString()));
      print(error.toString());
    });
  }

///////////////

  int bottomNavBarCurrentIndex = 0;

  List<Widget> bottomNavBarScreens = [
    HomeScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];

  Widget chooseBotNavBarScreen(int index) {
    return bottomNavBarScreens[index];
  }

  void changeBottomNavBarCurrentIndex(int index) {
    bottomNavBarCurrentIndex = index;
    emit(ChangeBottomNavState(bottomNavBarCurrentIndex));
  }

  ChangePasswordModel? changePasswordModel;

  void changePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    emit(ShopLoadingChangePasswordState());
    DioHelper.postData(
      url: CHANGE_PASSWORD,
      token: token,
      data: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
    ).then((value) {
      changePasswordModel = ChangePasswordModel.fromJson(value.data);
      print('=======================================');
      print(value.data);
      print('=======================================');
      emit(ShopSuccessChangePasswordState(changePasswordModel!));
    }).catchError((error) {
      emit(ShopErrorChangePasswordState(error.toString()));
      print(error.toString());
    });
  }
}
