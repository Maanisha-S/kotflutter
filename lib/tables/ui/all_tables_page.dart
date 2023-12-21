import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kot/drawerShow.dart';
import 'package:kot/table_icons.dart';
import 'package:kot/item/items.dart';
import 'package:http/http.dart' as http;
import 'package:kot/tables/data/GetTableResponseData.dart' as RestaurantTable;

import '../../custom_icons.dart';
import 'package:hover/hover.dart';

import '../data/GetTableResponseData.dart';

enum AllTableState { initial, loading, failed, success }

class FirstTables extends StatefulWidget {
  static String? selectedTableNo;
  static int? selectedTableId;
  @override
  State<FirstTables> createState() => _TablesState();
}

class _TablesState extends State<FirstTables> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //bool selected = false;
  List<RestaurantTable.Table> tableList = [];
  AllTableState allTableState = AllTableState.initial;

  @override
  void initState() {
    getTableData();
    super.initState();
  }

  // void table() async {
  //   try {
  //     Response response = await get(
  //       Uri.parse('http://respos.vinsupinfotech.com/public/api/get_table'),
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
  Future getTableData() async {
    setState(() {
      allTableState = AllTableState.initial;
    });
    try {
      // setState(() {
      //   allTableState = AllTableState.loading;
      // });
      String url = 'https://respos.vinsupinfotech.com/public/api/get_table';
      http.Response getTableResponse = await http.get(Uri.parse(url), headers: {
        "Authorization":
            "Bearer 47|4CGAIErH3pAALc1VIfnbXUfY4SmNh0pLy89mxiKf1c4a2914"
      });
      debugPrint(
          'getTableResponse = ${getTableResponse.statusCode}-${getTableResponse.body}');
      dynamic responseData = json.decode(getTableResponse.body);
      GetTableResponseData getTableResponseData =
          GetTableResponseData.fromJson(responseData);

      setState(() {
        tableList = getTableResponseData.table ?? [];
        allTableState = AllTableState.success;
      });
      debugPrint('Api call success');
    } catch (e) {
      debugPrint(e.toString());

      setState(() {
        allTableState = AllTableState.failed;
      });
    }
  }

  Widget buildTableStateWidget() {
    switch (allTableState) {
      case AllTableState.initial:
        return Text("Welcome");
      case AllTableState.loading:
        return CircularProgressIndicator();
      case AllTableState.success:
        return GridView.builder(
          shrinkWrap: true,
          itemCount: tableList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CardDesign(
                text: tableList[index].tableNo.toString(),
                onTap: () {
                  setState(() {
                    FirstTables.selectedTableNo = tableList[index].tableNo;
                    FirstTables.selectedTableId = tableList[index].id as int?;
                  });
                  debugPrint('${FirstTables.selectedTableNo}');
                  debugPrint('${FirstTables.selectedTableId}');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ItemList(),
                    ),
                  );
                });
          },
        );
      case AllTableState.failed:
        return Text("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Image.asset('images/vinsup logo.png'),
                ],
              ),
            ),
            const Divider(
              thickness: 3.0,
            ),
            const SizedBox(
              height: 30.0,
            ),
            DrawerList(text: 'New KOT'),
            DrawerList(text: 'Contact Less'),
            DrawerList(text: 'Unsuccessful KOT'),
            DrawerList(text: 'Pending Bill'),
            DrawerList(text: 'Update Menu'),
            DrawerList(text: 'Sync Data'),
            DrawerList(text: 'Settings'),
            DrawerList(text: 'Reset Sync Code'),
            DrawerList(text: 'Find Server IP'),
            DrawerList(text: 'Logout'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5.0,
        toolbarHeight: 100,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.sort),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          'All Tables',
          style: TextStyle(
            fontSize: 25.0,
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
              bottom: Radius.circular(30.0),
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
              size: 30.0,
              Icons.fastfood,
              //CustomIcon.group_9528,
              //FontAwesomeIcons.bowlRice,
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
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: buildTableStateWidget(),
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(right: 140.0, bottom: 10.0),
      //   child: Container(
      //     height: 90.0,
      //     width: 90.0,
      //     child: FittedBox(
      //       child: FloatingActionButton(
      //         onPressed: () {},
      //         child: Container(
      //           width: 60,
      //           height: 60,
      //           child: Icon(
      //             Icons.add,
      //             size: 40,
      //           ),
      //           decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //               gradient:
      //                   LinearGradient(colors: [Colors.red, Colors.orange])),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class CardDesign extends StatefulWidget {
  CardDesign({required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  State<CardDesign> createState() => _CardDesignState();
}

class _CardDesignState extends State<CardDesign> {
  //final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  //final hoverTransform = Matrix4.identity()..translate(0, -10, 0);
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            /* OnHoverButton(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      TableIcon.group,
                      size: 35.0,
                      color: Colors.grey,
                    ),
                  ),
                )*/

            MouseRegion(
              /*onHover: (val) {
                  setState(() {
                    isHovering = true;
                  });
                },*/

              /* onEnter: (a) {
                  setState(() {
                    isHovering = true;
                  });
                },
                onExit: (a) {
                  setState(() {
                    isHovering = false;
                  });
                },*/
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              child: Icon(
                TableIcon.group,
                size: 38.0,
                color: isHovering ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class HoverIcon extends StatefulWidget {
  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isHovered = true;
      }),
      onExit: (_) => setState(() => _isHovered = false),
      child: Icon(
        _isHovered ? Icons.favorite : Icons.favorite_border,
        size: 50.0,
        color: _isHovered ? Colors.red : Colors.black,
      ),
    );
  }
}*/

/*class OnHoverButton extends StatefulWidget {
  final Widget child;
  const OnHoverButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()
      // ..translate(8, 0, 0)
      ..scale(1.1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
        //cursor: SystemMouseCursors.click,
        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        child: AnimatedContainer(
            curve: Sprung.overDamped,
            duration: Duration(milliseconds: 200),
            transform: transform,
            child: widget.child));
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}*/
