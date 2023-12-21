import 'package:flutter/material.dart';
import 'package:kot/item/items.dart';

import '../table_engaged/table.dart';

class kotnoPage extends StatelessWidget {
  const kotnoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5.0,
        toolbarHeight: 120,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
        ),
        title: const Text(
          'Table No.01',
          style: TextStyle(
            fontSize: 22.0,
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
      body: const kotPage(),
    );
  }
}

class kotPage extends StatefulWidget {
  const kotPage({super.key});

  @override
  State<kotPage> createState() => _kotPageState();
}

class _kotPageState extends State<kotPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Text(
                'KOT No.01',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 90,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the success dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemList()),
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                _showCancelDialog();
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 38),
          child: Text(
            '1 x Thai Vegetable Soup',
            style: TextStyle(fontSize: 19),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 38),
          child: Text(
            '1 x Thai Vegetable Soup',
            style: TextStyle(fontSize: 19),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 38),
          child: Text(
            '1 x Thai Vegetable Soup',
            style: TextStyle(fontSize: 19),
          ),
        ),
      ],
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
            width: 100,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Cancel KOT',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password *',
                    labelStyle: TextStyle(fontSize: 17, color: Colors.black)),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                    labelText: 'Reason * ',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black)),
                keyboardType: TextInputType.text,
              ),
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
                      side:
                          const BorderSide(width: 3, color: Colors.deepOrange),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tables()),
                      );
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
        );
      },
    );
  }
}
