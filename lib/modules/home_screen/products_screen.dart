import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matgar/item/home_screen_item/product_item.dart';

import '../../item/home_screen_item/details_screen.dart';
import '../../models/product_category.dart';
import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import 'countries_screen.dart';

class ProductsScreen extends StatelessWidget {
  final id;
  ProductsScreen(this.id);
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ShopCubit>(context).getproductbycategorData(id);
          print(1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ShopCubit>(context).getproductbycategorData(id);
    return BlocProvider(
      create: (context) => ShopCubit()..getproductbycategorData(id),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          setupScrollController(context);

          print(1);
          var cubit = ShopCubit.get(context);

          //  cubit.getproductbycategorData(id);
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
      ),
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
      if (state is ShopLoadingProductByCategoryModelState &&
          state.isFirstFetch) {
        return _loadingIndicator();
      }

      List<Item3> posts = [];
      bool isLoading = false;

      if (state is ShopLoadingProductByCategoryModelState) {
        posts = state.oldPosts;
        isLoading = true;
      } else if (state is ShopSuccessProductByCategoryModelState) {
        posts = state.posts;
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20)
                .add(EdgeInsets.only(top: 20, bottom: 10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: "بحث",
                          contentPadding: EdgeInsets.all(12),
                          isDense: true,
                          hintStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'cairo',
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade400.withOpacity(0.6),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        navigatorPush(context, CountriesScreen());
                      },
                      child: Image.asset(
                        "assets/images/uae_icon.png",
                        width: 80,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 18)
                      .add(const EdgeInsets.only(bottom: 20)),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.5,
                    // number of items per row
                    crossAxisCount: 2,
                    // vertical spacing between the items
                    mainAxisSpacing: 0,
                    // horizontal spacing between the items
                    crossAxisSpacing: 20,
                  ),
                  // number of items in your list
                  itemCount: posts.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < posts.length)
                      return ProductItem(posts[index]);
                    else {
                      Timer(Duration(milliseconds: 30), () {
                        scrollController
                            .jumpTo(scrollController.position.maxScrollExtent);
                      });

                      return Container();
                    }
                  }),
            ),
          ),
          state is ShopLoadingProductByCategoryModelState
              ? _loadingIndicator()
              : Text('')
        ],
      );
    });
  }
}






































/*
 Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20).add(EdgeInsets.only(top: 50)),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color:  Color(0xff869B4B),
                    borderRadius: BorderRadius.circular(10),  //Color(0xffea0e8b)
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        "المنتجات",
                        style: GoogleFonts.cairo(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),

                    Tab(
                      child: Text(
                        "فلتر حسب الدولة",
                        style:GoogleFonts.cairo(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),


            Expanded(
              child: TabBarView(
                children: [

                  ProductsTapScreen(),
                  CountriesTapScreen(),

                ],
              ),
            ),
          ],
        ),
 */



/*
GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18)
              .add(EdgeInsets.only(bottom:20)),

          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.5,
            // number of items per row
            crossAxisCount: 2,
            // vertical spacing between the items
            mainAxisSpacing: 0,
            // horizontal spacing between the items
            crossAxisSpacing:15,
          ),
          // number of items in your list
          itemCount: 4,
          itemBuilder: (context, index) {
            return ProductItem();
          }


        ),
 */





























/*
SingleChildScrollView(
          child: ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CardMainDetails();
            },
          ),
        ),
 */