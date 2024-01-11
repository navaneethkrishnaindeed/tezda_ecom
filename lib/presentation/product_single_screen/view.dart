
import 'package:flutter/material.dart';

import '../../application/home/home_controller.dart';
import '../../domain/utils/screen_sizes.dart';

class ProductSingleScreen extends StatefulWidget {
  const ProductSingleScreen({super.key});

  @override
  State<ProductSingleScreen> createState() => _ProductSingleScreenState();
}

class _ProductSingleScreenState extends State<ProductSingleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
              height: ScreenSizes(context).screenHeightFraction(percent: 78),
              child: ValueListenableBuilder(
                valueListenable: HomeController.product,
                builder: (context, value, child) {
                  return  Container(
                        margin: EdgeInsets.all(15),
                        alignment: Alignment.center,
                        
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
                                    value.image.toString())),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text(value.title.toString()),
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
                                      Text(value.category.toString()),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("Price : "),
                                      Text(value.price.toString()),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text("Ratings : "),
                                      Text(
                                          value.rating!.rate.toString()),
                                    ],
                                  ),
                                   const SizedBox(
                                    height: 20,
                                  ),
                                   SizedBox(
                                        child: Text(
                                            value.description.toString()),
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                   
                },
              ),
            )
        ,
    );
  }
}