import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matgar/models/product_category.dart';
import 'package:matgar/models/product_details_model.dart';

import 'package:matgar/shared/cubit/states.dart';

import '../../item/login_screen_item/country_picker.dart';
import '../../models/ads_model.dart';
import '../../models/category_model.dart';
import '../../models/change_password_model.dart';
import '../../models/country_model.dart';
import '../../models/home_model.dart';
import '../../models/login_model.dart';
import '../../modules/home_screen/home_screen.dart';
import '../../modules/notification_screen/notification_screen.dart';
import '../../modules/post_data/post_data.dart';
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
    const PostData(),
    const NotificationScreen(),
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

  //// Get Ads////

  AdsModel? adsModel;
  void getAdsData() {
    emit(ShopLoadingAdsDataState());
    DioHelper.getData(
      url: ADS,
      //   token: token,
    ).then((value) {
      adsModel = AdsModel.fromJson(value.data);
      print(adsModel!.data!.item!.length);
      print('length the data');
      emit(ShopSuccessAdsDataState());
    }).catchError((error) {
      emit(ShopErrorAdsDataState(error.toString()));
      print(error.toString());
    });
  }

  /////////////////////////////////////////
  /// get Category

  CategoryModel? categoryModel;
  void getCategoryData() {
    emit(ShopLoadingCategoryDataState());
    DioHelper.getData(
      url: CATEGORY,
      //   token: token,
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);

      emit(ShopSuccessCategoryDataState());
    }).catchError((error) {
      emit(ShopErrorCategoryDataState(error.toString()));
      // ignore: avoid_print
      print(error.toString());
    });
  }

////////////////////       ProductByCategory
  ProductByCategoryModel? productbycategorymodel;
  int PageProductByCategory = 1;

  void getproductbycategorData(int id) {
    if (state is ShopLoadingProductByCategoryModelState) return;
    final currentState = state;
    var oldPosts = <Item3>[];
    if (currentState is ShopSuccessProductByCategoryModelState) {
      oldPosts = currentState.posts;
    }

    emit(ShopLoadingProductByCategoryModelState(oldPosts,
        isFirstFetch: PageProductByCategory == 1));

    DioHelper.getData(
      url: 'categories/$id?page=$PageProductByCategory',
      //   token: token,
    ).then((value) {
      PageProductByCategory++;
      final posts = (state as ShopLoadingProductByCategoryModelState).oldPosts;

      productbycategorymodel = ProductByCategoryModel.fromJson(value.data);
      posts.addAll(productbycategorymodel!.data!.data!);
      print(value.data);
      print(PageProductByCategory);
      emit(ShopSuccessProductByCategoryModelState(posts));
    }).catchError((error) {
      emit(ShopErrorProductByCategoryModelState(error.toString()));
      // ignore: avoid_print
      print(error.toString());
    });
  }

  ////////////////////       ProductDetails
  ProductDetailsModel? productdetailsmodel;
  void getproductdetailsData(int id) {
    emit(ShopLoadingProductDetailslState());
    DioHelper.getData(
      url: 'product/$id',
      //   token: token,
    ).then((value) {
      productdetailsmodel = ProductDetailsModel.fromJson(value.data);

      emit(ShopSuccessProductDetailsState());
    }).catchError((error) {
      emit(ShopErrorProductDetailsState(error.toString()));
      // ignore: avoid_print
      print(error.toString());
    });
  }

  MyCountryModel? countrymodel;
  int page = 1;

  void getCountryData() {
    if (state is ShopLoadingCountryDataState) return;
    final currentState = state;
    var oldPosts = <DataCountry>[];
    if (currentState is ShopSuccessCountryDataState) {
      oldPosts = currentState.posts;
    }

    emit(ShopLoadingCountryDataState(oldPosts, isFirstFetch: page == 1));
    DioHelper.getData(
      url: 'countries?page=$page',
      //   token: token,
    ).then((value) {
      page++;
      final posts = (state as ShopLoadingCountryDataState).oldPosts;

      countrymodel = MyCountryModel.fromJson(value.data);
      posts.addAll(countrymodel!.data!.data!);

      emit(ShopSuccessCountryDataState(posts));
    }).catchError((error) {
      emit(ShopErrorCountryDataState(error.toString()));
      // ignore: avoid_print
      print(error.toString());
    });
  }
}
