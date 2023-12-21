import 'dart:convert';

import 'package:flutter/material.dart';
import '../../verify_table/table_verify.dart';

import '../tables/ui/all_tables_page.dart';
import 'data/GetCategoryResponseData.dart';
import 'data/GetItemResponseData1.dart';
import 'ink_well_box.dart';
import 'package:http/http.dart' as http;
// import 'dart:math' as math;

enum AllCategoryState { Initial, Loading, Failed, Success }

bool isExpanded = false;

class ItemList extends StatefulWidget {
  static Map<String, int> selectedItemsMap = {};

  // static Map<String, int> selectedItemsMap = {};
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  AllCategoryState allCategoryState = AllCategoryState.Success;
  List<Category> categoryList = [];

  // String categoryId = Category.id.toString();
  int? selectedCategoryId;

  String? selectedCategoryName;
  num? selectedItemId;
  List<List<String>> listsData = [
    ['Item 1', 'Item 2', 'Item 3'],
    ['Item A', 'Item B', 'Item C', 'Item D'],
    ['Item X', 'Item Y', 'Item Z'],
    ['Item P', 'Item Q', 'Item R'],
    ['Item M', 'Item N', 'Item O'],
  ];
  @override
  void initState() {
    super.initState();
    getCategoryData();
  }

  List<ItemData> itemDataList = [];
  Future getItemData() async {
    try {
      String url =
          'https://respos.vinsupinfotech.com/public/api/get_item/$selectedCategoryId';
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "Bearer 79|MDomZ0DpDd7K5iPm9Go4XjMvsp9kEuRgBCzAdT1H84095f41"
      });
      dynamic responseData = json.decode(response.body);
      GetItemResponseData1 getItemResponseData1 =
          GetItemResponseData1.fromJson(responseData);
      setState(() {
        itemDataList = getItemResponseData1.itemData ?? [];
        // allCategoryState = AllCategoryState.Success;
      });

      // showDialogCustom();
      debugPrint('Itemlist Api call success');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future getCategoryData() async {
    try {
      String url = 'https://respos.vinsupinfotech.com/public/api/get_category';
      http.Response response = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "Bearer 79|MDomZ0DpDd7K5iPm9Go4XjMvsp9kEuRgBCzAdT1H84095f41"
      });
      dynamic responseData = json.decode(response.body);
      GetCategoryResponseData getCategoryResponseData =
          GetCategoryResponseData.fromJson(responseData);
      setState(() {
        categoryList = getCategoryResponseData.category ?? [];

        // allCategoryState = AllCategoryState.Success;
      });
      showDialogCustom();
      debugPrint('category Api call success');
    } catch (e) {
      setState(() {
        allCategoryState = AllCategoryState.Failed;
      });
      debugPrint(e.toString());
    }
  }

  // Widget buildSelectedItemsList() {
  //   return Container(
  //     margin: const EdgeInsets.all(20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           'Selected Items:',
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         ListView.builder(
  //           shrinkWrap: true,
  //           itemCount: selectedItemsMap.length,
  //           itemBuilder: (context, index) {
  //             final itemName = selectedItemsMap.keys.toList()[index];
  //             final itemCount = selectedItemsMap[itemName];
  //
  //             return ListTile(
  //               title: Text('$itemName x$itemCount'),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //   // Use ListView.builder to build the list
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5.0,
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(
            Icons.sort,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Items (Table No : ${FirstTables.selectedTableNo} )',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[Colors.red, Colors.orange],
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(26.0),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.fastfood,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                margin: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          selectedCategoryName ?? "None",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 27.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: itemDataList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedItemId = itemDataList[index].id;
                        print("Selected Item ID: $selectedItemId");
                      });
                      // Accessing the 'id' field of the selected ItemData
                    },
                    child: ItemMenuWidget(
                      rupees: itemDataList[index].price.toString(),
                      pName: itemDataList[index].itemName.toString(),
                    ),
                  );
                },
              ),
            ),
            // GridViewDesign(),
          ],
        ),
      ),
      bottomNavigationBar: const BlackBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogCustom();
        },
        tooltip: 'Center FAB',
        backgroundColor: Colors.white,
        child: const Icon(Icons.arrow_upward, size: 35, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showDialogCustom() {
    showModalBottomSheet<dynamic>(
      constraints: BoxConstraints.loose(
        Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.65,
        ),
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      isDismissible: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 70.0),
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(
              color: Colors.orange,
              width: 4,
            ),
          ),
          child: ListView.builder(
            itemBuilder: (_, pos) {
              return ListTile(
                title: Text(
                  "${categoryList[pos].categoryName}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  setState(() {
                    selectedCategoryId = categoryList[pos].id as int?;
                    selectedCategoryName = categoryList[pos].categoryName;
                    debugPrint("$selectedCategoryId");
                  });
                  Navigator.of(context).pop();
                  getItemData();
                },
              );
            },
            itemCount: categoryList.length,
          ),
        );
      },
    );
  }
}

class BlackBottomNavBar extends StatelessWidget {
  const BlackBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black, // Set the background color to black
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            child: const Text('No items | 0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                )),
            onPressed: () {
              // Handle home button press
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const VerifyTables(),
                    ),
                  );
                },
                child: const Text('View Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward,
                    size: 18, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const VerifyTables(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListTileName extends StatelessWidget {
  late String name;
  final void Function() ontap;

  ListTileName({super.key, required this.name, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
      ),
    );
  }
}

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 7,
      color: Colors.grey,
      thickness: 2,
      indent: 10,
      endIndent: 10,
    );
  }
}
