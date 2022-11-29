import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../item/detail_screen_item/country_item.dart';
import '../../models/country_model.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class CountriesScreen extends StatelessWidget {
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ShopCubit>(context).getCountryData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<ShopCubit>(context).getCountryData();

    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff869B4B),
                centerTitle: true,
                title: Text(
                  "الأبقار",
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              body: _CountryList()),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _CountryList() {
    return BlocBuilder<ShopCubit, ShopStates>(builder: (context, state) {
      if (state is ShopLoadingCountryDataState && state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<DataCountry> posts = [];
      bool isLoading = false;

      if (state is ShopLoadingCountryDataState) {
        posts = state.oldPosts;
        isLoading = true;
      } else if (state is ShopSuccessCountryDataState) {
        posts = state.posts;
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30)
                .add(EdgeInsets.only(top: 20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "اختر الدولة : ",
                  style: GoogleFonts.cairo(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                controller: scrollController,

                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .add(const EdgeInsets.only(top: 20)),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.9,
                  // number of items per row
                  crossAxisCount: 3,
                  // vertical spacing between the items
                  mainAxisSpacing: 20,
                  // horizontal spacing between the items
                  crossAxisSpacing: 15,
                ),
                // number of items in your list
                itemCount: posts.length + (isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < posts.length)
                    return CountryItem(posts[index]);
                  else {
                    Timer(Duration(milliseconds: 30), () {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });

                    return _loadingIndicator();
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .add(EdgeInsets.only(bottom: 10, top: 20)),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff869B4B),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "تأكيد",
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
