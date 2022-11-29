import '../../models/change_password_model.dart';
import '../../models/country_model.dart';
import '../../models/login_model.dart';
import '../../models/product_category.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}

class ShopChangeModeState extends ShopStates {}

class ShopLoadingHomeDataState extends ShopStates {}

class ShopSuccessHomeDataState extends ShopStates {}

class ShopErrorHomeDataState extends ShopStates {
  final String error;

  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoriesState extends ShopStates {}

class ShopErrorCategoriesState extends ShopStates {
  final String error;

  ShopErrorCategoriesState(this.error);
}

class ShopSuccessChangeFavoritesState extends ShopStates {}

class ShopErrorChangeFavoritesState extends ShopStates {
  final String error;

  ShopErrorChangeFavoritesState(this.error);
}

class ShopSuccessGetFavoritesState extends ShopStates {}

class ShopLoadingGetFavoritesState extends ShopStates {}

class ShopErrorGetFavoritesState extends ShopStates {
  final String error;

  ShopErrorGetFavoritesState(this.error);
}

class ShopSuccessGetUserDataState extends ShopStates {}

class ShopLoadingGetUserDataState extends ShopStates {}

class ShopErrorGetUserDataState extends ShopStates {
  final String error;

  ShopErrorGetUserDataState(this.error);
}

class ShopSuccessUpdateUserState extends ShopStates {
  final LoginModel userData;

  ShopSuccessUpdateUserState(this.userData);
}

class ShopLoadingUpdateUserState extends ShopStates {}

class ShopErrorUpdateUserState extends ShopStates {
  final String error;

  ShopErrorUpdateUserState(this.error);
}

class OpenDrawerState extends ShopStates {}

class CloseDrawerState extends ShopStates {}

class ShopProfileImagePickedSuccessState extends ShopStates {}

class ShopProfileImagePickedErrorState extends ShopStates {}

class ShopOnPageChangeState extends ShopStates {}

class ShopLoadingGetProductDetailsState extends ShopStates {}

class ShopSuccessGetProductDetailsState extends ShopStates {}

class ShopErrorGetProductDetailsState extends ShopStates {
  final String error;

  ShopErrorGetProductDetailsState(this.error);
}

class ShopSuccessAddAndRemoveFromCartState extends ShopStates {}

class ShopErrorAddAndRemoveFromCartState extends ShopStates {
  final String error;

  ShopErrorAddAndRemoveFromCartState(this.error);
}

class ShopSuccessAddQuantityState extends ShopStates {}

class ShopErrorAddQuantityState extends ShopStates {
  final String error;

  ShopErrorAddQuantityState(this.error);
}

class ShopSuccessGetCartsState extends ShopStates {}

class ShopLoadingGetCartsState extends ShopStates {}

class ShopErrorGetCartsState extends ShopStates {
  final String error;

  ShopErrorGetCartsState(this.error);
}

class ShopLoadingAddAddressState extends ShopStates {}

class ShopSuccessAddAddressState extends ShopStates {}

class ShopErrorAddAddressState extends ShopStates {
  final String error;

  ShopErrorAddAddressState(this.error);
}

class ShopLoadingAddOrderState extends ShopStates {}

class ShopSuccessAddOrderState extends ShopStates {}

class ShopErrorAddOrderState extends ShopStates {
  final String error;

  ShopErrorAddOrderState(this.error);
}

class ShopLoadingGetFAQsState extends ShopStates {}

class ShopSuccessGetFAQsState extends ShopStates {}

class ShopErrorGetFAQsState extends ShopStates {
  final String error;

  ShopErrorGetFAQsState(this.error);
}

class ShopChangeExpansionIconState extends ShopStates {}

class ShopLoadingGetOrdersState extends ShopStates {}

class ShopSuccessGetOrdersState extends ShopStates {}

class ShopErrorGetOrdersState extends ShopStates {
  final String error;

  ShopErrorGetOrdersState(this.error);
}

class ShopSuccessCancelOrderState extends ShopStates {}

class ShopErrorCancelOrderState extends ShopStates {}

class ShopChangePasswordVisibility1State extends ShopStates {}

class ShopChangePasswordVisibility2State extends ShopStates {}

class ShopLoadingChangePasswordState extends ShopStates {}

class ShopSuccessChangePasswordState extends ShopStates {
  final ChangePasswordModel changePasswordModel;
  ShopSuccessChangePasswordState(this.changePasswordModel);
}

class ShopErrorChangePasswordState extends ShopStates {
  final String error;

  ShopErrorChangePasswordState(this.error);
}

class ShopLoadingSearchState extends ShopStates {}

class ShopSuccessSearchState extends ShopStates {}

class ShopErrorSearchState extends ShopStates {
  final error;
  ShopErrorSearchState(this.error);
}

class ChangeBottomNavState extends ShopStates {
  // ignore: prefer_typing_uninitialized_variables
  final index;

  ChangeBottomNavState(this.index);
}

//////////////////////// ads////////////////////

class ShopLoadingAdsDataState extends ShopStates {}

class ShopSuccessAdsDataState extends ShopStates {}

class ShopErrorAdsDataState extends ShopStates {
  final String error;

  ShopErrorAdsDataState(this.error);
}

//////////////////////// Category////////////////////

class ShopLoadingCategoryDataState extends ShopStates {}

class ShopSuccessCategoryDataState extends ShopStates {}

class ShopErrorCategoryDataState extends ShopStates {
  final String error;

  ShopErrorCategoryDataState(this.error);
}

//////////////ProductByCategoryModel
class ShopLoadingProductByCategoryModelState extends ShopStates {
  final List<Item3> oldPosts;
  final bool isFirstFetch;

  ShopLoadingProductByCategoryModelState(this.oldPosts,
      {this.isFirstFetch = false});
}

class ShopSuccessProductByCategoryModelState extends ShopStates {
  final List<Item3> posts;

  ShopSuccessProductByCategoryModelState(this.posts);
}

class ShopErrorProductByCategoryModelState extends ShopStates {
  final String error;

  ShopErrorProductByCategoryModelState(this.error);
}

////////////// ProductDetailsModel
class ShopLoadingProductDetailslState extends ShopStates {}

class ShopSuccessProductDetailsState extends ShopStates {}

class ShopErrorProductDetailsState extends ShopStates {
  final String error;

  ShopErrorProductDetailsState(this.error);
}

//////////////////////// Country////////////////////

class ShopLoadingCountryDataState extends ShopStates {
  final List<DataCountry> oldPosts;
  final bool isFirstFetch;

  ShopLoadingCountryDataState(this.oldPosts, {this.isFirstFetch = false});
}

class ShopSuccessCountryDataState extends ShopStates {
  final List<DataCountry> posts;

  ShopSuccessCountryDataState(this.posts);
}

class ShopErrorCountryDataState extends ShopStates {
  final String error;

  ShopErrorCountryDataState(this.error);
}
