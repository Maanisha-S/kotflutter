import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kot/verify_table/table_verify.dart';
import 'package:http/http.dart' as http;
import '../item/items.dart';
import '../table_engaged/table.dart';
import '../tables/ui/all_tables_page.dart';
import 'drawer.dart';

class VerifyTables extends StatefulWidget {
  const VerifyTables({super.key});

  @override
  State<VerifyTables> createState() => _VerifyTablesState();
}

class _VerifyTablesState extends State<VerifyTables> {
  TextEditingController tableController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController totalController = TextEditingController();

  void postOrder(String contactNumber, name) async {
    try {
      http.Response response = await post(
          Uri.parse('https://respos.vinsupinfotech.com/public/api/get_order'),
          body: {
            "table_id": FirstTables.selectedTableId,
            "customer_name": name,
            "customer_contact": contactNumber,
            'submition':
                '[{"item_id": "1","item_name": "test","item_price": "40","item_quantity": "4","command": "test"},{"item_id": "2","item_name": "test","item_price": "20","item_quantity": "10","command": "test-2"}]',
          });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      tableController =
          new TextEditingController(text: FirstTables.selectedTableNo);
    });
    super.initState();
  }

  int _counter = 0;
  final int _minValue = -10;
  final int _maxValue = 10;

  void _incrementCounter() {
    setState(() {
      if (_counter < _maxValue) {
        _counter++;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > _minValue) {
        _counter--;
      }
    });
  }

  void clearText() {
    tableController;
    nameController;
    contactController;
    totalController;
  }

  bool printKOT = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5.0,
        toolbarHeight: 120,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back, size: 30),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ItemList();
            })),
          ),
        ),
        title: Text(
          'Items (Table No : ${FirstTables.selectedTableNo} )',
          style: TextStyle(
            fontSize: 20.0,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SelectedItemsListWidget(
                selectedItemsMap: ItemList.selectedItemsMap),
            Row(
              children: [
                Checkbox(
                  value: printKOT,
                  onChanged: (value) {
                    setState(() {
                      printKOT = value!;
                    });
                  },
                ),
                const Text(
                  'Print KOT in kitchen',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: const Color(0xffff8906),
        child: InkWell(
          onTap: () {
            _showConfirmationDialog();
          },
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                'Confirm Order',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            titlePadding: const EdgeInsets.all(0),
            // contentPadding: EdgeInsets.zero,
            title: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  // Set the background color of the header
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                      colors: [Color(0XFFFF4D00), Color(0XFFFFB800)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              // color: Colors.deepOrange,
              height: 100,
              width: 130,
              child: const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Customer Information',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: tableController,
                  autovalidateMode: AutovalidateMode.always,
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: 'Table',
                      // hintText: '${FirstTables.selectedTableNo}',
                      labelStyle: TextStyle(fontSize: 17, color: Colors.black)),
                  style: const TextStyle(color: Colors.black),
                  //keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contactController,
                  decoration: const InputDecoration(
                      labelText: 'Contact Number',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black)),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400]),
                      onPressed: () {
                        // Handle cancel logic here
                        Navigator.of(context).pop(); // Close the dialog
                        // _showCancelDialog();
                      },
                      child: const Text('Cancel',
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        side: const BorderSide(
                            width: 3, color: Colors.deepOrange),
                      ),
                      onPressed: () {
                        // Handle submit logic here
                        Navigator.of(context).pop(); // Close the dialog
                        _showSuccessDialog();
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          // titlePadding: EdgeInsets.all(50),
          // title: Text('Success'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                  child: Text(
                ' Success',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              )),
              const SizedBox(height: 16),
              const Center(
                  child: Text(' Your KOT is saved.',
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w400))),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    side: const BorderSide(width: 3, color: Colors.deepOrange),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the success dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Tables()),
                    );
                  },
                  child: const Text('Got It',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SelectedItemsListWidget extends StatefulWidget {
  final Map<String, int> selectedItemsMap;

  SelectedItemsListWidget({required this.selectedItemsMap});

  @override
  State<SelectedItemsListWidget> createState() =>
      _SelectedItemsListWidgetState();
}

class _SelectedItemsListWidgetState extends State<SelectedItemsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total items : ${widget.selectedItemsMap.length}',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 8.0),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.selectedItemsMap.length,
              itemBuilder: (context, index) {
                final itemName = widget.selectedItemsMap.keys.toList()[index];
                final itemCount = widget.selectedItemsMap[itemName];
                // final itemCount = _counters[itemName] ?? 0;
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$itemName',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 120.0,
                            height: 48.0,
                            // padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFFe6dddc)),
                                // width: 2.0,

                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.grey[300]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      widget.selectedItemsMap[itemName] =
                                          (itemCount ?? 0) - 1;
                                    });
                                    print(
                                        'Decremented count: ${itemCount ?? 0}');
                                  },
                                  iconSize:
                                      18.0, // Adjust the icon size as needed
                                ),
                                Text(
                                  '$itemCount',
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      widget.selectedItemsMap[itemName] =
                                          (itemCount ?? 0) + 1;
                                    });
                                    print(
                                        'Incremented count: ${itemCount ?? 0}');
                                  },
                                  iconSize:
                                      18.0, // Adjust the icon size as needed
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
