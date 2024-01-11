import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_ecom/application/home/home_controller.dart';
import 'package:tezda_ecom/domain/routes/routes.dart';
import 'package:tezda_ecom/domain/utils/screen_sizes.dart';

import '../../application/home/categories/cubit/category_cubit.dart';
import '../../application/home/products/cubit/products_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsCubit productCubitInstance = ProductsCubit();
  CategoryCubit categoryCubitInstance = CategoryCubit();
  @override
  void initState() {
    // productCubitInstance.getAllProducts();
    categoryCubitInstance.getCategoryList();
    productCubitInstance.getAllProducts();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: ScreenSizes(context).screenWidth(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: SizedBox(
                    width: 60,
                    child: Icon(Icons.power_settings_new_rounded),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 80,
                  child: Text(
                    "TEZDA",
                    style: GoogleFonts.aboreto(fontSize: 36),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 60,
                ),
              ],
            ),
            SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 7),
              child: ValueListenableBuilder(
                valueListenable: HomeController.categories,
                builder: (context, value, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          productCubitInstance.getProductsByCategoryID(
                              category_ID: value[index]);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(4),
                          padding: EdgeInsets.all(2),
                          width: ScreenSizes(context)
                              .screenWidthFraction(percent: 32),
                          decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            value[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 78),
              child: ValueListenableBuilder(
                valueListenable: HomeController.products,
                builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          productCubitInstance.getSingleProduct(
                              product_ID: value[index].id.toString());
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.of(context)
                              .pushNamed(RoutePath.productSingleScreen);
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange),
                              borderRadius: BorderRadius.circular(16)),
                          height: ScreenSizes(context)
                              .screenHeightFraction(percent: 38),
                          width: ScreenSizes(context)
                              .screenWidthFraction(percent: 95),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: ScreenSizes(context)
                                      .screenWidthFraction(percent: 94),
                                  height: ScreenSizes(context)
                                      .screenHeightFraction(percent: 18),
                                  child: Image.network(
                                      value[index].image.toString())),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(value[index].title.toString()),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Category : "),
                                        Text(value[index].category.toString()),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("Price : "),
                                        Text(value[index].price.toString()),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text("Ratings : "),
                                        Text(value[index]
                                            .rating!
                                            .rate
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
