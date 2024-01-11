import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_ecom/application/home/home_controller.dart';
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
            Container(
              alignment: Alignment.center,
              height: 80,
              child: Text(
                "TEZDA",
                style: GoogleFonts.aboreto(fontSize: 36),
              ),
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
                      return Container(
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
                      );
                    },
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: ScreenSizes(context).screenHeightFraction(percent: 50),
            //   child: ValueListenableBuilder(
            //     valueListenable: HomeController.products,
            //     builder: (context, value, child) {
            //       return ListView.builder(
            //         itemBuilder: (context, index) {
            //           return Container();
            //         },
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
