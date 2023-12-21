import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

import 'items.dart';

class ItemMenuWidget extends StatefulWidget {
  final String rupees;
  final String pName;

  const ItemMenuWidget({
    super.key,
    required this.rupees,
    required this.pName,
  });
  void addItem(String itemName, int itemCount) {
    ItemList.selectedItemsMap[itemName] = itemCount;
  }

  void removeItem(String itemName) {
    ItemList.selectedItemsMap.remove(itemName);
  }

  @override
  State<ItemMenuWidget> createState() => _ItemMenuWidgetState();
}

//ItemMenuWidget (Stateful) used to transform to  ItemMenuMetaWidget(when count is 0)
// ItemOrderWidget(when count >0)

class _ItemMenuWidgetState extends State<ItemMenuWidget> {
  bool isOrder = false;
  num count = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: count != 0
          ? ItemOrderWidget(
              pName: widget.pName,
              count: count,
              onTapReduce: () {
                setState(() {
                  count--;
                  if (count == 0) {
                    widget.removeItem(widget.pName);
                  }
                });
              },
            )
          : ItemMenuMetaWidget(rupees: widget.rupees, pName: widget.pName),
      onTap: () {
        setState(() {
          count++;
          // Add the item to the selectedItemsMap when increasing count
          widget.addItem(widget.pName, count.toInt());
        });
      },
    );
  }
}

//first displaying card with no buttons
class ItemMenuMetaWidget extends StatelessWidget {
  final String rupees;
  final String pName;
  const ItemMenuMetaWidget(
      {super.key, required this.rupees, required this.pName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 55.0, right: 10, top: 5.0, left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(rupees,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                pName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Second displaying card with  2 buttons
class ItemOrderWidget extends StatelessWidget {
  final String pName;
  final num count;
  final VoidCallback onTapReduce;
  const ItemOrderWidget(
      {super.key,
      required this.pName,
      required this.count,
      required this.onTapReduce});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 0,
          top: 0,
          right: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      pName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14.0),
                      // topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      // bottomRight: Radius.circular(1.0)
                    ),

                    // border: Border(
                    //     top: BorderSide(color: Colors.redAccent, width: 2),
                    //     right: BorderSide(color: Colors.green, width: 4))
                  ),
                  child: Center(
                    child: Text(count.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                  width: 30,
                  height: 30,
                ),
                // ],
                // mainAxisAlignment: MainAxisAlignment.end,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.white,
            //           // primary: selectedGender == Gender.male
            //           //     ? Colors.deepOrange
            //           //     : Colors.white,
            //           // use the current background color
            //         ),
            //         onPressed: () {
            //
            //           onTapReduce();
            //         },
            //         child: Icon(
            //           Icons.remove,
            //           color: Colors.black,
            //           // color: _icon ? Colors.deepOrange : Colors.white,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.white,
            //           // use the current background color
            //         ),
            //         onPressed: () {
            //           selectedGender = Gender.female;
            //           // _icon = !_icon;
            //         },
            //         child: Icon(
            //           Icons.more_horiz,
            //           color: Colors.black,
            //           // color: _icon ? Colors.white : Colors.deepOrange,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onTapReduce();
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        border: Border.all(color: Colors.deepOrange),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          // bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        // color: _icon ? Colors.white : Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
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
                                      colors: [
                                        Color(0XFFFF4D00),
                                        Color(0XFFFFB800)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)),
                              // color: Colors.deepOrange,
                              height: 60,
                              width: 50,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    ' Add Notes',
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  style: const TextStyle(fontSize: 18),
                                  maxLines: 4,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    labelText: 'Notes',
                                    labelStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey),
                                  ),
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[400]),
                                        onPressed: () {
                                          // Handle cancel logic here
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                          // _showCancelDialog();
                                        },
                                        child: const Text('Cancel',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16)),
                                      ),
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.deepOrange,
                                          side: const BorderSide(
                                              width: 3,
                                              color: Colors.deepOrange),
                                        ),
                                        onPressed: () {
                                          // Handle submit logic here
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: const Text(
                                          'Submit',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrange),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.deepOrange,
                        // color: _icon ? Colors.white : Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InkWellBox extends StatelessWidget {
  String rupees;
  String pName;

  InkWellBox({required this.rupees, required this.pName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 55.0, right: 10, top: 5.0, left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(rupees,
                          style: const TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                Text(
                  pName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
