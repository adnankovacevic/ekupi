import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kupro/components/discount_card.dart';
import 'package:kupro/components/new_arrivals_card.dart';
import 'package:kupro/data/model/discount.dart';
import 'package:kupro/data/model/product.dart';
import 'package:kupro/res/app_colors.dart';
import 'package:kupro/res/app_text_style.dart';
import 'package:kupro/views/bottom_navigation/bottom_navigation_view.dart';
import 'package:kupro/views/home/components/search_view.dart';
import 'package:kupro/views/settings/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 82),
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.blue),
                      child: Icon(
                        Icons.menu_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const SettingsScreen(),
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            transitionsBuilder: (_, a, __, c) =>
                                FadeTransition(opacity: a, child: c),
                          ),
                        );
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.blue),
                        child: Icon(
                          Icons.person_2,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SearchView(),
                          Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blue,
                            ),
                            child: Icon(
                              CupertinoIcons.slider_horizontal_3,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                        items: [
                          FutureBuilder<List<Discount>>(
                            future: loadDiscounts(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error loading discounts');
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return Text('No discounts available');
                              } else {
                                return Column(
                                  children: snapshot.data!.map((discount) {
                                    return DiscountCard(
                                      storeName: discount.storeName,
                                      discountAmount: discount.discountPercent,
                                      discountCode: discount.discountCode,
                                    );
                                  }).toList(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'New Arrivals',
                              style: AppTextStyle().poppins14Black700,
                            ),
                            Text(
                              'View All',
                              style: AppTextStyle().poppins10Blue500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        child: FutureBuilder<List<Product>>(
                          future: loadProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text(
                                  'Error loading products ${snapshot.error}');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return Text('No products available');
                            } else {
                              return GridView.count(
                                crossAxisCount: 2,
                                children: snapshot.data!.map((product) {
                                  return NewArrivalsCard(
                                    brandName: product.brandName,
                                    productName: product.productName,
                                    productPrice: product.productPrice,
                                    productImage: product.productImage,
                                  );
                                }).toList(),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationView(),
        ),
      ),
    );
  }
}
