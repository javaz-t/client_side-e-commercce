import 'package:client_side/controller/home_page_controller.dart';
import 'package:client_side/pages/login_page.dart';
import 'package:client_side/widgets/droup_down.dart';
import 'package:client_side/widgets/select_droup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String url =
        'https://www.shoevariety.com/cdn/shop/products/71nx3HmXMtL._AC_UL1500_grande.jpg?v=1607459007';
    return GetBuilder<HomePageController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Footware Store'),
            actions: [
              IconButton(
                  onPressed: () {
                    GetStorage box = GetStorage();
                    box.erase();
                    Get.offAll(LoginPage());
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60, // Adjust this value as needed
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.categoryList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.all(10.0),
                          child: InkWell(
                              onTap: () {
                                ctrl.filterByCategory(
                                    ctrl.categoryList[index].name ?? "");
                                print(ctrl.categoryList[index].name ?? "");
                              },
                              child: Chip(
                                label: Text(
                                    ctrl.categoryList[index].name ?? "Error"),
                              )));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: SelectedDruoDown(
                      items: ['Puma', 'Nike','Adidas'],
                      onSelectionChanged: (selectedItems) {
                        print(selectedItems);
                        ctrl.filterByBrand(selectedItems);
                      },
                    )),
                    Expanded(
                        child: DroupDown(iteams: [
                      'Low to High',
                      'High to Low ',
                    ], title: 'Sort Iteams', onSelected: (selected) {
                          print(selected);
                        bool selectedIsAccending = selected=='Low to High'? true:false;
                        ctrl.sortByPrice(selectedIsAccending);
                        })),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: ctrl.productsShowInUI.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 8,
                            mainAxisSpacing:
                                8), // SliverGridDelegateWithFixedCrossAxisCount
                    itemBuilder: (context, index) {
                      return ProductDetails(
                        name: ctrl.productsShowInUI[index].name,
                        offer: '20%',
                        onTab: () {},
                        price: ctrl.productsShowInUI[index].price.toString(),
                        url: ctrl.productsShowInUI[index].imageUrl,
                      ); // Container
                    },
                  ), // GridView.builder
                ),
                // Other widgets go here
              ],
            ),
          ),
        ),
      );
    });
  }
}
