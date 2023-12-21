import 'package:flutter/material.dart';
import 'package:kot/table_icons.dart';

import '../drawerShow.dart';
import '../payment_verification/bill_page.dart';
import '../verify_table/kot_page.dart';
import 'listtile_table_order.dart';

class Tables extends StatefulWidget {
  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //bool selected = false;

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
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            shrinkWrap: true,
            // children: List.generate(1, (index) {
            // return InkWell(
            children: [
              ColorDesign(
                  text: '1',
                  onTap: () {
                    showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Wrap(
                                children: [
                                  ListTile(
                                    title: const Text('Table No.1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: Color(0XFF393939))),
                                    onTap: () {},
                                  ),
                                  ListTileTableOrder(
                                      name: 'View KOTs',
                                      ontap: () {
                                        Navigator.of(context)
                                            .pop(); // Close the success dialog
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const kotnoPage()),
                                        );
                                      }),
                                  const Divider(
                                    height: 7,
                                    color: Colors.grey,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTileTableOrder(
                                      name: 'Move Table', ontap: () {}),
                                  const Divider(
                                    height: 7,
                                    color: Colors.grey,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTileTableOrder(
                                      name: 'Print Bill', ontap: () {}),
                                  const Divider(
                                    height: 7,
                                    color: Colors.grey,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTileTableOrder(
                                      name: 'Print Bill & Take Payment',
                                      ontap: () {
                                        Navigator.of(context)
                                            .pop(); // Close the success dialog
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BillPage()),
                                        );
                                      }),
                                  const Divider(
                                    height: 7,
                                    color: Colors.grey,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTileTableOrder(
                                      name: 'Get Pin', ontap: () {}),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
              CardDesign(text: '2', onTap: () {}),
              CardDesign(text: '3', onTap: () {}),
              CardDesign(text: '4', onTap: () {}),
              CardDesign(text: '5', onTap: () {}),
              CardDesign(text: '6', onTap: () {}),
              CardDesign(text: '7', onTap: () {}),
              CardDesign(text: '8', onTap: () {}),
              CardDesign(text: '9', onTap: () {}),
              CardDesign(text: '10', onTap: () {}),
              CardDesign(text: '11', onTap: () {}),
              CardDesign(text: '12', onTap: () {}),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 140.0, bottom: 10.0),
        child: Container(
          height: 90.0,
          width: 90.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {},
              child: Container(
                width: 60,
                height: 60,
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                        LinearGradient(colors: [Colors.red, Colors.orange])),
              ),
            ),
          ),
        ),
      ),
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
                style: const TextStyle(
                    fontSize: 23.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              child: Icon(
                Icons.add,
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

class ColorDesign extends StatefulWidget {
  ColorDesign({required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  State<ColorDesign> createState() => _ColorDesignState();
}

class _ColorDesignState extends State<ColorDesign> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 45.0),
                  child: Container(
                    child: Text(
                      widget.text,
                      style: const TextStyle(
                          fontSize: 23.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 27.0),
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade400,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(40.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        '..',
                        style: TextStyle(
                          color: Colors.transparent,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            MouseRegion(
              onEnter: (_) => setState(() => isHovering = true),
              onExit: (_) => setState(() => isHovering = false),
              child: Icon(
                TableIcon.group,
                size: 38.0,
                color: isHovering ? Colors.grey : Colors.deepOrange.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
